data("iris")
testset <- sample(1:150,20)
train <- as.matrix(iris[-testset,-5])
labeltrain<- as.integer(iris[-testset,5])
test <- as.matrix(iris[testset,-5])
# ratibase(c=1,q=0.8)
d_low = qkMDS(train, kernel = "ratibase", qpar = list(c=1,q=0.8),  dims=2)
plot(d_low@prj, col = labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(d_low)

# nonlbase(alpha=1,q=0.8)
d_low = qkMDS(train, kernel = "nonlbase", qpar = list(alpha=.001,q=0.05),dims=2,plotResiduals = F)
plot(d_low@prj, col = labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")
# laplbase(sigma = 100, q = 0.8)
d_low = qkMDS(train, kernel = "laplbase", qpar = list(sigma=100,q=0.8),dims=2, plotResiduals = F)
plot(d_low@prj, col = labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")

# ratibase(c=1,q=0.8)
d_low = qkMDS(train, kernel = "ratibase", qpar = list(c=1,q=0.8),dims=2,plotResiduals = TRUE)
plot(d_low@prj, col = labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")
# multbase(c = 1, q = 0.8)
d_low = qkMDS(train, kernel = "multbase", qpar = list(c=1,q=0.8),dims=2,plotResiduals = TRUE)
plot(d_low@prj, col = labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")
# invbase(c = 1, q = 0.8)
d_low = qkMDS(train, kernel = "invbase", qpar = list(c=1,q=0.8),dims=2,plotResiduals = TRUE)
plot(d_low@prj, col = labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")
# wavbase(theta=1,q=0.8)
d_low = qkMDS(train, kernel = "wavbase", qpar = list(theta=2.2,q=0.8),dims=2, plotResiduals = F)
plot(d_low@prj, col = labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")
# powbase(d = 2, q = 0.8)
d_low = qkMDS(train, kernel = "powbase", qpar = list(d=2,q=0.8),dims=2,plotResiduals = TRUE)
plot(d_low@prj, col = labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")
# logbase(d = 2, q = 0.9)
d_low = qkMDS(train, kernel = "logbase", qpar = list(d=2,q=0.8),dims=2,plotResiduals = TRUE)
plot(d_low@prj, col = labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")
# caubase(sigma = 1, q = 0.8)
d_low = qkMDS(train, kernel = "caubase", qpar = list(sigma=1,q=0.8),dims=2, plotResiduals = TRUE)
plot(d_low@prj, col = labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")
# chibase(q = 0.8)



# studbase(d = 2, q = 0.8)
d_low = qkMDS(train, kernel = "studbase", qpar = list(d=2,q=0.8),dims=2,plotResiduals = TRUE)
plot(d_low@prj, col = labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")

# nonlcnd(alpha=1)
d_low = qkMDS(train, kernel = "nonlcnd", qpar = list(alpha=1/100000),dims=2, plotResiduals = TRUE)
plot(d_low@prj, col = labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")
# polycnd(d = 2, alpha = 1, c = 1)
d_low = qkMDS(train, kernel = "polycnd", qpar = list(d = 1, alpha = 2.5, c = 10),dims=2,plotResiduals = TRUE)
plot(d_low@prj, col = labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")
# rbfcnd(gamma = 1)
d_low = qkMDS(train, kernel = "rbfcnd", qpar = list(gamma = 10),dims=2, plotResiduals = TRUE)
plot(d_low@prj, col = labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")
# laplcnd(gamma = 1)
d_low = qkMDS(train, kernel = "laplcnd", qpar = list(gamma = 1000),dims=2,plotResiduals = F)
plot(d_low@prj, col = labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")
# anocnd(d = 2, sigma = 1)
d_low = qkMDS(train, kernel = "anocnd", qpar = list(d = .5, sigma = 1),dims=2, plotResiduals = TRUE)
plot(d_low@prj, col = labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")

# raticnd(c = 1)
d_low = qkMDS(train, kernel = "raticnd", qpar = list(c = 1),dims=2, plotResiduals = TRUE)
plot(d_low@prj, col = labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")
# multcnd(c=1)
d_low = qkMDS(train, kernel = "multcnd", qpar = list(c = 1),dims=2, plotResiduals = TRUE)
plot(d_low@prj, col = labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")
# invcnd(c = 1)
d_low = qkMDS(train,kernel = "invcnd", qpar = list(c = 1),dims=2, plotResiduals = TRUE)
plot(d_low@prj, col = labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")
# wavcnd(theta = 1)
d_low = qkMDS(train,kernel = "wavcnd", qpar = list(theta = 2.5),dims=2, plotResiduals = TRUE)
plot(d_low@prj, col = labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")
# powcnd(d = 2)
d_low = qkMDS(train, kernel = "powcnd", qpar = list(d = 1.7),dims=2,plotResiduals = TRUE)
plot(d_low@prj, col = labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")
# logcnd(d = 2)
d_low = qkMDS(train, kernel = "logcnd", qpar = list(d = 2),dims=2, plotResiduals = TRUE)
plot(d_low@prj, col = labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")
# caucnd(gamma = 1)
d_low = qkMDS(train, kernel = "caucnd", qpar = list(gamma = 1),dims=2, plotResiduals = F)
plot(d_low@prj, col = labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")
# chicnd()
d_low = qkMDS(train, kernel = "chicnd", qpar = list(),dims=2, plotResiduals = TRUE)
plot(d_low@prj, col = labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")

# studcnd(d = 2)
d_low = qkMDS(train, kernel = "studcnd", qpar = list(d = 2),dims=2, k=7,plotResiduals = TRUE)
plot(d_low@prj, col = labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")



qkfunc <- rbfbase(sigma=100,q=0.8)
Ktrain2 <- qkernmatrix(qkfunc,train)
qim1 <- qkMDS(Ktrain2,dims=2)
plot(prj(qim1),col=labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")

qkfunc <- nonlbase(alpha = 0.1,q=0.8)
Ktrain2 <- qkernmatrix(qkfunc, train)
qim1 <- qkMDS(Ktrain2,dims=2)
plot(prj(qim1),col=labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")


qkfunc <- laplbase(sigma = 0.4,q=0.8)
Ktrain2 <- qkernmatrix(qkfunc, train)
qim1 <- qkMDS(Ktrain2,dims=2)
plot(prj(qim1),col=labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")


qkfunc <- ratibase(c = 150,q = 0.8)
Ktrain2 <- qkernmatrix(qkfunc, train)
qim1 <- qkMDS(Ktrain2,dims=2)
plot(prj(qim1),col=labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")


qkfunc <- multbase(c = 8,q=0.8)
Ktrain2 <- qkernmatrix(qkfunc, train)
qim1 <- qkMDS(Ktrain2,dims=2)
plot(prj(qim1),col=labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")


qkfunc <- invbase(c = 9,q=0.8)
Ktrain2 <- qkernmatrix(qkfunc, train)
qim1 <- qkMDS(Ktrain2,dims=2)
plot(prj(qim1),col=labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")


qkfunc <- wavbase(theta = 5,q=0.8)
Ktrain2 <- qkernmatrix(qkfunc, train)
qim1 <- qkMDS(Ktrain2,dims=2)
plot(prj(qim1),col=labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")


qkfunc <- logbase(d = 2,q=0.9999)
Ktrain2 <- qkernmatrix(qkfunc, train)
qim1 <- qkMDS(Ktrain2,dims=2)
plot(prj(qim1),col=labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")


qkfunc <- caubase(sigma = 120,q=0.8)
Ktrain2 <- qkernmatrix(qkfunc, train)
qim1 <- qkMDS(Ktrain2,dims=2)
plot(prj(qim1),col=labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")


qkfunc <- chibase(gamma = 0.1,q=0.8)
Ktrain2 <- qkernmatrix(qkfunc, train)
qim1 <- qkMDS(Ktrain2,dims=2)
plot(prj(qim1),col=labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")


qkfunc <- studbase(d = 1,q=0.2)
Ktrain2 <- qkernmatrix(qkfunc, train)
qim1 <- qkMDS(Ktrain2,dims=2)
plot(prj(qim1),col=labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")


cndkfunc <- nonlcnd(alpha=0.02)
Ktrain2 <- cndkernmatrix(cndkfunc, train)
qim1 <- qkMDS(Ktrain2,dims=2)
plot(prj(qim1),col=labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")

cndkfunc <- polycnd(d = 2, alpha = 0.5, c = 10)
Ktrain2 <- cndkernmatrix(cndkfunc, train)
qim1 <- qkMDS(Ktrain2,dims=2)
plot(prj(qim1),col=labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")


cndkfunc <- rbfcnd(gamma = 1)
Ktrain2 <- cndkernmatrix(cndkfunc, train)
qim1 <- qkMDS(Ktrain2,dims=2)
plot(prj(qim1),col=labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")


cndkfunc <- logcnd(d = 2)
Ktrain2 <- cndkernmatrix(cndkfunc, train)
qim1 <- qkMDS(Ktrain2,dims=2)
plot(prj(qim1),col=labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")


cndkfunc <- anocnd(d = 2, sigma = 0.02)
Ktrain2 <- cndkernmatrix(cndkfunc, train)
qim1 <- qkMDS(Ktrain2,dims=2)
plot(prj(qim1),col=labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")

cndkfunc <- raticnd(c = 100)
Ktrain2 <- cndkernmatrix(cndkfunc, train)
qim1 <- qkMDS(Ktrain2,dims=2)
plot(prj(qim1),col=labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")


cndkfunc <- multcnd(c = 6)
Ktrain2 <- cndkernmatrix(cndkfunc, train)
qim1 <- qkMDS(Ktrain2,dims=2)
plot(prj(qim1),col=labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")


cndkfunc <- invcnd(c = 10)
Ktrain2 <- cndkernmatrix(cndkfunc, train)
qim1 <- qkMDS(Ktrain2,dims=2)
plot(prj(qim1),col=labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")


cndkfunc <- wavcnd(theta = 5)
Ktrain2 <- cndkernmatrix(cndkfunc, train)
qim1 <- qkMDS(Ktrain2,dims=2)
plot(prj(qim1),col=labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")


cndkfunc <- powcnd(d = 2)
Ktrain2 <- cndkernmatrix(cndkfunc, train)
qim1 <- qkMDS(Ktrain2,dims=2)
plot(prj(qim1),col=labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")


cndkfunc <- logcnd(d = 1)
Ktrain2 <- cndkernmatrix(cndkfunc, train)
qim1 <- qkMDS(Ktrain2,dims=2)
plot(prj(qim1),col=labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")


cndkfunc <- caucnd(gamma = 90)
Ktrain2 <- cndkernmatrix(cndkfunc, train)
qim1 <- qkMDS(Ktrain2,dims=2)
plot(prj(qim1),col=labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")


cndkfunc <- chicnd()
Ktrain2 <- cndkernmatrix(cndkfunc, train)
qim1 <- qkMDS(Ktrain2,dims=2)
plot(prj(qim1),col=labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")


cndkfunc <- studcnd(d = 1.5)
Ktrain2 <- cndkernmatrix(cndkfunc, train)
qim1 <- qkMDS(Ktrain2,dims=2)
plot(prj(qim1),col=labeltrain, xlab="1st Principal Component",ylab="2nd Principal Component")

