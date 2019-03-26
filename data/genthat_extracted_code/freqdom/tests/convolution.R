library("freqdom")

set.seed(4)

precision = 0.0001

OP = array(0,c(2,2,3))
OP[,,1] = diag(2)
OP[,,2] = diag(2)
OP[,,3] = diag(2)

A = timedom(OP,c(-1,0,2))

X = matrix(rnorm(200),100,2)
Xt = timedom(X,1:nrow(X))

if(sum((fourier.inverse(fourier.transform(Xt),1:100)$operators - Xt$operators)^2) > 1)
  stop("Fourier inverse problem")

Xf = fourier.transform(Xt, freq=pi * (-200:200 / 200))
Af = fourier.transform(A, freq=pi * (-200:200 / 200))

Y = X %c% A      # time domain convolution
Cf = Xf %*% Af   # frequency domain product

Yt = fourier.inverse(Cf,1:100)
Yr = Yt$operators[,1,]

par(mfrow=c(1,1))
plot(Y[,1])
lines(Yr)
