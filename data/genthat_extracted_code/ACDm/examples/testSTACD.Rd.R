library(ACDm)


### Name: testSTACD
### Title: LM test against Smooth Transition ACD models (Meitz and
###   Terasvirta, 2006)
### Aliases: testSTACD

### ** Examples

fitModel3000obs <- acdFit(adjDurData[1:3000,])
testSTACD(fitModel3000obs, K = 2, robust = TRUE)




