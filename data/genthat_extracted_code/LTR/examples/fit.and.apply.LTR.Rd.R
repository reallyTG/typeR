library(LTR)


### Name: fit.and.apply.LTR
### Title: One-step fit and apply an LTR model
### Aliases: fit.and.apply.LTR
### Keywords: models

### ** Examples

x <- matrix(nrow = 100, ncol = 10, data = rnorm(1000));
y <- matrix(nrow = 100, ncol = 10, data = rnorm(1000));
z <- y + matrix(nrow = 100, ncol = 10, data = rnorm(1000) / 10)

tmp <- fit.and.apply.LTR(
	x = x,
	dataset1 = y,
	dataset2 = z
	);



