library(weco)


### Name: plot.weco
### Title: Plot WECO results
### Aliases: plot.weco

### ** Examples


x        <- rnorm(1000);
rst.comb <- weco.combine(x, lst.rules=list(list(1), list(2, k=9)));
plot(rst.comb, start=10, end=80, selected = c(60,70));




