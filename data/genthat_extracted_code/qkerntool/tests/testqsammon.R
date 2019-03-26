
#####################################################
data("iris")
train <- as.matrix(iris[,1:4])
labeltrain<- as.integer(iris[,5])
#######
par(mfrow = c(3,4))

#system.time(kpc2 <- qsammon(train,kernel = "laplbase", qpar = list(sigma = 1, q = 0.9), dims = 2, Initialisation = 'pca'))
#plot(dimRed(kpc2), col = as.integer(labeltrain), main = "qsammon_laplbase:sigma=1000,q=0.9", xlab="1st Principal Component",ylab="2nd Principal Component")

#kpc2 <- qsammon(train,kernel = "rbfbase", qpar = list(sigma = 2.2, q = 0.8), dims = 2, Initialisation = 'pca')
#plot(dimRed(kpc2), col = as.integer(labeltrain), main = "qsammon_rbfbase:sigma=2,q=0.8", xlab="1st Principal Component",ylab="2nd Principal Component")

#kpc2 <- qsammon(train,kernel = "rbfbase", qpar = list(sigma = 1000, q = 0.8), dims = 2, Initialisation = 'pca')
#plot(dimRed(kpc2), col = as.integer(labeltrain), main = "qsammon_rbfbase:sigma=1000,q=0.8", xlab="1st Principal Component",ylab="2nd Principal Component")

## S4 method for signature 'matrix'
system.time(kpc2 <- qsammon(train,kernel = "rbfbase", qpar = list(sigma = 2, q = 0.9), dims = 2, Initialisation = 'pca', TolFun = 1e-5))
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

system.time(kpc2 <- qsammon(train,kernel = "nonlbase", qpar = list(alpha=0.01,q=0.5), dims = 2, Initialisation = 'pca', TolFun = 1e-3))
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

system.time(kpc2 <- qsammon(train,kernel = "laplbase", qpar = list(sigma = 1.5, q = 0.8), dims = 2, Initialisation = 'pca', TolFun = 1e-3))
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)
######
kpc2 <- qsammon(train,kernel = "ratibase", qpar = list(c = 0.2, q = 0.09), dims = 2, Initialisation = 'pca', TolFun = 1e-3)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

system.time(kpc2 <- qsammon(train,kernel = "multbase", qpar = list(c = 1, q = 0.9), dims = 2, Initialisation = 'pca'))
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "invbase", qpar = list(c = 1, q = 0.5), dims = 2, Initialisation = 'pca', TolFun = 1e-3)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "wavbase", qpar = list(theta=1.35,q=0.99), dims = 2, Initialisation = 'pca', TolFun = 1e-3)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "powbase", qpar = list(d = 2, q = 0.9), dims = 2, Initialisation = 'pca', TolFun = 1e-3)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)
###
kpc2 <- qsammon(train,kernel = "logbase", qpar = list(d = 2, q = 0.9999), dims = 2, Initialisation = 'pca', TolFun = 1e-3)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)
###
kpc2 <- qsammon(train,kernel = "caubase", qpar = list(sigma = 0.5,q = 0.1), dims = 2, Initialisation = 'pca', TolFun = 1e-3)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)
###
kpc2 <- qsammon(train,kernel = "studbase", qpar = list(d = 0.4, q = 0.4), dims = 2, Initialisation = 'pca', TolFun = 1e-3)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)
###
kpc2 <- qsammon(train,kernel = "nonlcnd", qpar = list(alpha=0.03), dims = 2, Initialisation = 'pca', TolFun = 1e-3)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)
###
kpc2 <- qsammon(train,kernel = "polycnd", qpar = list(d = 1,alpha = 10, c=10), dims = 2, Initialisation = 'pca', TolFun = 1e-3)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "rbfcnd", qpar = list(gamma = 1), dims = 2, Initialisation = 'pca', TolFun = 1e-3)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "laplcnd", qpar = list(gamma = 5), dims = 2, Initialisation = 'pca', TolFun = 1e-3)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "anocnd", qpar = list(d = 1, sigma = 0.1), dims = 2, Initialisation = 'pca', TolFun = 1e-3)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "raticnd", qpar = list(c = 3), dims = 2, Initialisation = 'pca', TolFun = 1e-3)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "multcnd", qpar = list(c= 0.1), dims = 2, Initialisation = 'pca', TolFun = 1e-3)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "invcnd", qpar = list(c = 2), dims = 2, Initialisation = 'pca', TolFun = 1e-3)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "wavcnd", qpar = list(theta = 0.8), dims = 2, Initialisation = 'pca', TolFun = 1e-3)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "powcnd", qpar = list(d = 1), dims = 2, Initialisation = 'pca', TolFun = 1e-3)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "logcnd", qpar = list(d = 2), dims = 2, Initialisation = 'pca', TolFun = 1e-3)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "caucnd", qpar = list(gamma = 2), dims = 2, Initialisation = 'pca', TolFun = 1e-3)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

#kpc2 <- qsammon(train,kernel = "chicnd", qpar = list(), dims = 2, Initialisation = 'pca', TolFun = 1e-3)
#plot(dimRed(kpc2), col = as.integer(labeltrain))
#cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "studcnd", qpar = list(d = 2), dims = 2, Initialisation = 'pca', TolFun = 1e-3)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "rbfbase", qpar = list(sigma = 2, q = 0.9), dims = 2)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "nonlbase", qpar = list(alpha=0.01,q=0.2), dims = 2)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "laplbase", qpar = list(sigma = 1.5, q = 0.8), dims = 2)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "ratibase", qpar = list(c = 1, q = 0.8), dims = 2)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "multbase", qpar = list(c = 1, q = 0.9), dims = 2)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "invbase", qpar = list(c = 2, q = 0.8), dims = 2)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "wavbase", qpar = list(theta=1,q=0.8), dims = 2)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "powbase", qpar = list(d = 1, q = 0.9), dims = 2)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "logbase", qpar = list(d = 1, q = 0.9), dims = 2)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "caubase", qpar = list(sigma = 2,q = 0.8), dims = 2)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

#kpc2 <- qsammon(train,kernel = "chibase", qpar = list(gamma=3,q = 0.8), dims = 2)
#plot(dimRed(kpc2), col = as.integer(labeltrain))
#cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "studbase", qpar = list(d = 2, q = 0.8), dims = 2)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "nonlcnd", qpar = list(alpha=0.03), dims = 2)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "polycnd", qpar = list(d = 1,alpha = 10, c=10), dims = 2)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "rbfcnd", qpar = list(gamma = 3), dims = 2)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "laplcnd", qpar = list(gamma = 5), dims = 2)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "anocnd", qpar = list(d = 1, sigma = 0.1), dims = 2)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "raticnd", qpar = list(c = 3), dims = 2)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "multcnd", qpar = list(c= 0.1), dims = 2)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "invcnd", qpar = list(c = 2), dims = 2)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "wavcnd", qpar = list(theta = 0.8), dims = 2)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "powcnd", qpar = list(d = 1), dims = 2)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "logcnd", qpar = list(d = 1), dims = 2)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "caucnd", qpar = list(gamma = 2), dims = 2)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)

kpc2 <- qsammon(train,kernel = "studcnd", qpar = list(d = 1.8), dims = 2)
plot(dimRed(kpc2), col = as.integer(labeltrain))
cndkernf(kpc2)




## S4 method for signature 'qkernmatrix'
qkfunc <- rbfbase(sigma = 2, q = 0.9)
Ktrain2 <- qkernmatrix(qkfunc, train)
kpc3 <- qsammon(qkernel=qkfunc,Ktrain2, dims = 2)
plot(dimRed(kpc3), col = as.integer(labeltrain))

qkfunc <- nonlbase(alpha=0.1,q=0.9999)
Ktrain2 <- qkernmatrix(qkfunc, train)
kpc3 <- qsammon(qkernel=qkfunc,Ktrain2, dims = 2)
plot(dimRed(kpc3), col = as.integer(labeltrain))

qkfunc <- laplbase(sigma = 1.5, q = 0.8)
Ktrain2 <- qkernmatrix(qkfunc, train)
kpc3 <- qsammon(qkernel=qkfunc,Ktrain2, dims = 2)
plot(dimRed(kpc3), col = as.integer(labeltrain))

qkfunc <- ratibase(c = 10, q = 0.9)
Ktrain2 <- qkernmatrix(qkfunc, train)
kpc3 <- qsammon(qkernel=qkfunc,Ktrain2, dims = 2)
plot(dimRed(kpc3), col = as.integer(labeltrain))

qkfunc <- multbase(c = 1, q = 0.9)
Ktrain2 <- qkernmatrix(qkfunc, train)
kpc3 <- qsammon(qkernel=qkfunc,Ktrain2, dims = 2)
plot(dimRed(kpc3), col = as.integer(labeltrain))

qkfunc <- invbase(c = 2, q = 0.8)
Ktrain2 <- qkernmatrix(qkfunc, train)
kpc3 <- qsammon(qkernel=qkfunc,Ktrain2, dims = 2)
plot(dimRed(kpc3), col = as.integer(labeltrain))

qkfunc <- powbase(d = 2, q = 0.9)
Ktrain2 <- qkernmatrix(qkfunc, train)
kpc3 <- qsammon(qkernel=qkfunc,Ktrain2, dims = 2)
plot(dimRed(kpc3), col = as.integer(labeltrain))

qkfunc <- wavbase(theta=1.35,q=0.99)
Ktrain2 <- qkernmatrix(qkfunc, train)
kpc3 <- qsammon(qkernel=qkfunc,Ktrain2, dims = 2)
plot(dimRed(kpc3), col = as.integer(labeltrain))

qkfunc <- logbase(d = 1, q = 0.9)
Ktrain2 <- qkernmatrix(qkfunc, train)
kpc3 <- qsammon(qkernel=qkfunc,Ktrain2, dims = 2)
plot(dimRed(kpc3), col = as.integer(labeltrain))

qkfunc <- caubase(sigma = 2,q = 0.8)
Ktrain2 <- qkernmatrix(qkfunc, train)
kpc3 <- qsammon(qkernel=qkfunc,Ktrain2, dims = 2)
plot(dimRed(kpc3), col = as.integer(labeltrain))

qkfunc <- studbase(d = 2, q = 0.8)
Ktrain2 <- qkernmatrix(qkfunc, train)
kpc3 <- qsammon(qkernel=qkfunc,Ktrain2, dims = 2)
plot(dimRed(kpc3), col = as.integer(labeltrain))
cndkernf(kpc3)

Ktrain2 <- qkernmatrix(qkfunc, train)
kpc3 <- qsammon(qkernel=qkfunc,Ktrain2, k=4,dims = 2,Initialisation = 'pca')
plot(dimRed(kpc3), col = as.integer(labeltrain))
cndkernf(kpc3)

## S4 method for signature 'cndkernmatrix'
cndkfunc <- nonlcnd(alpha=0.04)
cndKtrain <- cndkernmatrix(cndkfunc, train)
kpc4 <- qsammon(cndkernel=cndkfunc, cndKtrain, dims = 2)
plot(dimRed(kpc4), col = as.integer(labeltrain))


cndkfunc <- polycnd(d = 1,alpha = 10, c=10)
cndKtrain <- cndkernmatrix(cndkfunc, train)
kpc4 <- qsammon(cndkernel=cndkfunc, cndKtrain, dims = 2)
plot(dimRed(kpc4), col = as.integer(labeltrain))

cndkfunc <- rbfcnd(gamma = 3)
cndKtrain <- cndkernmatrix(cndkfunc, train)
kpc4 <- qsammon(cndkernel=cndkfunc, cndKtrain, dims = 2)
plot(dimRed(kpc4), col = as.integer(labeltrain))

cndkfunc <- laplcnd(gamma = 5)
cndKtrain <- cndkernmatrix(cndkfunc, train)
kpc4 <- qsammon(cndkernel=cndkfunc, cndKtrain, dims = 2)
plot(dimRed(kpc4), col = as.integer(labeltrain))

cndkfunc <- anocnd(d = 1, sigma = 0.1)
cndKtrain <- cndkernmatrix(cndkfunc, train)
kpc4 <- qsammon(cndkernel=cndkfunc, cndKtrain, dims = 2)
plot(dimRed(kpc4), col = as.integer(labeltrain))

cndkfunc <- raticnd(c = 3)
cndKtrain <- cndkernmatrix(cndkfunc, train)
kpc4 <- qsammon(cndkernel=cndkfunc, cndKtrain, dims = 2)
plot(dimRed(kpc4), col = as.integer(labeltrain))

cndkfunc <- multcnd(c= 0.1)
cndKtrain <- cndkernmatrix(cndkfunc, train)
kpc4 <- qsammon(cndkernel=cndkfunc, cndKtrain, dims = 2)
plot(dimRed(kpc4), col = as.integer(labeltrain))

cndkfunc <- invcnd(c = 2)
cndKtrain <- cndkernmatrix(cndkfunc, train)
kpc4 <- qsammon(cndkernel=cndkfunc, cndKtrain, dims = 2)
plot(dimRed(kpc4), col = as.integer(labeltrain))

cndkfunc <- wavcnd(theta = 0.8)
cndKtrain <- cndkernmatrix(cndkfunc, train)
kpc4 <- qsammon(cndkernel=cndkfunc, cndKtrain, dims = 2)
plot(dimRed(kpc4), col = as.integer(labeltrain))

cndkfunc <- powcnd(d = 1)
cndKtrain <- cndkernmatrix(cndkfunc, train)
kpc4 <- qsammon(cndkernel=cndkfunc, cndKtrain, dims = 2)
plot(dimRed(kpc4), col = as.integer(labeltrain))

cndkfunc <- logcnd(d = 1)
cndKtrain <- cndkernmatrix(cndkfunc, train)
kpc4 <- qsammon(cndkernel=cndkfunc, cndKtrain, dims = 2)
plot(dimRed(kpc4), col = as.integer(labeltrain))

cndkfunc <- caucnd(gamma = 2)
cndKtrain <- cndkernmatrix(cndkfunc, train)
kpc4 <- qsammon(cndkernel=cndkfunc, cndKtrain, dims = 2)
plot(dimRed(kpc4), col = as.integer(labeltrain))

cndkfunc <- studcnd(d = 1.8)
cndKtrain <- cndkernmatrix(cndkfunc, train)
kpc4 <- qsammon(cndkernel=cndkfunc, cndKtrain, dims = 2)
cndkernf(kpc4)
plot(dimRed(kpc4), col = as.integer(labeltrain))

cndKtrain <- cndkernmatrix(cndkfunc, train)
kpc4 <- qsammon(cndkernel=cndkfunc, cndKtrain, k=4, dims = 2,Initialisation = 'pca')
cndkernf(kpc4)
plot(dimRed(kpc4), col = as.integer(labeltrain))


