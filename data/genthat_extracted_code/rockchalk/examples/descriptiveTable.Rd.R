library(rockchalk)


### Name: descriptiveTable
### Title: Summary stats table-maker for regression users
### Aliases: descriptiveTable

### ** Examples

dat <- genCorrelatedData2(1000, means=c(10, 10, 10), sds = 3, 
                          stde = 3, beta = c(1, 1, -1, 0.5))
dat$xcat1 <- factor(sample(c("a", "b", "c", "d"), 1000, replace=TRUE))
dat$xcat2 <- factor(sample(c("M", "F"), 1000, replace=TRUE), levels = c("M", "F"),
labels = c("Male", "Female"))
dat$y <- dat$y + contrasts(dat$xcat1)[dat$xcat1, ] %*% c(0.1, 0.2, 0.3)
m4 <- lm(y ~ x1 + x2  + x3 + xcat1 + xcat2, dat)
m4.desc <- descriptiveTable(m4)
m4.desc
## Following may cause scientific notation, want to avoid.
dat <- genCorrelatedData2(1000, means=c(10, 100, 400), 
                 sds = c(3, 10, 20), stde = 3, beta = c(1, 1, -1, 0.5))
m5 <- lm(y ~ x1 + x2  + x3, dat)
m5.desc <- descriptiveTable(m5, digits = 4)
m5.desc




