## ----echo = FALSE, message = FALSE---------------------------------------

## ----echo = FALSE, message = FALSE--------------
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
options(width=50)

## ----prep, include=FALSE, eval=TRUE-------------
file.copy("../tests/fmat.npy", ".")  
file.copy("../tests/fmat.npy.gz", ".")  
file.copy("../tests/fvec.npy", ".")  
file.copy("../tests/imat.npy", ".")  
file.copy("../tests/ivec.npy", ".")  

## ----ex1----------------------------------------
# load reticulate and use it to load numpy
library(reticulate)    
np <- import("numpy")

# data reading
mat <- np$load("fmat.npy")
mat

vec <- np$load("fvec.npy")
vec

## ----ex2----------------------------------------
imat <- np$load("imat.npy")
imat

## ----ex3----------------------------------------
# use the gzip modules for compressed data  
gz <- import("gzip")  
# use it to create handle to uncompressed file 
mat2 <- np$load(gz$GzipFile("fmat.npy.gz","r"))
mat2

## ----ex4----------------------------------------
tfile <- tempfile(fileext=".npy")
set.seed(42)
m <- matrix(sort(rnorm(6)), 3, 2)
m
np$save(tfile, m)

m2 <- np$load(tfile)
m2

all.equal(m, m2)

## ----ex5----------------------------------------
x <- seq(1, 10)
y <- sin(x)
np$savez("file1.npz", x, y)
np$savez("file2.npz", x=x, y=y)

## ----ex6----------------------------------------
npz1 <- np$load("file1.npz")
npz1$files
npz1$f[["arr_0"]]
npz1$f[["arr_1"]]

## ----ex7----------------------------------------
npz2 <- np$load("file2.npz")
npz2$files
npz2$f[["x"]]
npz2$f[["y"]]

## ----cleanup, include=FALSE---------------------
unlink("fmat.npy")  
unlink("fmat.npy.gz")  
unlink("fvec.npy")  
unlink("imat.npy")  
unlink("ivec.npy")  
unlink("file1.npz")  
unlink("file2.npz")  

