library(ordPens)


### Name: ICFCoreSetCWP
### Title: ICF core set for chronic widespread pain
### Aliases: ICFCoreSetCWP
### Keywords: models regression

### ** Examples

# load the data
data(ICFCoreSetCWP)

# available variables
names(ICFCoreSetCWP)

# adequate coding of x matrix (using levels 1,2,...)
p <- ncol(ICFCoreSetCWP) - 1
n <- nrow(ICFCoreSetCWP)
add <- c(rep(1,50),rep(5,16),1)
add <- matrix(add,n,p,byrow=TRUE)
x <- ICFCoreSetCWP[,1:p] + add

# make sure that also a coefficient is fitted for levels
# that are not observed in the data
addrow <- c(rep(5,50),rep(9,16),5)
x <- rbind(x,addrow)
y <- c(ICFCoreSetCWP$phcs,NA)

# some lambda values
lambda <- c(600,500,400,300,200,100)

# smoothing and selection
modelICF <- ordSelect(x = x, y = y, lambda = lambda)

# results
plot(modelICF)

# plot a selected ICF category (e.g. e1101 'drugs')
# with adequate class labels
plot(modelICF, whichx = 51, xaxt = "n")
axis(side = 1, at = 1:9, labels = -4:4)



