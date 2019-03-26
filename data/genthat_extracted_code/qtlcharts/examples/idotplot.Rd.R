library(qtlcharts)


### Name: idotplot
### Title: Interactive phenotype x genotype plot
### Aliases: idotplot
### Keywords: hplot

### ** Examples

n <- 100
g <- sample(LETTERS[1:3], n, replace=TRUE)
y <- rnorm(n, match(g, LETTERS[1:3])*10, 5)
## No test: 
idotplot(g, y)
## End(No test)




