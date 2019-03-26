library(refund)


### Name: pffr
### Title: Penalized flexible functional regression
### Aliases: pffr

### ** Examples

###############################################################################
# univariate model:
# Y(t) = f(t)  + \int X1(s)\beta(s,t)ds + eps
set.seed(2121)
data1 <- pffrSim(scenario="ff", n=40)
t <- attr(data1, "yindex")
s <- attr(data1, "xindex")
m1 <- pffr(Y ~ ff(X1, xind=s), yind=t, data=data1)
summary(m1)
plot(m1, pers=TRUE, pages=1)

## Not run: 
##D ###############################################################################
##D # multivariate model:
##D # E(Y(t)) = \beta_0(t)  + \int X1(s)\beta_1(s,t)ds + xlin \beta_3(t) +
##D #        f_1(xte1, xte2) + f_2(xsmoo, t) + \beta_4 xconst
##D data2 <- pffrSim(scenario="all", n=200)
##D t <- attr(data2, "yindex")
##D s <- attr(data2, "xindex")
##D m2 <- pffr(Y ~  ff(X1, xind=s) + #linear function-on-function
##D                 xlin  +  #varying coefficient term
##D                 c(te(xte1, xte2)) + #bivariate smooth term in xte1 & xte2, const. over Y-index
##D                 s(xsmoo) + #smooth effect of xsmoo varying over Y-index
##D                 c(xconst), # linear effect of xconst constant over Y-index
##D         yind=t,
##D         data=data2)
##D summary(m2)
##D plot(m2, pers=TRUE)
##D str(coef(m2))
##D # convenience functions:
##D preddata <- pffrSim(scenario="all", n=20)
##D str(predict(m2, newdata=preddata))
##D str(predict(m2, type="terms"))
##D cm2 <- coef(m2)
##D cm2$pterms
##D str(cm2$smterms, 2)
##D str(cm2$smterms[["s(xsmoo)"]]$coef)
##D 
##D #############################################################################
##D # sparse data (80% missing on a regular grid):
##D set.seed(88182004)
##D data3 <- pffrSim(scenario=c("int", "smoo"), n=100, propmissing=0.8)
##D t <- attr(data3, "yindex")
##D m3.sparse <- pffr(Y ~ s(xsmoo), data=data3$data, ydata=data3$ydata, yind=t)
##D summary(m3.sparse)
##D plot(m3.sparse, pers=TRUE, pages=1)
## End(Not run)



