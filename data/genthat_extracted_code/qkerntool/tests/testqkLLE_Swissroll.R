swissroll = function (N = 1000)
{
  n <- 3
  m <- 2
  tt <- sort((3 * pi/2) * (1 + 2 * runif(N)))
  height <- 21 * runif(N)
  x <- tt * cos(tt)
  y <- height
  z <- tt * sin(tt)
  data = cbind(x, y, z)
  return(data)
}

set.seed(123)
data1=swissroll(N=450)
labeldata1=rep(1:4,c(150,150,100,50))

d_low = qkLLE(data1, kernel = "rbfbase", qpar = list(sigma=127,q=0.8),dims=2, k=9)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component",main="qkLLE")
cndkernf(d_low)

# nonlbase(alpha=1,q=0.8)
d_low = qkLLE(data1, kernel = "nonlbase", qpar = list(alpha=0.0000022,q=0.9),dims=2, k=9)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component",main="qkLLE")
cndkernf(d_low)

# laplbase(sigma = 1, q = 0.8)
d_low = qkLLE(data1, kernel = "laplbase", qpar = list(sigma=1.2,q=0.8),dims=2, k=9)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component",main="qkLLE")
cndkernf(d_low)

# ratibase(c=1,q=0.8)
d_low = qkLLE(data1, kernel = "ratibase", qpar = list(c=1,q=0.9),dims=2, k=9)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component",main="qkLLE")
cndkernf(d_low)

# multbase(c = 1, q = 0.8)
d_low = qkLLE(data1, kernel = "multbase", qpar = list(c=.3,q=0.9999),dims=2, k=9)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component",main="qkLLE")
cndkernf(d_low)

# invbase(c = 1, q = 0.8)
d_low = qkLLE(data1, kernel = "invbase", qpar = list(c=1,q=0.8),dims=2, k=9)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component",main="qkLLE")
cndkernf(d_low)

# wavbase(theta=1,q=0.8)
d_low = qkLLE(data1, kernel = "wavbase", qpar = list(theta=34,q=0.8),dims=2, k=9)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component",main="qkLLE")
cndkernf(d_low)

# powbase(d = 2, q = 0.8)
d_low = qkLLE(data1, kernel = "powbase", qpar = list(d=1,q=0.8),dims=2, k=9)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component",main="qkLLE")
cndkernf(d_low)

# logbase(d = 2, q = 0.9)
d_low = qkLLE(data1, kernel = "logbase", qpar = list(d=1,q=0.8),dims=2, k=9)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component",main="qkLLE")
cndkernf(d_low)

# caubase(sigma = 1, q = 0.8)
d_low = qkLLE(data1, kernel = "caubase", qpar = list(sigma=1,q=0.8),dims=2, k=9)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component",main="qkLLE")
cndkernf(d_low)

# chibase(q = 0.8)
#d_low = qkLLE(data1, kernel = "chibase", qpar = list(gamma=1/10,q=0.8),dims=2, k=8)
##数据集有负值，该核不可用

# studbase(d = 2, q = 0.8)
d_low = qkLLE(data1, kernel = "studbase", qpar = list(d=1,q=0.8),dims=2, k=9)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component",main="qkLLE")
cndkernf(d_low)

# nonlcnd(alpha=1)
d_low = qkLLE(data1, kernel = "nonlcnd", qpar = list(alpha=0.0000501),dims=2, k=9)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component",main="qkLLE")
cndkernf(d_low)

# polycnd(d = 2, alpha = 1, c = 1)
d_low = qkLLE(data1, kernel = "polycnd", qpar = list(d = 1.2, alpha = 1.6, c = 18),dims=2, k=9)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component",main="qkLLE")
cndkernf(d_low)

# rbfcnd(gamma = 1)
d_low = qkLLE(data1, kernel = "rbfcnd", qpar = list(gamma = 0.8),dims=2, k=9)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component",main="qkLLE")
cndkernf(d_low)

# laplcnd(gamma = 1)
d_low = qkLLE(data1, kernel = "laplcnd", qpar = list(gamma = 1000),dims=2, k=9)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component",main="qkLLE")
cndkernf(d_low)

# anocnd(d = 2, sigma = 1)
#d_low = qkLLE(data1, kernel = "anocnd", qpar = list(d = 2, sigma = 1),dims=2, k=9)
##数据集有负值，该核不可用

# raticnd(c = 1)
d_low = qkLLE(data1, kernel = "raticnd", qpar = list(c = 0.8),dims=2, k=9)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component",main="qkLLE")
cndkernf(d_low)

# multcnd(c=1)
d_low = qkLLE(data1, kernel = "multcnd", qpar = list(c = 1.05),dims=2, k=8)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component",main="qkLLE")
cndkernf(d_low)

# invcnd(c = 1)
d_low = qkLLE(data1, kernel = "invcnd", qpar = list(c = 1),dims=2, k=9)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component",main="qkLLE")
cndkernf(d_low)

# wavcnd(theta = 1)
d_low = qkLLE(data1, kernel = "wavcnd", qpar = list(theta = 1000.999999999999),dims=2, k=9)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component",main="qkLLE")
cndkernf(d_low)

# powcnd(d = 2)
d_low = qkLLE(data1, kernel = "powcnd", qpar = list(d = 1),dims=2, k=9)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component",main="qkLLE")
cndkernf(d_low)

# logcnd(d = 2)
d_low = qkLLE(data1, kernel = "logcnd", qpar = list(d = 1.59),dims=2, k=8)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component",main="qkLLE")
cndkernf(d_low)

# caucnd(gamma = 1)
d_low = qkLLE(data1, kernel = "caucnd", qpar = list(gamma = 1),dims=2, k=9)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component",main="qkLLE")
cndkernf(d_low)

# chicnd()
#d_low = qkLLE(data1, kernel = "chicnd", qpar = list(),dims=2, k=9)
##数据集有负值，该核不可用

# studcnd(d = 2)
d_low = qkLLE(data1, kernel = "studcnd", qpar = list(d = 2),dims=2, k=9)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component",main="qkLLE")
cndkernf(d_low)

#plot the data projection on the components
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component")
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component",main="qkLLE")
cndkernf(d_low)


###########################################################################################
qkfunc <- rbfbase(sigma=127,q=0.8)
Ktrain1 <- qkernmatrix(qkfunc, data1)
qlle <- qkLLE(Ktrain1,dims=2, k=9)
plot(prj(qlle),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")

qkfunc <- nonlbase(alpha=0.0000022,q=0.9)
Ktrain1 <- qkernmatrix(qkfunc, data1)
qlle <- qkLLE(Ktrain1,dims=2, k=9)
plot(prj(qlle),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")

qkfunc <- laplbase(sigma=1.2,q=0.8)
Ktrain1 <- qkernmatrix(qkfunc, data1)
qlle <- qkLLE(Ktrain1,dims=2, k=9)
plot(prj(qlle),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")

qkfunc <- ratibase(c=1,q=0.9)
Ktrain1 <- qkernmatrix(qkfunc, data1)
qlle <- qkLLE(Ktrain1,dims=2, k=9)
plot(prj(qlle),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")

qkfunc <- multbase(c=1,q=0.8)
Ktrain1 <- qkernmatrix(qkfunc, data1)
qlle <- qkLLE(Ktrain1,dims=2, k=9)
plot(prj(qlle),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")

qkfunc <- invbase(c=1,q=0.8)
Ktrain1 <- qkernmatrix(qkfunc, data1)
qlle <- qkLLE(Ktrain1,dims=2, k=9)
plot(prj(qlle),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")

qkfunc <- wavbase(theta=34,q=0.8)
Ktrain1 <- qkernmatrix(qkfunc, data1)
qlle <- qkLLE(Ktrain1,dims=2, k=9)
plot(prj(qlle),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")

qkfunc <- powbase(d=1,q=0.8)
Ktrain1 <- qkernmatrix(qkfunc, data1)
qlle <- qkLLE(Ktrain1,dims=2, k=9)
plot(prj(qlle),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")

qkfunc <- logbase(d=1,q=0.8)
Ktrain1 <- qkernmatrix(qkfunc, data1)
qlle <- qkLLE(Ktrain1,dims=2, k=9)
plot(prj(qlle),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")

qkfunc <- caubase(sigma=1,q=0.8)
Ktrain1 <- qkernmatrix(qkfunc, data1)
qlle <- qkLLE(Ktrain1,dims=2, k=9)
plot(prj(qlle),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")

#qkfunc <- chibase(gamma=1/10,q=0.8)
#Ktrain1 <- qkernmatrix(qkfunc, data1)
#qlle <- qkLLE(Ktrain1,dims=2, k=9)
#plot(prj(qlle),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")

qkfunc <- studbase(d=1,q=0.8)
Ktrain1 <- qkernmatrix(qkfunc, data1)
qlle <- qkLLE(Ktrain1,dims=2, k=9)
plot(prj(qlle),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")



cndkfunc <- nonlcnd(alpha=0.0000501)
Ktrain2 <- cndkernmatrix(cndkfunc, data1)
qlle1 <- qkLLE(Ktrain2,dims=2, k=9)
plot(prj(qlle1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")

cndkfunc <- polycnd(d = 1.2, alpha = 1.6, c = 18)
Ktrain2 <- cndkernmatrix(cndkfunc, data1)
qlle1 <- qkLLE(Ktrain2,dims=2, k=9)
plot(prj(qlle1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")

cndkfunc <- rbfcnd(gamma = 0.8)
Ktrain2 <- cndkernmatrix(cndkfunc, data1)
qlle1 <- qkLLE(Ktrain2,dims=2, k=9)
plot(prj(qlle1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")

cndkfunc <- laplcnd(gamma = 1000)
Ktrain2 <- cndkernmatrix(cndkfunc, data1)
qlle1 <- qkLLE(Ktrain2,dims=2, k=9)
plot(prj(qlle1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")

#cndkfunc <- anocnd(d = 2, sigma = 1)
#Ktrain2 <- cndkernmatrix(cndkfunc, data1)
#qlle1 <- qkLLE(Ktrain2,dims=2, k=9)
#plot(prj(qlle1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")

cndkfunc <- raticnd(c = 0.8)
Ktrain2 <- cndkernmatrix(cndkfunc, data1)
qlle1 <- qkLLE(Ktrain2,dims=2, k=9)
plot(prj(qlle1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")

cndkfunc <- multcnd(c = 1)
Ktrain2 <- cndkernmatrix(cndkfunc, data1)
qlle1 <- qkLLE(Ktrain2,dims=2, k=9)
plot(prj(qlle1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")

cndkfunc <- invcnd(c = 1)
Ktrain2 <- cndkernmatrix(cndkfunc, data1)
qlle1 <- qkLLE(Ktrain2,dims=2, k=9)
plot(prj(qlle1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")

cndkfunc <- wavcnd(theta = 1001)
Ktrain2 <- cndkernmatrix(cndkfunc, data1)
qlle1 <- qkLLE(Ktrain2,dims=2, k=9)
plot(prj(qlle1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")

cndkfunc <- powcnd(d = 1)
Ktrain2 <- cndkernmatrix(cndkfunc, data1)
qlle1 <- qkLLE(Ktrain2,dims=2, k=9)
plot(prj(qlle1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")

cndkfunc <- logcnd(d = 1.5)
Ktrain2 <- cndkernmatrix(cndkfunc, data1)
qlle1 <- qkLLE(Ktrain2,dims=2, k=9)
plot(prj(qlle1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")

cndkfunc <- caucnd(gamma = 1)
Ktrain2 <- cndkernmatrix(cndkfunc, data1)
qlle1 <- qkLLE(Ktrain2,dims=2, k=9)
plot(prj(qlle1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")

#cndkfunc <- chicnd()
#Ktrain2 <- cndkernmatrix(cndkfunc, data1)
#qlle1 <- qkLLE(Ktrain2,dims=2, k=9)
#plot(prj(qlle1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")

cndkfunc <- studcnd(d = 2)
Ktrain2 <- cndkernmatrix(cndkfunc, data1)
qlle1 <- qkLLE(Ktrain2,dims=2, k=9)
plot(prj(qlle1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")

