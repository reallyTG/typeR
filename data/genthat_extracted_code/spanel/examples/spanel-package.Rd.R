library(spanel)


### Name: spanel-package
### Title: Spatial Panel Data Models
### Aliases: spanel-package spanel

### ** Examples

 # Load data
 data(Produc)
 data("usaww")
 # fit the fixed function
 fx<-span(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp,Produc,usaww,n=48,t=17,model="fe")
 # fit the random function
 summary(fx)
 #fit the between function
 be<-span(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp,Produc,usaww,n=48,t=17,model="be")
 summary(be)
 # fit the random function
 ran<-span(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp,Produc,usaww,n=48,t=17,model="re")
 summary(ran)



