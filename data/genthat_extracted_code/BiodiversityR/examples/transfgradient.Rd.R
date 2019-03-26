library(BiodiversityR)


### Name: transfgradient
### Title: Gradient for Hypothetical Example of Turover of Species
###   Composition
### Aliases: transfgradient
### Keywords: datasets

### ** Examples

data(transfspecies)
data(transfgradient)
plot(transfspecies[,1]~transfgradient[,1],xlab="gradient",
    ylab="species abundance",type="n",ylim=c(0.5,8.5))
for (i in 1:9) {points(transfgradient[,1],transfspecies[,i],type="o",pch=i)}



