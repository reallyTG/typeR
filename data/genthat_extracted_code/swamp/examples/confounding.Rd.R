library(swamp)


### Name: confounding
### Title: Heatmap of interrelation of sample annotations
### Aliases: confounding
### Keywords: htest

### ** Examples

# patient annotations as a data.frame, annotations should be numbers and factors
# but not characters.
set.seed(200)
o<-data.frame(Factor1=factor(c(rep("A",25),rep("B",25))),
              Factor2=factor(rep(c("A","B"),25)),
              Factor3=factor(c(rep("X",15),rep("Y",20),rep("Z",15))),
              Numeric1=rnorm(50))
              
## calculate and plot interrelations
res4<-confounding(o,method="fisher")





