library(trend)


### Name: lanzante.test
### Title: Lanzante's Test for Change Point Detection
### Aliases: lanzante.test
### Keywords: htest nonparametric ts univar

### ** Examples

data(maxau) ; plot(maxau[,"s"])
s.res <- lanzante.test(maxau[,"s"])
n <- s.res$nobs
i <- s.res$estimate
s.1 <- mean(maxau[1:i,"s"])
s.2 <- mean(maxau[(i+1):n,"s"])
s <- ts(c(rep(s.1,i), rep(s.2,(n-i))))
tsp(s) <- tsp(maxau[,"s"])
lines(s, lty=2)
print(s.res)


data(PagesData) ; lanzante.test(PagesData)



