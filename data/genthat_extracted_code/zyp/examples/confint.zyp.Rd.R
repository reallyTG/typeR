library(zyp)


### Name: confint.zyp
### Title: confint.zyp
### Aliases: confint.zyp
### Keywords: ts robust

### ** Examples

x <- c(0, 1, 2, 4, 5)
y <- c(6, 4, 1, 8, 7)
slope <- zyp.sen(y~x)
ci <- confint.zyp(slope)



