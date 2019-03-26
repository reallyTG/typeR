library(approximator)


### Name: hdash.fun
### Title: Hdash
### Aliases: hdash.fun
### Keywords: array

### ** Examples

data(toyapps)
hdash.fun(x=1:3 , hpa=hpa.toy,basis=basis.toy)

uu <- rbind(1:3,1,1:3,3:1)
rownames(uu) <- paste("uu",1:4,sep="_")
hdash.fun(x=uu, hpa=hpa.toy,basis=basis.toy)




