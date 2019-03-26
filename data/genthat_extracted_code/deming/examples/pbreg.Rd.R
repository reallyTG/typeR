library(deming)


### Name: pbreg
### Title: Passing-Bablock regressin
### Aliases: pbreg
### Keywords: models regression robust

### ** Examples

afit1 <- pbreg(aes ~ aas, data= arsenate)
afit2 <- pbreg(aas ~ aes, data= arsenate)
rbind(coef(afit1), coef(afit2))  # symmetric results
1/coef(afit1)[2]



