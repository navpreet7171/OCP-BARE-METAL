$TTL 1W
@	IN	SOA	ns1.example.com.	root (
			2019070700	; serial
			3H		; refresh (3 hours)
			30M		; retry (30 minutes)
			2W		; expiry (2 weeks)
			1W )		; minimum (1 week)
	IN	NS	ns1.example.com.
;
;
ns1.example.com.		IN	A	192.168.1.5
;
helper.example.com.		IN	A	192.168.1.5
helper.ocp4.example.com.	IN	A	192.168.1.5
;
api.ocp4.example.com.		IN	A	192.168.1.5 
api-int.ocp4.example.com.	IN	A	192.168.1.5 
;
*.apps.ocp4.example.com.	IN	A	192.168.1.5 
;
bootstrap.ocp4.example.com.	IN	A	192.168.1.96 
;
control-plane0.ocp4.example.com.	IN	A	192.168.1.97
control-plane1.ocp4.example.com.	IN	A	192.168.1.98 
control-plane2.ocp4.example.com.	IN	A	192.168.1.99 
;
compute0.ocp4.example.com.	IN	A	192.168.1.11
compute1.ocp4.example.com.	IN	A	192.168.1.7
;
etcd-0.ocp4.example.com.    IN    A     192.168.1.97
etcd-1.ocp4.example.com.    IN    A     192.168.1.98
etcd-2.ocp4.example.com.    IN    A     192.168.1.99

;
_etcd-server-ssl._tcp.ocp4.example.com.    86400     IN    SRV     0    10    2380    etcd-0.ocp4
_etcd-server-ssl._tcp.ocp4.example.com.    86400     IN    SRV     0    10    2380    etcd-1.ocp4
_etcd-server-ssl._tcp.ocp4.example.com.    86400     IN    SRV     0    10    2380    etcd-2.ocp4

oauth-openshift.apps.ocp4.example.com.     IN     A     192.168.1.5
console-openshift-console.apps.ocp4.example.com.     IN     A     192.168.1.5
;EOF
