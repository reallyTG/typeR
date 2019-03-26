## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.align = "center"
)
#rmarkdown::render("vignettes/SparseEigenvectors.Rmd", "all")
#rmarkdown::render("vignettes/SparseEigenvectors.Rmd", "pdf_document")
#rmarkdown::render("vignettes/SparseEigenvectors.Rmd", "rmarkdown::html_vignette")
#tools::compactPDF("vignettes/SparseEigenvectors.pdf", gs_quality = "ebook")

## ----echo=FALSE, out.width='75%', fig.cap = "Average running time."------
knitr::include_graphics('figures/running_time.png', auto_pdf = TRUE)

## ----echo=FALSE, out.width='95%', fig.cap = "Eigenvector recovery."------
knitr::include_graphics('figures/recovery.png', auto_pdf = TRUE)

## ------------------------------------------------------------------------
library(sparseEigen)
set.seed(42)

# parameters 
m <- 500  # dimension
n <- 100  # number of samples
q <- 3  # number of sparse eigenvectors to be estimated
sp_card <- 0.2*m  # cardinality of each sparse eigenvector
rho <- 0.6  # sparsity level

# generate non-overlapping sparse eigenvectors
V <- matrix(0, m, q)
V[cbind(seq(1, q*sp_card), rep(1:q, each = sp_card))] <- 1/sqrt(sp_card)
V <- cbind(V, matrix(rnorm(m*(m-q)), m, m-q))
# keep first q eigenvectors the same (already orthogonal) and orthogonalize the rest
V <- qr.Q(qr(V))

# generate eigenvalues
lmd <- c(100*seq(from = q, to = 1), rep(1, m-q))

# generate covariance matrix from sparse eigenvectors and eigenvalues
R <- V %*% diag(lmd) %*% t(V)

# generate data matrix from a zero-mean multivariate Gaussian distribution 
# with the constructed covariance
X <- MASS::mvrnorm(n, rep(0, m), R)  # random data with underlying sparse structure

## ------------------------------------------------------------------------
# computation of sparse eigenvectors
res_standard <- eigen(cov(X))
res_sparse1 <- spEigen(cov(X), q, rho)
res_sparse2 <- spEigen(X, q, rho, data = TRUE)

## ------------------------------------------------------------------------
# show inner product between estimated eigenvectors and originals
abs(diag(t(res_standard$vectors) %*% V[, 1:q]))   #for standard estimated eigenvectors
abs(diag(t(res_sparse1$vectors) %*% V[, 1:q]))    #for sparse estimated eigenvectors
abs(diag(t(res_sparse2$vectors) %*% V[, 1:q]))    #for sparse estimated eigenvectors

## ---- fig.height = 7, fig.width = 7--------------------------------------
par(mfcol = c(3, 2))
plot(res_sparse1$vectors[, 1]*sign(res_sparse1$vectors[1, 1]), 
     main = "First sparse eigenvector", xlab = "index", ylab = "", type = "h")
lines(V[, 1]*sign(V[1, 1]), col = "red")
plot(res_sparse1$vectors[, 2]*sign(res_sparse1$vectors[sp_card+1, 2]), 
     main = "Second sparse eigenvector", xlab = "index", ylab = "", type = "h")
lines(V[, 2]*sign(V[sp_card+1, 2]), col = "red")
plot(res_sparse1$vectors[, 3]*sign(res_sparse1$vectors[2*sp_card+1, 3]), 
     main = "Third sparse eigenvector", xlab = "index", ylab = "", type = "h")
lines(V[, 3]*sign(V[2*sp_card+1, 3]), col = "red")

plot(res_standard$vectors[, 1]*sign(res_standard$vectors[1, 1]), 
     main = "First regular eigenvector", xlab = "index", ylab = "", type = "h")
lines(V[, 1]*sign(V[1, 1]), col = "red")
plot(res_standard$vectors[, 2]*sign(res_standard$vectors[sp_card+1, 2]), 
     main = "Second regular eigenvector", xlab = "index", ylab = "", type = "h")
lines(V[, 2]*sign(V[sp_card+1, 2]), col = "red")
plot(res_standard$vectors[, 3]*sign(res_standard$vectors[2*sp_card+1, 3]), 
     main = "Third regular eigenvector", xlab = "index", ylab = "", type = "h")
lines(V[, 3]*sign(V[2*sp_card+1, 3]), col = "red")

## ---- echo = FALSE-------------------------------------------------------
n <- 600  # number of samples
X <- MASS::mvrnorm(n, rep(0, m), R)  # random data with underlying sparse structure

## ------------------------------------------------------------------------
# computation of covariance matrix
res_sparse3 <- spEigenCov(cov(X), q, rho)

## ------------------------------------------------------------------------
# show inner product between estimated eigenvectors and originals
abs(diag(t(res_sparse3$vectors[, 1:q]) %*% V[, 1:q]))    #for sparse estimated eigenvectors

## ---- fig.height = 6, fig.width = 5--------------------------------------
par(mfcol = c(3, 1))
plot(res_sparse3$vectors[, 1]*sign(res_sparse3$vectors[1, 1]), 
     main = "First sparse eigenvector", xlab = "index", ylab = "", type = "h")
lines(V[, 1]*sign(V[1, 1]), col = "red")
plot(res_sparse3$vectors[, 2]*sign(res_sparse3$vectors[sp_card+1, 2]), 
     main = "Second sparse eigenvector", xlab = "index", ylab = "", type = "h")
lines(V[, 2]*sign(V[sp_card+1, 2]), col = "red")
plot(res_sparse3$vectors[, 3]*sign(res_sparse3$vectors[2*sp_card+1, 3]), 
     main = "Third sparse eigenvector", xlab = "index", ylab = "", type = "h")
lines(V[, 3]*sign(V[2*sp_card+1, 3]), col = "red")

## ------------------------------------------------------------------------
# show error between estimated and true covariance 
norm(cov(X) - R, type = 'F') #for sample covariance matrix
norm(res_sparse3$cov - R, type = 'F') #for covariance with sparse eigenvectors

## ------------------------------------------------------------------------
m <- 500 # dimension
n <- 600 # number of samples
q <- 3 # number of sparse eigenvectors to be estimated
sp_card <- 0.2*m # cardinality of the sparse eigenvectors
rho <- 0.5

# generate non-overlapping sparse eigenvectors
V <- matrix(0, m, q)
V[cbind(seq(1, q*sp_card), rep(1:q, each = sp_card))] <- 
  exp(1i*runif(q*sp_card, 0, 2*pi))/sqrt(sp_card)
V <- cbind(V, matrix(rnorm(m*(m-q))*exp(1i*runif(m*(m-q),0,2*pi)), m, m-q))
# keep first q eigenvectors the same (already orthogonal) and orthogonalize the rest
V_ <- (diag(m) - V[, 1:q] %*% Conj(t(V[, 1:q]))) %*% V[, -c(1:q)]
V <- cbind(V[, 1:q], qr.Q(qr(V_)))

# generate eigenvalues
lmd <- c(100*seq(from = q, to = 1), rep(1, m-q))

# generate covariance matrix from sparse eigenvectors and eigenvalues
R <- V %*% diag(lmd) %*% Conj(t(V))

# generate data matrix from a zero-mean multivariate Gaussian distribution 
# with the constructed covariance
X <- MASS::mvrnorm(n, rep(0, m), R)  # random data with underlying sparse structure
X <- scale(X, center = TRUE, scale = FALSE)

## ------------------------------------------------------------------------
# computation of sparse eigenvectors and covariance matrix
S <- 1/(n-1) * t(X) %*% Conj(X)
res_sparse4 <- spEigen(S, q, rho)
res_sparse5 <- spEigenCov(S, q, rho)

## ---- fig.height = 7, fig.width = 7--------------------------------------
par(mfcol = c(3, 2))
plot(abs(res_sparse4$vectors[, 1]), main = "spEigen: First sparse eigenvector", 
     xlab = "index", ylab = "", type = "h")
lines(abs(V[, 1]), col = "red")
plot(abs(res_sparse4$vectors[, 2]), main = "spEigen: Second sparse eigenvector", 
     xlab = "index", ylab = "", type = "h")
lines(abs(V[, 2]), col = "red")
plot(abs(res_sparse4$vectors[, 3]), main = "spEigen: Third sparse eigenvector", 
     xlab = "index", ylab = "", type = "h")
lines(abs(V[, 3]), col = "red")

plot(abs(res_sparse5$vectors[, 1]), main = "spEigenCov: First sparse eigenvector", 
     xlab = "index", ylab = "", type = "h")
lines(abs(V[, 1]), col = "red")
plot(abs(res_sparse5$vectors[, 2]), main = "spEigenCov: Second sparse eigenvector", 
     xlab = "index", ylab = "", type = "h")
lines(abs(V[, 2]), col = "red")
plot(abs(res_sparse5$vectors[, 3]), main = "spEigenCov: Third sparse eigenvector", 
     xlab = "index", ylab = "", type = "h")
lines(abs(V[, 3]), col = "red")

## ------------------------------------------------------------------------
# show error between estimated and true covariance 
norm(abs(S - R), type = 'F') #for sample covariance matrix
norm(abs(res_sparse5$cov - R), type = 'F') #for covariance with sparse eigenvectors

