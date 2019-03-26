library(qle)


### Name: multiSearch
### Title: A multistart version of local searches for parameter estimation
### Aliases: multiSearch

### ** Examples

 data(normal)
 x0 <- c("mu"=3.5,"sigma"=1.5)
 S0 <- multiSearch(x0=x0,qsd,method=c("qscoring","bobyqa"),
           opts=list("ftol_stop"=1e-9,"score_tol"=1e-3),nstart=4,
            optInfo=TRUE,verbose=TRUE)

 roots <- attr(S0,"roots")
 id <- attr(roots,"id")
 stopifnot(!is.na(id)) 
 id  # index of best root found in matrix roots
 attr(roots,"par")  # the final parameter estimate w.r.t. id
 



