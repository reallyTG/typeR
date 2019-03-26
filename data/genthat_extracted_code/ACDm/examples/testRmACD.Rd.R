library(ACDm)


### Name: testRmACD
### Title: LM test of no Remaining ACD (Meitz and Terasvirta, 2006)
### Aliases: testRmACD

### ** Examples

fitModel3000obs <- acdFit(adjDurData[1:3000,])
testRmACD(fitModel3000obs, pStar = 2, robust = TRUE)



