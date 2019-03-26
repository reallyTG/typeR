library(HoRM)


### Name: reg.manova
### Title: Expanded MANOVA Table
### Aliases: reg.manova
### Keywords: file

### ** Examples
 
## Applied to the amit dataset.

data(amit)

fits <- manova(cbind(TOT, AMI) ~ ., data = amit)
out <- summary.aov(fits)
mvreg.out <- lapply(out, reg.manova)
mvreg.out




