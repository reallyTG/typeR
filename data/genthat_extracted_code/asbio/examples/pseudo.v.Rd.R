library(asbio)


### Name: pseudo.v
### Title: Jacknife pseudo-values
### Aliases: pseudo.v
### Keywords: manip

### ** Examples

data(cliff.sp)
siteCD1<-data.frame(t(cliff.sp[1,]))

#Shannon-Weiner diversity
SW<-function(data){
d<-data[data!=0]
p<-d/sum(d)
-1*sum(p*log(p))
}

pv<-pseudo.v(siteCD1,SW)



