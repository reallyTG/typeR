library(rockchalk)


### Name: cutFancy
### Title: Create an ordinal variable by grouping numeric data input.
### Aliases: cutFancy

### ** Examples

set.seed(234234)
y <- rnorm(1000, m = 35, sd = 14)
yord <- cutFancy(y, cutpoints = c(30, 40, 50))
table(yord)
attr(yord, "props")
attr(yord, "cutpoints")
yord <- cutFancy(y, categories = 4L)
table(yord, exclude = NULL)
attr(yord, "props")
attr(yord, "cutpoints")
yord <- cutFancy(y, probs = c(0, .1, .3, .7, .9, 1.0),
                  categories = c("A", "B", "C", "D", "E"))
table(yord, exclude = NULL)
attr(yord, "props")
attr(yord, "cutpoints")
yord <- cutFancy(y, probs = c(0, .1, .3, .7, .9, 1.0))
table(yord, exclude = NULL)
attr(yord, "props")
attr(yord, "cutpoints")
yasinteger <- as.integer(yord)
table(yasinteger, yord)
yasnumeric <- as.numeric(levels(yord))[yord]
table(yasnumeric, yord)
barplot(attr(yord, "props"))
hist(yasnumeric)
X1a <-
   genCorrelatedData3("y ~ 1.1 + 2.1 * x1 + 3 * x2 + 3.5 * x3 + 1.1 * x1:x3",
                       N = 10000, means = c(x1 = 1, x2 = -1, x3 = 3),
                       sds = 1, rho = 0.4)
## Create cutpoints from quantiles
probs <- c(.3, .6)
X1a$yord <- cutFancy(X1a$y, probs = probs)
attributes(X1a$yord)
table(X1a$yord, exclude = NULL)



