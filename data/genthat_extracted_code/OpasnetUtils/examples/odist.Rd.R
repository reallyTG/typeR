library(OpasnetUtils)


### Name: odist
### Title: Random sampling using ovariables as parameters
### Aliases: odist odirichlet

### ** Examples

openv$N <- 5

test <- Ovariable(
		output=data.frame(
				a = 1:4, 
				b = rep(letters[1:4], each = 4), 
				c = rep(toupper(letters[1:4]), each = 4^2), 
				Result = 1:(4^3)), 
		marginal=c(rep(TRUE, 3), FALSE))
out <- odirichlet(test, cols = "a")
oapply(out, FUN = sum, cols = "a")

test <- Ovariable(
		output=data.frame(
				a = 1:4, 
				b = rep(letters[1:4], each = 4), 
				Iter = rep(toupper(letters[1:4]), each = 4^2), 
				Result = 1:(4^3)), 
		marginal=c(rep(TRUE, 3),FALSE))
out <- odirichlet(test, cols = "a")
oapply(out, FUN = sum, cols = "a")



