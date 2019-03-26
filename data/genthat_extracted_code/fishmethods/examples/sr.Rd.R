library(fishmethods)


### Name: sr
### Title: Estimation and Model Comparison of Stock-Recruitment
###   Relationships
### Aliases: sr
### Keywords: misc

### ** Examples

 ## Not run: 
##D data(striper)
##D outs<-sr(recruits=striper$recruits,stock=striper$stock,select=2,model=c(5,6,7,8),
##D          initial=list(RA=5e3,RB=2e-5,Rrho=0.1,
##D                       BHA=8e3,BHB=1e8,BHrho=0.1,
##D                       SHA=1.5e3,SHB=5.6e8,SHC=1,
##D                       DSA=9e3,DSB=9e-5,DSC=-1.14,
##D                       MYA=1e6,MYB=1e5,MYC=0.4),plot=TRUE)
## End(Not run)



