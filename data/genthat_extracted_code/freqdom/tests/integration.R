library("freqdom")

OP = array(0,c(2,2,3))
OP[,,1] = diag(2)
OP[,,2] = diag(2)
OP[,,3] = diag(2)

A = timedom(OP,c(-1,0,2))
A = timedom.trunc(A, 0)

B = timedom(array(diag(2),c(2,2,1)),0)
if (!all(B$operators == A$operators))
  stop("truncation error")

OP = array(0,c(2,1,3))
OP[,,1] = 1:2
OP[,,2] = 2:3
OP[,,3] = c(-5,5)

if (sum((fourier.inverse(fourier.transform(timedom(OP,-1:1)),lags = -1:1)$operators - OP)^2)> 0.01)
  stop("Fourier transform error")

set.seed(4)

precision = 0.0001

OP = array(0,c(2,2,3))
OP[,,1] = matrix(1:4,2)
OP[,,2] = matrix(5:8,2)
OP[,,3] = matrix(9:12,2)

A = timedom(OP,c(-1,0,2))

X = t(matrix(rnorm(200),2))
X = scale(X, center=TRUE, scale = FALSE)
Xt = timedom(X,1:nrow(X))

Xf = fourier.transform(Xt,freq=pi * (-200:200 / 200))
Af = fourier.transform(A,freq=pi * (-200:200 / 200))

Y = X %c% A     # time domain convolution
Cf = Xf %*% Af   # frequency domain product

Yt = fourier.inverse(Cf,1:100)
Yr = Yt$operators[,1,]

par(mfrow=c(1,1))
plot(Y[,1])
lines(Yr)


DPC = dpca.filters(spectral.density(X))
if (any((dim(DPC$operators) - c(2,2,61)) != 0 ))
  stop("Wrong sizes")

X[,2] = X[,1]
DPC = dpca.filters(spectral.density(X))
if (any((dim(DPC$operators) - c(2,2,61)) != 0 ))
  stop("Wrong sizes")

dpca.filters(spectral.density(X),Ndpc = 1)
dpca(X)
##

