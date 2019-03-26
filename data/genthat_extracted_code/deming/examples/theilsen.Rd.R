library(deming)


### Name: theilsen
### Title: Thiel-Sen regression
### Aliases: theilsen
### Keywords: models regression robust

### ** Examples

afit1 <- theilsen(aes ~ aas, symmetric=TRUE, data= arsenate)
afit2 <- theilsen(aas ~ aes, symmetric=TRUE, data= arsenate)
rbind(coef(afit1), coef(afit2))  # symmetric results
1/coef(afit1)[2]



