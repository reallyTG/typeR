library(nontarget)


### Name: rm.sat
### Title: Removal of satellite peaks from FT-MS peak lists
### Aliases: rm.sat

### ** Examples

## No test: 
data(peaklist);
peaklist<-rm.sat(peaklist,dmz=0.3,drt=0.1,intrat=0.015,spar=0.8,corcut=-1000,plotit=TRUE);
peaklist<-peaklist[peaklist[,4],1:3];
## End(No test)



