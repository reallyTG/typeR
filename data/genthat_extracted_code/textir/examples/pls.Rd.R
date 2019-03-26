library(textir)


### Name: pls
### Title: Partial Least Squares
### Aliases: pls predict.pls summary.pls print.pls plot.pls

### ** Examples

data(congress109)
x <- t( t(congress109Counts)/rowSums(congress109Counts) )
summary( fit <- pls(x, congress109Ideology$repshare, K=3) )
plot(fit, pch=21, bg=c(4,3,2)[congress109Ideology$party])
predict(fit, newdata=x[c(68,388),])



