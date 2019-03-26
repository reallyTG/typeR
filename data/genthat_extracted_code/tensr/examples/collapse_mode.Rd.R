library(tensr)


### Name: collapse_mode
### Title: Collapse multiple modes into one mode.
### Aliases: collapse_mode

### ** Examples

X <- array(rep(c(1, 2), 8), dim = c(2, 2, 2, 2))
X
#mode 1 is now mode 2, modes 2, 3, and 4 are combined to be mode 1.
collapse_mode(X, c(2, 3, 4))
collapse_mode(X, c(2, 4)) ## another example.
collapse_mode(X, 4) #returns X



