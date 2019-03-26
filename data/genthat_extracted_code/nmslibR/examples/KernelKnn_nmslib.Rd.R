library(nmslibR)


### Name: KernelKnn_nmslib
### Title: Approximate Kernel k nearest neighbors using the nmslib library
### Aliases: KernelKnn_nmslib

### ** Examples


if (reticulate::py_available() && reticulate::py_module_available("nmslib")) {

  library(nmslibR)

  x = matrix(runif(1000), nrow = 100, ncol = 10)

  y = runif(100)

  out = KernelKnn_nmslib(data = x, y = y, k = 5)
}



