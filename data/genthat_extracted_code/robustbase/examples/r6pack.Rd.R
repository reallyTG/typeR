library(robustbase)


### Name: r6pack
### Title: Robust Distance based observation orderings based on robust "Six
###   pack"
### Aliases: r6pack
### Keywords: robust multivariate

### ** Examples

data(pulpfiber)
dim(m.pulp <- data.matrix(pulpfiber)) #  62 x 8
dim(fr6  <- r6pack(m.pulp, h = 40, full.h= FALSE)) #  h x 6  = 40 x 6
dim(fr6F <- r6pack(m.pulp, h = 40, full.h= TRUE )) #  n x 6  = 62 x 6
stopifnot(identical(fr6, fr6F[1:40,]))
## Don't show: 
stopifnot(apply(fr6[1:10,], 2L,
   function(col) c(1,3,6,35,36,38) %in% col))
## End(Don't show)



