library(lava)


### Name: click
### Title: Identify points on plot
### Aliases: click idplot click.default colsel
### Keywords: iplot

### ** Examples

if (interactive()) {
    n <- 10; x <- seq(n); y <- runif(n)
    plot(y ~ x); click(x,y)

    data(iris)
    l <- lm(Sepal.Length ~ Sepal.Width*Species,iris)
    res <- plotConf(l,var2="Species")## ylim=c(6,8), xlim=c(2.5,3.3))
    with(res, click(x,y))

    with(iris, idplot(Sepal.Length,Petal.Length))
}



