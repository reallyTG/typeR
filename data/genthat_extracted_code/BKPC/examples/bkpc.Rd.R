library(BKPC)


### Name: bkpc
### Title: Bayesian Kernel Projection Classifier
### Aliases: bkpc bkpc.default bkpc.kern bkpc.kernelMatrix
### Keywords: neural nonlinear classif

### ** Examples


set.seed(-88106935)

data(microarray)

# consider only four tumour classes (NOTE: "NORM" is not a class of tumour)
y <- microarray[, 2309]
train <- as.matrix(microarray[y != "NORM", -2309])
wtr <- factor(microarray[y != "NORM", 2309], levels = c("BL" ,  "EWS" , "NB" ,"RMS" ))

n.kpc <- 6
n.class <- length(levels(wtr)) - 1

K <- gaussKern(train)$K

# supply starting values for the parameters
# use Gaussian kernel as input

result <- bkpc(K, y = wtr, n.iter = 1000,  thin = 10, n.kpc = n.kpc,  
initSigmasq = 0.001, initBeta = matrix(10, n.kpc *n.class, 1), 
initTau =matrix(10, n.kpc * n.class, 1), intercept = FALSE, rotate = TRUE)

# predict

out <- predict(result, n.burnin = 10) 

table(out$class, as.numeric(wtr))

# plot the data projection on the kernel principal components

pairs(result$kPCA$KPCs[, 1 : n.kpc], col = as.numeric(wtr), 
main =  paste("symbol = predicted class", "\n", "color = true class" ), 
pch = out$class, upper.panel = NULL)
par(xpd=TRUE)
legend('topright', levels(wtr), pch = unique(out$class), 
text.col = as.numeric(unique(wtr)), bty = "n")




# Another example: Iris data

data(iris)
testset <- sample(1:150,50)

train <- as.matrix(iris[-testset,-5])
test <- as.matrix(iris[testset,-5])

wtr <- iris[-testset, 5]
wte <- iris[testset, 5]

# use default starting values for paramteres in the model.

result <- bkpc(train, y = wtr,  n.iter = 1000,  thin = 10, n.kpc = 2, 
intercept = FALSE, rotate = TRUE)

# predict
out <- predict(result, test, n.burnin = 10) 

# classification rate
sum(out$class == as.numeric(wte))/dim(test)[1]

table(out$class, as.numeric(wte))

## Not run: 
##D # Another example: synthetic data from MASS library
##D 
##D library(MASS)
##D 
##D train<- as.matrix(synth.tr[, -3])
##D test<- as.matrix(synth.te[, -3])
##D 
##D wtr <- as.factor(synth.tr[, 3])
##D wte <- as.factor(synth.te[, 3])
##D 
##D 
##D #  make training set kernel using kernelMatrix from kernlab library
##D 
##D library(kernlab)
##D 
##D kfunc <- laplacedot(sigma = 1)
##D Ktrain <- kernelMatrix(kfunc, train)
##D 
##D #  make testing set kernel using kernelMatrix {kernlab}
##D 
##D Ktest <- kernelMatrix(kfunc, test, train)
##D 
##D result <- bkpc(Ktrain, y = wtr, n.iter = 1000,  thin = 10,  n.kpc = 3, 
##D intercept = FALSE, rotate = TRUE)
##D 
##D # predict
##D 
##D out <- predict(result, Ktest, n.burnin = 10) 
##D 
##D # classification rate
##D 
##D sum(out$class == as.numeric(wte))/dim(test)[1]
##D table(out$class, as.numeric(wte))
##D 
##D 
##D # embed data from the testing set on the new space:
##D 
##D KPCtest <- predict(result$kPCA, Ktest)
##D 
##D # new data is linearly separable in the new feature space where classification takes place
##D library(rgl)
##D plot3d(KPCtest[ , 1 :  3], col = as.numeric(wte))
##D 
##D 
##D # another model:  do not project the data to the principal axes of the feature space. 
##D # NOTE: Slow
##D # use Gaussian kernel with the default bandwidth parameter
##D 
##D Ktrain <- gaussKern(train)$K
##D 
##D Ktest <- gaussKern(train, test, theta = gaussKern(train)$theta)$K
##D 
##D resultBKMC <- bkpc(Ktrain, y = wtr, n.iter = 1000,  thin = 10,  
##D intercept = FALSE, rotate = FALSE)
##D 
##D # predict
##D outBKMC <- predict(resultBKMC, Ktest, n.burnin = 10)
##D 
##D # to compare with previous model
##D table(outBKMC$class, as.numeric(wte))
##D 
##D 
##D # another example: wine data from gclus library
##D 
##D library(gclus)
##D data(wine)
##D 
##D testset <- sample(1 : 178, 90)
##D train <- as.matrix(wine[-testset, -1])
##D test <- as.matrix(wine[testset, -1])
##D 
##D wtr <- as.factor(wine[-testset, 1])
##D wte <- as.factor(wine[testset, 1])
##D 
##D #  make training set kernel using kernelMatrix from kernlab library
##D 
##D kfunc <- anovadot(sigma = 1, degree = 1)
##D Ktrain <- kernelMatrix(kfunc, train)
##D 
##D #  make testing set kernel using kernelMatrix {kernlab}
##D Ktest <- kernelMatrix(kfunc, test, train)
##D 
##D result <- bkpc(Ktrain, y = wtr, n.iter = 1000,  thin = 10,  n.kpc = 3, 
##D intercept = FALSE, rotate = TRUE)
##D 
##D out <- predict(result, Ktest, n.burnin = 10) 
##D 
##D # classification rate in the test set
##D sum(out$class == as.numeric(wte))/dim(test)[1]
##D 
##D 
##D # embed data from the testing set on the new space:
##D KPCtest <- predict(result$kPCA, Ktest)
##D 
##D # new data is linearly separable in the new feature space where classification takes place
##D 
##D 
##D pairs(KPCtest[ , 1 :  3], col = as.numeric(wte), 
##D main =  paste("symbol = predicted class", "\n", "color = true class" ), 
##D pch = out$class, upper.panel = NULL)
##D 
##D par(xpd=TRUE)
##D 
##D legend('topright', levels(wte), pch = unique(out$class), 
##D text.col = as.numeric(unique(wte)), bty = "n")
##D 
##D 
## End(Not run)



