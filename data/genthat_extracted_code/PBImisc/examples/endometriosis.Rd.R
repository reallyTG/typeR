library(PBImisc)


### Name: endometriosis
### Title: Endometriosis study
### Aliases: endometriosis
### Keywords: endometriosis

### ** Examples

data(endometriosis)
library(lattice)
xyplot(log(alpha.factor)~log(beta.factor)|disease*phase, 
            data=endometriosis, type=c("p", "r"))
summary(aov(alpha.factor~beta.factor*disease*phase, data=endometriosis))



