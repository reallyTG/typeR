library(fda)


### Name: basisfd.product
### Title: Product of two basisfd objects
### Aliases: basisfd.product *.basisfd
### Keywords: smooth

### ** Examples

  f1 <- create.fourier.basis()
  f1.2 <- f1*f1
  ## Don't show: 
stopifnot(
## End(Don't show)
  all.equal(f1.2, create.fourier.basis(nbasis=5))
  ## Don't show: 
)
## End(Don't show)



