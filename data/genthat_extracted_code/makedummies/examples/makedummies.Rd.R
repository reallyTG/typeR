library(makedummies)


### Name: makedummies
### Title: Create Dummy Variables from Categorical Data
### Aliases: makedummies makedummies.default makedummies.matrix
###   makedummies.tbl

### ** Examples

#### 'data.frame' class
## factor
dat <- data.frame(x = factor(rep(c("a", "b", "c"), each = 3)))
dat$x
makedummies(dat)

## ordered
dat <- data.frame(x = factor(rep(c("a", "b", "c"), each = 3)))
dat$x <- ordered(dat$x, levels = c("a" ,"c" ,"b"))
dat$x
makedummies(dat)

## numeric
dat <- data.frame(x = rep(1:3, each = 3))
makedummies(dat)

## factor and numeric
dat <- data.frame(
    x = factor(rep(c("a", "b", "c"), each = 3)),
    y = rep(1:3, each = 3)
)
makedummies(dat)

## factors
dat <- data.frame(
x = factor(rep(c("a", "b", "c"), each = 3)),
y = factor(rep(1:3, each = 3))
)
makedummies(dat)

## "col" option
dat <- data.frame(
    x = factor(rep(c("a", "b", "c"), each = 3)),
    y = factor(rep(1:3, each = 3))
)
makedummies(dat, col = "x")

## "numerical" option
dat <- data.frame(
    x = factor(rep(c("a", "b", "c"), each = 3)),
    y = factor(rep(1:3, each = 3))
)
makedummies(dat, numeric = "x")

dat <- data.frame(
    x = factor(rep(c("a", "b", "c"), each = 3)),
    y = rep(4:6, each = 3)
)
dat$x <- ordered(dat$x, levels = c("a" ,"c" ,"b"))
dat
dat$x
makedummies(dat, numeric = c("x", "y"))

## "as.is" option
dat <- data.frame(
    x = factor(rep(c("a", "b", "c"), each = 3)),
    y = factor(rep(1:3, each = 3))
)
dat
makedummies(dat, as.is = "x")
makedummies(dat, as.is = c("x", "y"))

#### 'tibble' class
if (require(tibble)) {
  dat <- as_tibble(iris)
  makedummies(dat[46:55,], col = "Species", basal_level = TRUE)
}




