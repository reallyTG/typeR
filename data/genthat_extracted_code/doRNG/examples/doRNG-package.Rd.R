library(doRNG)


### Name: doRNG-package
### Title: Generic Reproducible Parallel Backend for foreach Loops
### Aliases: doRNG-package
### Keywords: package

### ** Examples

## Don't show: 
options(R_CHECK_RUNNING_EXAMPLES_=TRUE) ## roxygen generated flag
## End(Don't show)


# register parallel backend
library(doParallel)
cl <- makeCluster(2)
registerDoParallel(cl)

## standard %dopar% loop are not reproducible
set.seed(123)
r1 <- foreach(i=1:4) %dopar%{ runif(1) }
set.seed(123)
r2 <- foreach(i=1:4) %dopar%{ runif(1) }
identical(r1, r2)
## Don't show: 
 stopifnot(!identical(r1, r2)) 
## End(Don't show)

## %dorng% loops _are_ reproducible
set.seed(123)
r1 <- foreach(i=1:4) %dorng%{ runif(1) }
set.seed(123)
r2 <- foreach(i=1:4) %dorng%{ runif(1) }
identical(r1, r2)
## Don't show: 
 stopifnot(identical(r1, r2)) 
## End(Don't show)

# alternative way of seeding 
a1 <- foreach(i=1:4, .options.RNG=123) %dorng%{ runif(1) }
a2 <- foreach(i=1:4, .options.RNG=123) %dorng%{ runif(1) }
identical(a1, a2) && identical(a1, r1)
## Don't show: 
 stopifnot(identical(a1, a2) && identical(a1, r1)) 
## End(Don't show)

## sequences of %dorng% loops _are_ reproducible
set.seed(123)
s1 <- foreach(i=1:4) %dorng%{ runif(1) }
s2 <- foreach(i=1:4) %dorng%{ runif(1) }
identical(s1, r1) && !identical(s1, s2)
## Don't show: 
 stopifnot(identical(s1, r1) && !identical(s1, s2)) 
## End(Don't show)

set.seed(123)
s1.2 <- foreach(i=1:4) %dorng%{ runif(1) }
s2.2 <- foreach(i=1:4) %dorng%{ runif(1) }
identical(s1, s1.2) && identical(s2, s2.2)
## Don't show: 
 stopifnot(identical(s1, s1.2) && identical(s2, s2.2)) 
## End(Don't show)
 
## Non-invasive way of converting %dopar% loops into reproducible loops
registerDoRNG(123)
s3 <- foreach(i=1:4) %dopar%{ runif(1) }
s4 <- foreach(i=1:4) %dopar%{ runif(1) }
identical(s3, s1) && identical(s4, s2)
## Don't show: 
 stopifnot(identical(s3, s1) && identical(s4, s2)) 
## End(Don't show)

stopCluster(cl) 




