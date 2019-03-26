library(dynpanel)


### Name: dynpanel-package
### Title: Dynamic Panel Data Models
### Aliases: dynpanel-package dynpanel

### ** Examples

 # Load data
 data(Produc)
 # Fit the dynamic panel data using the Arellano Bond (1991) instruments
 reg<-dpd(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp,Produc,index=c("state","year"),1,4)
 summary(reg)
 # Fit the dynamic panel data using an automatic selection of appropriate IV matrix
 #reg<-dpd(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp,Produc,index=c("state","year"),1,0)
 #summary(reg)
 # Fit the dynamic panel data using the GMM estimator with the smallest set of instruments
 #reg<-dpd(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp,Produc,index=c("state","year"),1,1)
 #summary(reg)
 # Fit the dynamic panel data using a reduced form of IV from method 3
 #reg<-dpd(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp,Produc,index=c("state","year"),1,2)
 #summary(reg)
 # Fit the dynamic panel data using the IV matrix where the number of moments grows with kT
 # K: variables number and T: time per group
 #reg<-dpd(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp,Produc,index=c("state","year"),1,3)
 #summary(reg)



