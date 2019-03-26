library(lifecontingencies)


### Name: lifetable-class
### Title: Class '"lifetable"'
### Aliases: lifetable-class coerce,data.frame,lifetable-method
###   coerce,lifetable,data.frame-method coerce,lifetable,numeric-method
###   coerce,lifetable,markovchainList-method getOmega,lifetable-method
###   head,lifetable-method initialize,lifetable-method
###   plot,lifetable,ANY-method print,lifetable-method
###   show,lifetable-method summary,lifetable-method tail,lifetable-method
### Keywords: classes

### ** Examples

showClass("lifetable")
data(soa08)
summary(soa08)
#the last attainable age under SOA life table is
getOmega(soa08) 
#head and tail
data(soaLt)
tail(soaLt)
head(soaLt)



