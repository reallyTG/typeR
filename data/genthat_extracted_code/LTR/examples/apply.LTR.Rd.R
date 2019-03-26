library(LTR)


### Name: apply.LTR
### Title: Apply a fitted LTR model to a new dataset
### Aliases: apply.LTR
### Keywords: models

### ** Examples

x <- matrix(nrow = 100, ncol = 10, data = rnorm(1000));
y <- matrix(nrow = 100, ncol = 10, data = rnorm(1000));
model.fit <- fit.LTR(x, y);

z <- apply.LTR(
	x = y + matrix(nrow = 100, ncol = 10, data = rnorm(1000) / 10),
	model.fit = model.fit
	);



