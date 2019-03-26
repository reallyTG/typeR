## this will render the output independent from the version of the package
suppressPackageStartupMessages(library(rrcov3way))


## Example with the UNIDO Manufacturing value added data
data(va3way)
dim(va3way)

## Treat quickly and dirty the zeros in the data set (if any)
va3way[va3way==0] <- 0.001

(res <- Tucker3(va3way))
print(res$fit)
print(res$A)
print(res$B)
print(res$C)
print(res$rd)
print(res$cutoff.rd)

(res.r <- Tucker3(va3way, robust=TRUE))
print(res.r$fit)
print(res.r$A)
print(res.r$B)
print(res.r$C)
print(res.r$rd)
print(res$cutoff.rd)
print(res.r$Hset)
print(res.r$flag)

(res.c <- Tucker3(va3way, ilr=TRUE))
print(res.c$fit)
print(res.c$A)
print(res.c$B)
print(res.c$Bclr)
print(res.c$C)
print(res.c$rd)
print(res$cutoff.rd)

(res.rc <- Tucker3(va3way, robust=TRUE, ilr=TRUE))
print(res.rc$fit)
print(res.rc$A)
print(res.rc$B)
print(res.rc$Bclr)
print(res.rc$C)
print(res.rc$rd)
print(res$cutoff.rd)
print(res.rc$Hset)
print(res.rc$flag)
