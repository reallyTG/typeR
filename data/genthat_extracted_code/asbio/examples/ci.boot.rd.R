library(asbio)


### Name: ci.boot
### Title: Bootstrap confidence intervals
### Aliases: ci.boot print.ciboot
### Keywords: manip

### ** Examples



data(vs)
# A partial set of observations from a single plot for a Scandinavian 
# moss/vascular plant/lichen survey.
site18<-t(vs[1,])

#Shannon-Weiner diversity
SW<-function(data){
d<-data[data!=0]
p<-d/sum(d)
-1*sum(p*log(p))
}

b <- bootstrap(site18[,1],SW)
ci.boot(b)



