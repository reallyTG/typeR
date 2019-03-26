library(bfa)


### Name: bfa_copula
### Title: Initialize and fit a Gaussian copula factor model
### Aliases: bfa_copula

### ** Examples

## Not run: 
##D require(MASS)
##D data(UScereal)
##D UScereal$shelf = factor(UScereal$shelf, ordered=TRUE)
##D UScereal$vitamins = factor(UScereal$vitamins, ordered=TRUE,
##D                            levels=c("none", "enriched", "100%"))
##D obj = bfa_copula(~., data=UScereal[,-1], num.factor=2, nsim=10000, nburn=1000, thin=4,
##D                      rest=list(c("sugars", 2, "0")), loading.prior="gdp", keep.scores=T,
##D                      print.status=2500)
##D biplot(obj, cex=c(0.8, 0.8))
##D plot(get_coda(obj))
##D plot(get_coda(obj, loadings=F, scores=T))
##D hpd.int = HPDinterval(obj, scores=T)
##D 
##D #sample from posterior predictive
##D ps = predict(obj)
##D 
##D m=ggplot(UScereal, aes(x=calories, y=sugars))+geom_point(position='jitter', alpha=0.5)
##D m=m+stat_density2d(data=ps, aes(x=calories, y=sugars, color = ..level..), geom='contour')
##D print(m)
##D 
##D m=ggplot(UScereal, aes(x=calories))+geom_histogram()
##D m=m+stat_density(data=ps, aes(x=calories, y=..count..), color='red',fill=NA, adjust=1.3)
##D m=m+facet_grid(shelf~.)
##D print(m)
##D 
##D #we can compute conditional dist'n estimates directly as well by supplying cond.vars
##D cond.vars=list(shelf=1)
##D out = predict(obj, resp.var="calories", cond.vars=cond.vars)
##D plot(sort(unique(UScereal$calories)), apply(out, 2,mean), type='s')
##D lines(sort(unique(UScereal$calories)), apply(out, 2, quantile, 0.05), type='s', lty=2)
##D lines(sort(unique(UScereal$calories)), apply(out, 2,quantile, 0.95), type='s', lt=2)
##D lines(ecdf(UScereal$calories[UScereal$shelf==1]), col='blue')
##D text(400, 0.1, paste("n =", sum(UScereal$shelf==1)))
##D 
##D out2 = predict(obj, resp.var="calories", cond.vars=list(shelf=2))
##D out3 = predict(obj, resp.var="calories", cond.vars=list(shelf=3))
##D plot(sort(unique(UScereal$calories)), apply(out, 2,mean), type='s')
##D lines(sort(unique(UScereal$calories)), apply(out2, 2,mean), type='s', lty=2)
##D lines(sort(unique(UScereal$calories)), apply(out3, 2,mean), type='s', lty=3)
## End(Not run)



