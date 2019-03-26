library(reporttools)


### Name: eliminateNA
### Title: Eliminate all observations with at least one NA in a data frame
### Aliases: eliminateNA
### Keywords: manip character

### ** Examples

pat <- 1:10; var1 <- rnorm(10); var2 <- factor(round(rgamma(10, 2, 1)))
dat <- data.frame(cbind(pat, var1, var2))
dat[c(2, 8), 3] <- NA
eliminateNA(dat)



