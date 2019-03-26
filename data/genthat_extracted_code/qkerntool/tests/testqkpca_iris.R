if (!require(qkerntool)) {

data("iris")
testset <- sample(1:150,20)
train <- as.matrix(iris[-testset,-5])
test <- as.matrix(iris[testset,-5])
labeltrain<- as.integer(iris[-testset,5])

kpc1 <- qkpca(train, kernel = "rbfbase", qpar = list(sigma = 30,q=0.8),features = 2)
plot(rotated(kpc1),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

kpc1 <- qkpca(train, kernel = "nonlbase", qpar = list(alpha = 0.1,q=0.8),features = 2)
plot(rotated(kpc1),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

kpc1 <- qkpca(train, kernel = "laplbase", qpar = list(sigma = 0.4,q=0.8),features = 2)
plot(rotated(kpc1),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

kpc1 <- qkpca(train, kernel = "ratibase", qpar = list(c = 150,q=0.8),features = 2)
plot(rotated(kpc1),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

kpc1 <- qkpca(train, kernel = "multbase", qpar = list(c = 8,q=0.8),features = 2)
plot(rotated(kpc1),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

kpc1 <- qkpca(train, kernel = "invbase", qpar = list(c = 9,q=0.8),features = 2)
plot(rotated(kpc1),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

kpc1 <- qkpca(train, kernel = "wavbase", qpar = list(theta = 5,q=0.8),features = 2)
plot(rotated(kpc1),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

kpc1 <- qkpca(train, kernel = "powbase", qpar = list(d = 2,q=0.99),features = 2)
plot(rotated(kpc1),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

kpc1 <- qkpca(train, kernel = "logbase", qpar = list(d = 2,q=0.9999),features = 2)
plot(rotated(kpc1),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

kpc1 <- qkpca(train, kernel = "caubase", qpar = list(sigma = 120,q=0.8),features = 2)
plot(rotated(kpc1),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

kpc1 <- qkpca(train, kernel = "chibase", qpar = list(gamma = 0.1,q=0.8),features = 2)
plot(rotated(kpc1),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

kpc1 <- qkpca(train, kernel = "studbase", qpar = list(d = 1,q=0.2),features = 2)
plot(rotated(kpc1),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

kpc1 <- qkpca(train, kernel = "nonlcnd", qpar = list(alpha=0.02),features = 2)
plot(rotated(kpc1),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

kpc1 <- qkpca(train, kernel = "polycnd", qpar = list(d = 2, alpha = 0.5, c = 10),features = 2)
plot(rotated(kpc1),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

kpc1 <- qkpca(train, kernel = "rbfcnd", qpar = list(gamma = 1),features = 2)
plot(rotated(kpc1),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

kpc1 <- qkpca(train, kernel = "laplcnd", qpar = list(gamma = 1),features = 2)
plot(rotated(kpc1),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

kpc1 <- qkpca(train, kernel = "anocnd", qpar = list(d = 2, sigma = 0.02),features = 2)
plot(rotated(kpc1),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

kpc1 <- qkpca(train, kernel = "raticnd", qpar = list(c = 100),features = 2)
plot(rotated(kpc1),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

kpc1 <- qkpca(train, kernel = "multcnd", qpar = list(c = 6),features = 2)
plot(rotated(kpc1),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

kpc1 <- qkpca(train, kernel = "invcnd", qpar = list(c = 10),features = 2)
plot(rotated(kpc1),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

kpc1 <- qkpca(train, kernel = "wavcnd", qpar = list(theta = 5),features = 2)
plot(rotated(kpc1),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

kpc1 <- qkpca(train, kernel = "powcnd", qpar = list(d = 2),features = 2)
plot(rotated(kpc1),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

kpc1 <- qkpca(train, kernel = "logcnd", qpar = list(d = 1),features = 2)
plot(rotated(kpc1),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

kpc1 <- qkpca(train, kernel = "caucnd", qpar = list(gamma = 90),features = 2)
plot(rotated(kpc1),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

kpc1 <- qkpca(train, kernel = "chicnd", qpar = list(),features = 2)
plot(rotated(kpc1),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

kpc1 <- qkpca(train, kernel = "studcnd", qpar = list(d = 1.5),features = 2)
plot(rotated(kpc1),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

#predict
predict(kpc1,test)

qkfunc <- rbfbase(sigma = 30,q = 0.8)
Ktrain2 <- qkernmatrix(qkfunc, train)
kpc3 <- qkpca(Ktrain2, features = 2)
plot(rotated(kpc3),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

qkfunc <- nonlbase(alpha = 0.1,q=0.8)
Ktrain2 <- qkernmatrix(qkfunc, train)
kpc3 <- qkpca(Ktrain2, features = 2)
plot(rotated(kpc3),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

qkfunc <- laplbase(sigma = 0.4,q=0.8)
Ktrain2 <- qkernmatrix(qkfunc, train)
kpc3 <- qkpca(Ktrain2, features = 2)
plot(rotated(kpc3),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

qkfunc <- ratibase(c = 150,q = 0.8)
Ktrain2 <- qkernmatrix(qkfunc, train)
kpc3 <- qkpca(Ktrain2, features = 2)
plot(rotated(kpc3),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

qkfunc <- multbase(c = 8,q=0.8)
Ktrain2 <- qkernmatrix(qkfunc, train)
kpc3 <- qkpca(Ktrain2, features = 2)
plot(rotated(kpc3),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

qkfunc <- invbase(c = 9,q=0.8)
Ktrain2 <- qkernmatrix(qkfunc, train)
kpc3 <- qkpca(Ktrain2, features = 2)
plot(rotated(kpc3),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

qkfunc <- wavbase(theta = 5,q=0.8)
Ktrain2 <- qkernmatrix(qkfunc, train)
kpc3 <- qkpca(Ktrain2, features = 2)
plot(rotated(kpc3),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

qkfunc <- powbase(d = 2,q=0.99)
Ktrain2 <- qkernmatrix(qkfunc, train)
kpc3 <- qkpca(Ktrain2, features = 2)
plot(rotated(kpc3),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

qkfunc <- logbase(d = 2,q=0.9999)
Ktrain2 <- qkernmatrix(qkfunc, train)
kpc3 <- qkpca(Ktrain2, features = 2)
plot(rotated(kpc3),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

qkfunc <- caubase(sigma = 120,q=0.8)
Ktrain2 <- qkernmatrix(qkfunc, train)
kpc3 <- qkpca(Ktrain2, features = 2)
plot(rotated(kpc3),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

qkfunc <- chibase(gamma = 0.1,q=0.8)
Ktrain2 <- qkernmatrix(qkfunc, train)
kpc3 <- qkpca(Ktrain2, features = 2)
plot(rotated(kpc3),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

qkfunc <- studbase(d = 1,q=0.2)
Ktrain2 <- qkernmatrix(qkfunc, train)
kpc3 <- qkpca(Ktrain2, features = 2)
plot(rotated(kpc3),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

#predict
predict(kpc3,qkernmatrix(qkfunc, test, train))


cndkfunc <- nonlcnd(alpha=0.02)
Ktrain2 <- cndkernmatrix(cndkfunc, train)
kpc3 <- qkpca(Ktrain2, features = 2)
plot(rotated(kpc3),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

cndkfunc <- polycnd(d = 2, alpha = 0.5, c = 10)
Ktrain2 <- cndkernmatrix(cndkfunc, train)
kpc3 <- qkpca(Ktrain2, features = 2)
plot(rotated(kpc3),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

cndkfunc <- rbfcnd(gamma = 1)
Ktrain2 <- cndkernmatrix(cndkfunc, train)
kpc3 <- qkpca(Ktrain2, features = 2)
plot(rotated(kpc3),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

cndkfunc <- logcnd(d = 2)
Ktrain2 <- cndkernmatrix(cndkfunc, train)
kpc3 <- qkpca(Ktrain2, features = 2)
plot(rotated(kpc3),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

cndkfunc <- anocnd(d = 2, sigma = 0.02)
Ktrain2 <- cndkernmatrix(cndkfunc, train)
kpc3 <- qkpca(Ktrain2, features = 2)
plot(rotated(kpc3),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

cndkfunc <- raticnd(c = 100)
Ktrain2 <- cndkernmatrix(cndkfunc, train)
kpc3 <- qkpca(Ktrain2, features = 2)
plot(rotated(kpc3),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

cndkfunc <- multcnd(c = 6)
Ktrain2 <- cndkernmatrix(cndkfunc, train)
kpc3 <- qkpca(Ktrain2, features = 2)
plot(rotated(kpc3),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

cndkfunc <- invcnd(c = 10)
Ktrain2 <- cndkernmatrix(cndkfunc, train)
kpc3 <- qkpca(Ktrain2, features = 2)
plot(rotated(kpc3),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

cndkfunc <- wavcnd(theta = 5)
Ktrain2 <- cndkernmatrix(cndkfunc, train)
kpc3 <- qkpca(Ktrain2, features = 2)
plot(rotated(kpc3),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

cndkfunc <- powcnd(d = 2)
Ktrain2 <- cndkernmatrix(cndkfunc, train)
kpc3 <- qkpca(Ktrain2, features = 2)
plot(rotated(kpc3),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

cndkfunc <- logcnd(d = 1)
Ktrain2 <- cndkernmatrix(cndkfunc, train)
kpc3 <- qkpca(Ktrain2, features = 2)
plot(rotated(kpc3),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

cndkfunc <- caucnd(gamma = 90)
Ktrain2 <- cndkernmatrix(cndkfunc, train)
kpc3 <- qkpca(Ktrain2, features = 2)
plot(rotated(kpc3),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

cndkfunc <- chicnd()
Ktrain2 <- cndkernmatrix(cndkfunc, train)
kpc3 <- qkpca(Ktrain2, features = 2)
plot(rotated(kpc3),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

cndkfunc <- studcnd(d = 1.5)
Ktrain2 <- cndkernmatrix(cndkfunc, train)
kpc3 <- qkpca(Ktrain2, features = 2)
plot(rotated(kpc3),col=labeltrain,xlab="1st Principal Component",ylab="2nd Principal Component")

#predict
predict(kpc3,cndkernmatrix(cndkfunc, test, train))

}
