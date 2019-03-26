library(ChainLadder)


### Name: print.clark
### Title: Print results of Clark methods
### Aliases: print.clark print.ClarkLDF print.ClarkCapeCod
### Keywords: methods print

### ** Examples

X <- GenIns
colnames(X) <- 12*as.numeric(colnames(X))
y <- ClarkCapeCod(X, Premium=10000000+400000*0:9, maxage=240)
summary(y) 
print(y)  # (or simply 'y') Same as summary(y) but with "pretty formats"

## Greater growth factors when projecting to infinite maximum age
ClarkCapeCod(X, Premium=10000000+400000*0:9, maxage=Inf)




