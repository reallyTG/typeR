library(multiway)


### Name: const.control
### Title: Auxiliary for Controlling Multi-Way Constraints
### Aliases: const.control

### ** Examples

##########   EXAMPLE   ##########

# create random data array with Parafac structure
set.seed(4)
mydim <- c(30, 10, 8, 10)
nf <- 4
aseq <- seq(-3, 3, length.out = mydim[1])
Amat <- cbind(dnorm(aseq), dchisq(aseq+3.1, df=3),
              dt(aseq-2, df=4), dgamma(aseq+3.1, shape=3, rate=1))
Bmat <- svd(matrix(runif(mydim[2]*nf), nrow = mydim[2], ncol = nf), nv = 0)$u
Cmat <- matrix(runif(mydim[3]*nf), nrow = mydim[3], ncol = nf)
Cstruc <- Cmat > 0.5
Cmat <- Cmat * Cstruc
Dmat <- matrix(runif(mydim[4]*nf), nrow = mydim[4], ncol = nf)
Xmat <- tcrossprod(Amat, krprod(Dmat, krprod(Cmat, Bmat)))
Xmat <- array(Xmat, dim = mydim)
Emat <- array(rnorm(prod(mydim)), dim = mydim)
Emat <- nscale(Emat, 0, ssnew = sumsq(Xmat))   # SNR = 1
X <- Xmat + Emat

# fit Parafac model (unimodal and smooth A, orthogonal B, 
#                    non-negative and structured C, non-negative D)
set.seed(123)
pfac <- parafac(X, nfac = nf, nstart = 1, Cstruc = Cstruc, 
                const = c("unismo", "orthog", "nonneg", "nonneg"))
pfac

# same as before, but add some options to the unimodality contraints...
# more knots (df=10), quadratic splines (degree=2), and enforce non-negativity
cvec <- c("unsmno", "orthog", "nonneg", "nonneg")
ctrl <- const.control(cvec, df = 10, degree = 2)
set.seed(123)
pfac <- parafac(X, nfac = nf, nstart = 1, Cstruc = Cstruc,
                const = cvec, control = ctrl)
pfac




