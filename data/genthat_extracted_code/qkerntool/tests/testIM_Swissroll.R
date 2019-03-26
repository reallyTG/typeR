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
#####################################
d_low = qkIsomap(data1, kernel = "rbfbase", qpar = list(sigma=1,q=0.8),dims=2, k=7,plotResiduals = T)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(d_low)

# nonlbase(alpha=1,q=0.8)
d_low = qkIsomap(data1, kernel = "nonlbase", qpar = list(alpha=0.000003,q=0.5),dims=2, k=7,plotResiduals = T)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(d_low)

# laplbase(sigma = 1, q = 0.8)
d_low = qkIsomap(data1, kernel = "laplbase", qpar = list(sigma=1.2,q=0.8),dims=2, k=7,plotResiduals = T)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(d_low)

# ratibase(c=1,q=0.8)
d_low = qkIsomap(data1, kernel = "ratibase", qpar = list(c=1,q=0.8),dims=2, k=7,plotResiduals = TRUE)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(d_low)

# multbase(c = 1, q = 0.8)
d_low = qkIsomap(data1, kernel = "multbase", qpar = list(c=1,q=0.8),dims=2, k=7,plotResiduals = TRUE)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(d_low)

# invbase(c = 1, q = 0.8)
d_low = qkIsomap(data1, kernel = "invbase", qpar = list(c=1,q=0.8),dims=2, k=7,plotResiduals = TRUE)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(d_low)

# wavbase(theta=1,q=0.8)
d_low = qkIsomap(data1, kernel = "wavbase", qpar = list(theta=2.2,q=0.8),dims=2, k=7,plotResiduals = T)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(d_low)

# powbase(d = 2, q = 0.8)
d_low = qkIsomap(data1, kernel = "powbase", qpar = list(d=2,q=0.8),dims=2, k=7,plotResiduals = TRUE)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(d_low)

# logbase(d = 2, q = 0.9)
d_low = qkIsomap(data1, kernel = "logbase", qpar = list(d=2,q=0.8),dims=2, k=7,plotResiduals = TRUE)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(d_low)

# caubase(sigma = 1, q = 0.8)
d_low = qkIsomap(data1, kernel = "caubase", qpar = list(sigma=1,q=0.8),dims=2, k=7,plotResiduals = TRUE)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(d_low)

# chibase(q = 0.8)
#d_low = qkIsomap(data1, kernel = "chibase", qpar = list(gamma=1/100,q=0.8),dims=2, k=7,plotResiduals = F)

# studbase(d = 2, q = 0.8)
d_low = qkIsomap(data1, kernel = "studbase", qpar = list(d=2,q=0.8),dims=2, k=7,plotResiduals = TRUE)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(d_low)

# nonlcnd(alpha=1)
d_low = qkIsomap(data1, kernel = "nonlcnd", qpar = list(alpha=1/100000),dims=2, k=7,plotResiduals = TRUE)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(d_low)

# polycnd(d = 2, alpha = 1, c = 1)
d_low = qkIsomap(data1, kernel = "polycnd", qpar = list(d = 1, alpha = 2.5, c = 10),dims=2, k=7,plotResiduals = TRUE)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(d_low)

# rbfcnd(gamma = 1)
d_low = qkIsomap(data1, kernel = "rbfcnd", qpar = list(gamma = 10),dims=2, k=7,plotResiduals = TRUE)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(d_low)

# laplcnd(gamma = 1)
d_low = qkIsomap(data1, kernel = "laplcnd", qpar = list(gamma = 1000),dims=2, k=7,plotResiduals = F)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(d_low)

# anocnd(d = 2, sigma = 1)
#d_low = qkIsomap(data1, kernel = "anocnd", qpar = list(d = 2, sigma = 1),dims=2, k=7,plotResiduals = TRUE)

# raticnd(c = 1)
d_low = qkIsomap(data1, kernel = "raticnd", qpar = list(c = 1),dims=2, k=7,plotResiduals = TRUE)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(d_low)

# multcnd(c=1)
d_low = qkIsomap(data1, kernel = "multcnd", qpar = list(c = 1),dims=2, k=7,plotResiduals = TRUE)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(d_low)

# invcnd(c = 1)
d_low = qkIsomap(data1, kernel = "invcnd", qpar = list(c = 1),dims=2, k=7,plotResiduals = TRUE)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(d_low)

# wavcnd(theta = 1)
d_low = qkIsomap(data1, kernel = "wavcnd", qpar = list(theta = 2.5),dims=2, k=7,plotResiduals = TRUE)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(d_low)

# powcnd(d = 2)
d_low = qkIsomap(data1, kernel = "powcnd", qpar = list(d = 1.7),dims=2, k=7,plotResiduals = TRUE)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(d_low)

# logcnd(d = 2)
d_low = qkIsomap(data1, kernel = "logcnd", qpar = list(d = 2),dims=2, k=7,plotResiduals = TRUE)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(d_low)

# caucnd(gamma = 1)
d_low = qkIsomap(data1, kernel = "caucnd", qpar = list(gamma = 1),dims=2, k=7,plotResiduals = F)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(d_low)

# chicnd()
#d_low = qkIsomap(data1, kernel = "chicnd", qpar = list(),dims=2, k=7,plotResiduals = TRUE)

# studcnd(d = 2)
d_low = qkIsomap(data1, kernel = "studcnd", qpar = list(d = 2),dims=2, k=7,plotResiduals = TRUE)
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(d_low)

#plot the data projection on the components
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component")
plot(prj(d_low), col=labeldata1,xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(d_low)



qkfunc <- rbfbase(sigma=0.35,q=0.8)
Ktrain1 <- qkernmatrix(qkfunc, data1)
qim1 <- qkIsomap(Ktrain1,dims=2, k=7, plotResiduals = T)
plot(prj(qim1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(qim1)

qkfunc <- nonlbase(alpha=0.00003,q=0.8)
Ktrain1 <- qkernmatrix(qkfunc, data1)
qim1 <- qkIsomap(Ktrain1,dims=2, k=7)
plot(prj(qim1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(qim1)

qkfunc <- laplbase(sigma=1.2,q=0.8)
Ktrain1 <- qkernmatrix(qkfunc, data1)
qim1 <- qkIsomap(Ktrain1,dims=2, k=7)
plot(prj(qim1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(qim1)

qkfunc <- ratibase(c=1,q=0.8)
Ktrain1 <- qkernmatrix(qkfunc, data1)
qim1 <- qkIsomap(Ktrain1,dims=2, k=7)
plot(prj(qim1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(qim1)

qkfunc <- multbase(c=1,q=0.8)
Ktrain1 <- qkernmatrix(qkfunc, data1)
qim1 <- qkIsomap(Ktrain1,dims=2, k=7)
plot(prj(qim1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(qim1)

qkfunc <- invbase(c=1,q=0.8)
Ktrain1 <- qkernmatrix(qkfunc, data1)
qim1 <- qkIsomap(Ktrain1,dims=2, k=7)
plot(prj(qim1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(qim1)

qkfunc <- wavbase(theta=2.2,q=0.8)
Ktrain1 <- qkernmatrix(qkfunc, data1)
qim1 <- qkIsomap(Ktrain1,dims=2, k=7)
plot(prj(qim1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(qim1)

qkfunc <- powbase(d=2,q=0.8)
Ktrain1 <- qkernmatrix(qkfunc, data1)
qim1 <- qkIsomap(Ktrain1,dims=2, k=7)
plot(prj(qim1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(qim1)

qkfunc <- logbase(d=2,q=0.8)
Ktrain1 <- qkernmatrix(qkfunc, data1)
qim1 <- qkIsomap(Ktrain1,dims=2, k=7)
plot(prj(qim1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(qim1)

qkfunc <- caubase(sigma=1,q=0.8)
Ktrain1 <- qkernmatrix(qkfunc, data1)
qim1 <- qkIsomap(Ktrain1,dims=2, k=7)
plot(prj(qim1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(qim1)

#qkfunc <- chibase(gamma=1/100,q=0.8)
#Ktrain1 <- qkernmatrix(qkfunc, data1)
#qim1 <- qkIsomap(Ktrain1,dims=2, k=7)
#plot(prj(qim1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")
#cndkernf(qim1)

qkfunc <- studbase(d=2,q=0.8)
Ktrain1 <- qkernmatrix(qkfunc, data1)
qim1 <- qkIsomap(Ktrain1,dims=2, k=7)
plot(prj(qim1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(qim1)

cndkfunc <- nonlcnd(alpha=1/100000)
Ktrain1 <- qkernmatrix(cndkfunc, data1)
qim1 <- qkIsomap(Ktrain1,dims=2, k=7)
plot(prj(qim1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(qim1)

cndkfunc <- polycnd(d = 1, alpha = 2.5, c = 10)
Ktrain1 <- qkernmatrix(cndkfunc, data1)
qim1 <- qkIsomap(Ktrain1,dims=2, k=7)
plot(prj(qim1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(qim1)

cndkfunc <- rbfcnd(gamma = 10)
Ktrain1 <- qkernmatrix(cndkfunc, data1)
qim1 <- qkIsomap(Ktrain1,dims=2, k=7)
plot(prj(qim1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(qim1)

cndkfunc <- laplcnd(gamma = 1000)
Ktrain1 <- qkernmatrix(cndkfunc, data1)
qim1 <- qkIsomap(Ktrain1,dims=2, k=7)
plot(prj(qim1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(qim1)

#cndkfunc <- anocnd(d = 1, sigma = 1)
#Ktrain1 <- qkernmatrix(cndkfunc, data1)
#qim1 <- qkIsomap(Ktrain1,dims=2, k=7)
#plot(prj(qim1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")
#cndkernf(qim1)

cndkfunc <- raticnd(c = 1)
Ktrain1 <- qkernmatrix(cndkfunc, data1)
qim1 <- qkIsomap(Ktrain1,dims=2, k=7)
plot(prj(qim1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(qim1)

cndkfunc <- multcnd(c = 1)
Ktrain1 <- qkernmatrix(cndkfunc, data1)
qim1 <- qkIsomap(Ktrain1,dims=2, k=7)
plot(prj(qim1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(qim1)

cndkfunc <- invcnd(c = 1)
Ktrain1 <- qkernmatrix(cndkfunc, data1)
qim1 <- qkIsomap(Ktrain1,dims=2, k=7)
plot(prj(qim1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(qim1)

cndkfunc <- wavcnd(theta = 2.5)
Ktrain1 <- qkernmatrix(cndkfunc, data1)
qim1 <- qkIsomap(Ktrain1,dims=2, k=7)
plot(prj(qim1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(qim1)

cndkfunc <- powcnd(d = 1.7)
Ktrain1 <- qkernmatrix(cndkfunc, data1)
qim1 <- qkIsomap(Ktrain1,dims=2, k=7)
plot(prj(qim1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(qim1)

cndkfunc <- logcnd(d = 2)
Ktrain1 <- qkernmatrix(cndkfunc, data1)
qim1 <- qkIsomap(Ktrain1,dims=2, k=7)
plot(prj(qim1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(qim1)

cndkfunc <- caucnd(gamma = 1)
Ktrain1 <- qkernmatrix(cndkfunc, data1)
qim1 <- qkIsomap(Ktrain1,dims=2, k=7)
plot(prj(qim1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(qim1)

#cndkfunc <- chicnd()
#Ktrain1 <- qkernmatrix(cndkfunc, data1)
#qim1 <- qkIsomap(Ktrain1,dims=2, k=7)
#plot(prj(qim1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")
#cndkernf(qim1)

cndkfunc <- studcnd(d = 2)
Ktrain1 <- qkernmatrix(cndkfunc, data1)
qim1 <- qkIsomap(Ktrain1,dims=2, k=7)
plot(prj(qim1),col=labeldata1, xlab="1st Principal Component",ylab="2nd Principal Component")
cndkernf(qim1)

