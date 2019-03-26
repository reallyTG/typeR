library(DemoDecomp)


### Name: stepwise_replacement
### Title: implementation of the decomposition algorithm of stepwise
###   replacement
### Aliases: stepwise_replacement

### ** Examples

data(Mxc1)
data(Mxc2)
# we'll want to pass in these dimensions
dims  <- dim(Mxc1)
# we need parameters in vec form
Mxc1v <- c(Mxc1)
Mxc2v <- c(Mxc2)
B     <- stepwise_replacement(func = Mxc2e0abrvec, 
		pars1 = Mxc1v, pars2 = Mxc2v, dims = dims, 
		# authors' recommendations:
		symmetrical = TRUE, direction = "up")
dim(B) <- dims
# the output, B, is also a single vector. Each element corresponds 
# to the effect of changes in that particular covariate toward the 
# overall change in the function value. sum(B) should equal the
# original difference
(check1 <- Mxc2e0abr(Mxc2) - Mxc2e0abr(Mxc1))
(check2 <- sum(B))
## Don't show: 
# de facto unit test. In this case the residual is very tiny,
# but if differences are very large and there are very many components,
# then the residual can be larger albeit trivial. In that case
# increase N and go make a coffee.
stopifnot(abs(check1 - check2) < .Machine$double.eps)
check3 <- Mxc2e0abrvec(Mxc2v, dims = dims)- Mxc2e0abrvec(Mxc1v, dims = dims)
stopifnot(abs(check3 - check2) < .Machine$double.eps)
## End(Don't show)

# This package does not supply default plotting functions, but one 
# strategy might be the following:
## Not run: 
##D Age <- c(0, 1, seq(5, 85, by = 5))
##D matplot(Age, B, type = 'l', 
##D xlab = "Age", ylab = "Contrib to diff in e(0)", col = 1:6)
##D legend("bottomleft",lty=1:5,col=1:6, 
##D          legend = c("Neoplasms","Circulatory","Respiratory",
##D 			     "Digestive","Acc/viol","Other"))
## End(Not run)



