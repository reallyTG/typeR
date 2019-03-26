library(ACDm)


### Name: testTVACD
### Title: LM test against Time-Varying ACD models (Meitz and Terasvirta,
###   2006)
### Aliases: testTVACD

### ** Examples

fitModel5000obs <- acdFit(adjDurData[1:5000,])
testTVACD(fitModel5000obs, K = 2, type = "total", robust = TRUE)

testTVACD(fitModel5000obs, K = 2, type = "intraday", robust = TRUE)




