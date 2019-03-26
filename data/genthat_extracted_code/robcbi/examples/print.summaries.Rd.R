library(robcbi)


### Name: robust.print.summaries
### Title: Print methods for objects of class "cubinf", "cubinf.i",
###   "summary.cubinf" or "glm.i"
### Aliases: print.cubinf print.cubinf.i print.summary.cubinf print.glm.i
### Keywords: stats

### ** Examples

library(robcbi)
 
## Dobson (1990) Page 93: Randomized Controlled Trial :
 counts <- c(18,17,15,20,10,20,25,13,12)
 outcome <- gl(3,1,9)
 treatment <- gl(3,3)
 print(d.AD <- data.frame(treatment, outcome, counts))
 zD93 <- glm(counts ~ outcome + treatment, family=poisson,method="cubinf",ufact=3.2)
 summary(zD93)
 print(zD93)
 wi <- weights(zD93)
 print(wi)



