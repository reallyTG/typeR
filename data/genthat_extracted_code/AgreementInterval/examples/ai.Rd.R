library(AgreementInterval)


### Name: ai
### Title: ai
### Aliases: ai

### ** Examples

ai(x=1:4, y=c(1, 1, 2, 4))
a <- c(1, 2, 3, 4, 7)
b <- c(1, 3, 2, 5, 3)
ai(x=a, y=b)
ai(x=IPIA$Tomography, y=IPIA$Urography)
ai(x=IPIA$Tomography, y=IPIA$Urography, clin.limit=c(-15, 15))



