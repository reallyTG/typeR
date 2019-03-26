library(regsem)


### Name: cv_regsem
### Title: The main function that runs multiple penalty values.
### Aliases: cv_regsem
### Keywords: calc optim

### ** Examples

## Not run: 
##D library(regsem)
##D vignette("overview",package="regsem")
##D # put variables on same scale for regsem
##D HS <- data.frame(scale(HolzingerSwineford1939[,7:15]))
##D mod <- '
##D f =~ x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9
##D '
##D outt = cfa(mod, HS)
##D # increase to > 25
##D cv.out = cv_regsem(outt,type="lasso", pars_pen=c(1:2,6:8),
##D           n.lambda=5,jump=0.01)
##D # check parameter numbers
##D extractMatrices(outt)["A"]
##D # equivalent to
##D mod <- '
##D f =~ 1*x1 + l1*x2 + l2*x3 + l3*x4 + l4*x5 + l5*x6 + l6*x7 + l7*x8 + l8*x9
##D '
##D outt = cfa(mod,HS)
##D # increase to > 25
##D cv.out = cv_regsem(outt, type="lasso", pars_pen=c("l1","l2","l6","l7","l8"),
##D          n.lambda=5,jump=0.01)
##D summary(cv.out)
##D plot(cv.out, show.minimum="BIC")
##D 
##D mod <- '
##D f =~ x1 + x2 + x3 + x4 + x5 + x6
##D '
##D outt = cfa(mod, HS)
##D # can penalize all loadings
##D cv.out = cv_regsem(outt,type="lasso", pars_pen="loadings",
##D                   n.lambda=5,jump=0.01)
##D 
##D mod2 <- '
##D f =~ x4+x5+x3
##D #x1 ~ x7 + x8 + x9 + x2
##D x1 ~ f
##D x2 ~ f
##D '
##D outt2 = cfa(mod2, HS)
##D extractMatrices(outt2)$A
##D # if no pars_pen specification, defaults to all
##D # regressions
##D cv.out = cv_regsem(outt2,type="lasso",
##D                   n.lambda=15,jump=0.03)
##D # check
##D cv.out$pars_pen
## End(Not run)



