## ----echo = FALSE, message = FALSE---------------------------------------
knitr::opts_chunk$set(python.reticulate = TRUE)
if (identical(Sys.info()[['sysname']], "Windows")) {
    knitr::opts_chunk$set(eval = FALSE)                                      
    msg <- paste("Note: Some examples in this vignette require Python", 
                 "but you are running this vignette on Windows where Python",
                 "is much less likely to be present, or even known to be",
                 "missing (i.e. win-builder) so examples will not be evaluated.")
    msg <- paste(strwrap(msg), collapse="\n")
    message(msg) 
}

## ----rex1----------------------------------------------------------------
library(RcppCNPy)
mat <- npyLoad("fmat.npy")
mat
vec <- npyLoad("fvec.npy")
vec

## ----rex2, eval=FALSE----------------------------------------------------
#  mat2 <- npyLoad("fmat.npy.gz")
#  mat2

## ----rex3----------------------------------------------------------------
set.seed(42)
m <- matrix(sort(rnorm(6)), 3, 2)
m
npySave("randmat.npy", m)
v <- seq(10, 12)
v
npySave("simplevec.npy", v)

## ----rex4, echo=FALSE----------------------------------------------------
unlink("fmat.npy")
unlink("fvec.npy")
unlink("randmat.npy")
unlink("simplevec.npy")

