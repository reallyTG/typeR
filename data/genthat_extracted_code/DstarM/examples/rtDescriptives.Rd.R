library(DstarM)


### Name: rtDescriptives
### Title: Descriptives of reaction time data
### Aliases: rtDescriptives

### ** Examples

tt <- seq(0, 5, .01)
pars <- matrix(.5, 5, 2)
pars[1, ] <- 1
pars[2, ] <- c(0, 2)
dat <- simData(n = 3e3, pars = pars, tt = tt, pdfND = dbeta(tt, 10, 30))
x <- rtDescriptives(data = dat)

print(x$table, what = 'cr')
print(x$table, what = 'c')
print(x$table, what = 'r')



