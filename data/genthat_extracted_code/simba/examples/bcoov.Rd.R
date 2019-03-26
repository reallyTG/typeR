library(simba)


### Name: bcoov
### Title: Calculate Bray-Curtis distance for only one variable
### Aliases: bcoov
### Keywords: methods univar

### ** Examples

data(abis)
names(abis.env) ##take a look at the data
##calculate the similarity (Bray-Curtis) between the plots 
##regarding pH
pH.dist <- bcoov(abis.env$pH, names=rownames(abis.env))

## directly give it as a list (data.frame)
pH.dist.ls <- bcoov(abis.env$pH, names=rownames(abis.env)
, listout=TRUE)




