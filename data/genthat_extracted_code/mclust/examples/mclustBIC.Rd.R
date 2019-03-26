library(mclust)


### Name: mclustBIC
### Title: BIC for Model-Based Clustering
### Aliases: mclustBIC EMclust print.mclustBIC
### Keywords: cluster

### ** Examples

irisBIC <- mclustBIC(iris[,-5])
irisBIC
plot(irisBIC)

## Not run: 
##D subset <- sample(1:nrow(iris), 100)
##D irisBIC <- mclustBIC(iris[,-5], initialization=list(subset = subset))
##D irisBIC
##D plot(irisBIC)
##D 
##D irisBIC1 <- mclustBIC(iris[,-5], G=seq(from=1,to=9,by=2), 
##D                     modelNames=c("EII", "EEI", "EEE"))
##D irisBIC1
##D plot(irisBIC1)
##D irisBIC2  <- mclustBIC(iris[,-5], G=seq(from=2,to=8,by=2), 
##D                        modelNames=c("VII", "VVI", "VVV"), x= irisBIC1)
##D irisBIC2
##D plot(irisBIC2)
## End(Not run)

nNoise <- 450
set.seed(0)
poissonNoise <- apply(apply( iris[,-5], 2, range), 2, function(x, n) 
                      runif(n, min = x[1]-.1, max = x[2]+.1), n = nNoise)
set.seed(0)
noiseInit <- sample(c(TRUE,FALSE),size=nrow(iris)+nNoise,replace=TRUE,
                    prob=c(3,1))
irisNdata <- rbind(iris[,-5], poissonNoise)
irisNbic <- mclustBIC(data = irisNdata, G = 1:5,
                      initialization = list(noise = noiseInit))
irisNbic
plot(irisNbic)



