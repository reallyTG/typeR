library(qle)


### Name: predictKM
### Title: Kriging the sample means of statistics
### Aliases: predictKM varKM extract

### ** Examples

data(normal)
X <- as.matrix(qsd$qldata[,1:2])
p <- c("mu"=2,"sd"=1)

# get simulated statistics at design X
Tstat <- qsd$qldata[grep("^mean[.]",names(qsd$qldata))]

# predict and extract 
predictKM(qsd$covT,p,X,Tstat)

# prediction variances
varKM(qsd$covT,p,X,Tstat)




