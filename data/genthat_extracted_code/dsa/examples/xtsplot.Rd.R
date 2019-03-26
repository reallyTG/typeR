library(dsa)


### Name: xtsplot
### Title: Create a plot for xts series
### Aliases: xtsplot

### ** Examples

x <- xts::xts(rnorm(100), seq.Date(as.Date("2010-01-01"), length.out=100, by="months"))
y <- xts::xts(runif(100), seq.Date(as.Date("2010-01-01"), length.out=100, by="months"))
xtsplot(x, font="sans")
xtsplot(y, transform="diff", type="bar", font="sans")
xtsplot(y, font="sans")
xtsplot(y, transform="diff", type="bar", date_breaks="24 months", font="sans")
xtsplot(merge(x,y), names=c("Gaussian", "Uniform"), main="Simulated series", font="sans")



