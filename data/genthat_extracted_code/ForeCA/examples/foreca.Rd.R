library(ForeCA)


### Name: foreca
### Title: Forecastable Component Analysis
### Aliases: foreca foreca.multiple_weightvectors foreca.one_weightvector
### Keywords: iteration

### ** Examples

XX <- diff(log(EuStockMarkets[c(100:200),])) * 100
plot(ts(XX))
## Not run: 
##D ff <- foreca(XX[,1:4], n.comp = 2, plot = TRUE)
##D ff
##D summary(ff)
##D plot(ff)
## End(Not run)


PW <- whiten(XX)
one.weight.em <- foreca.one_weightvector(U = PW$U,
                                        dewhitening = PW$dewhitening,
                                        algorithm.control = 
                                          list(num.starts = 2,
                                               type = "EM"),
                                        spectrum.control = 
                                          list(method = 'wosa'))
plot(one.weight.em)

## Not run: 
##D 
##D PW <- whiten(XX)
##D ff <- foreca.multiple_weightvectors(PW$U, n.comp = 2,
##D                                     dewhitening = PW$dewhitening)
##D ff
##D plot(ff$scores)
## End(Not run)



