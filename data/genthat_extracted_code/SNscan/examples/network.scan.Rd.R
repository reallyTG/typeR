library(SNscan)


### Name: network.scan
### Title: Network Scan Statistic
### Aliases: network.scan
### Keywords: scanning method

### ** Examples

data(karate)

ks=network.scan(g=karate,radius=3,attribute=NULL,
	model="pois.stat",pattern="structure")	
mc.ks=network.mc.scan(n=9,g=karate,radius=3,attribute=NULL,
	model="pois.stat",pattern="structure")	
pv=mcpv.function(obs.stat=ks[,3],ms.stat=mc.ks[,3],direction=">=")



