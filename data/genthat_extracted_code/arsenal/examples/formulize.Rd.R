library(arsenal)


### Name: formulize
### Title: formulize
### Aliases: formulize

### ** Examples

## two-sided formula
formulize("y", c("x1", "x2", "x3"))

## one-sided formula
formulize(x = c("x1", "x2", "x3"))

## multi-sided formula
formulize("y", c("x1", "x2", "x3"), c("z1", "z2"), "w1")

## can use numerics for column names
data(mockstudy)
formulize(y = 1, x = 2:4, data = mockstudy)

## mix and match
formulize(1, c("x1", "x2", "x3"), data = mockstudy)

## get an interaction
formulize("y", c("x1*x2", "x3"))

## no intercept
formulize("y", "x1 - 1")
formulize("y", c("x1", "x2", "-1"))

## use in an lm
form <- formulize(2, 3:4, data = mockstudy)
summary(lm(form, data = mockstudy))

## using non-syntactic names or calls (like reformulate example)
formulize(as.name("+-"), c("`P/E`", "`% Growth`"))

f <- Surv(ft, case) ~ a + b
formulize(f[[2]], f[[3]])



