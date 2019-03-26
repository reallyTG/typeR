library(JWileymisc)


### Name: acfByID
### Title: Estimate the effective sample size from longitudinal data
### Aliases: acfByID
### Keywords: multivariate

### ** Examples

## example 1
dat <- data.table(
  x = sin(1:30),
  time = 1:30,
  id = 1)
acfByID("x", "time", "id", data = dat)

## example 2
dat2 <- data.table(
  x = c(sin(1:30), sin((1:30)/10)),
  time = c(1:30, 1:30),
  id = rep(1:2, each = 30))
dat2$x[4] <- NA

res <- acfByID("x", "time", "id", data = dat2, na.function = "na.approx")

ggplot(res, aes(factor(Lag), AutoCorrelation)) +
  geom_boxplot()

## clean up
rm(dat, dat2, res)



