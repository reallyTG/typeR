library(asbio)


### Name: bootstrap
### Title: A simple function for bootstrapping
### Aliases: bootstrap print.bootstrap
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

bootstrap(site18[,1],SW,R=1000,matrix=FALSE)



