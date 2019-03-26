library(TLMoments)


### Name: as.parameters
### Title: Converting to parameters-objects
### Aliases: as.parameters as.parameters.numeric as.parameters.matrix
###   as.parameters.list as.parameters.data.frame

### ** Examples

# Vector input:
as.parameters(loc = 3, scale = 2, shape = .4, distr = "gev")
as.parameters(c(loc = 3, scale = 2, shape = .4), distr = "gev")

# Names can be shortened if unambiguous:
as.parameters(l = 3, sc = 2, sh = .4, distr = "gev")
as.parameters(m = 3, s = 1, distr = "norm")

# Wrong or ambiguous names lead to errors!
## Not run: 
##D as.parameters(l = 3, s = 2, s = .4, distr = "gev")
##D as.parameters(loc2 = 3, scale = 2, shape = .4, distr = "gev")
## End(Not run)

# If no names are given, a warning is given and they are guessed for gev, gpd, gum, and ln3.
as.parameters(3, 2, .4, distr = "gev")
as.parameters(c(3, 2, .4), distr = "gev")
## Not run: 
##D as.parameters(3, 2, .2, .4, distr = "gev") #=> doesn't work
## End(Not run)

# Matrix input:
# Parameters in matrices must have either matching rownames or colnames!
as.parameters(cbind(loc = 10, scale = 4, shape = seq(0, .4, .1)), distr = "gev")
as.parameters(rbind(loc = 10, scale = 4, shape = seq(0, .4, .1)), distr = "ln3")

# If no names are given, a guess is made based on number of rows
# or cols according to distribution (and a warning is given).
as.parameters(matrix(1:9, nr = 3), distr = "gev")
as.parameters(matrix(1:8, nc = 2), distr = "gum")


# The same principles apply for list input and data.frames:

# List input:
as.parameters(list(list(mean = 2, sd = 1), list(mean = 0, sd = 1)), distr = "norm")
as.parameters(list(c(m = 2, s = 1), c(m = 0, s = 1)), distr = "norm")
as.parameters(list(c(loc = 2, scale = 1), c(0, 1)), distr = "gum")
## Not run: 
##D as.parameters(list(c(loc = 2, scale = 1), c(0, 1, 2)), distr = "gum")
## End(Not run)

# Dataframe input:
xdat <- data.frame(station = c(1, 2), mean = c(2, 0), sd = c(1, 1))
as.parameters(xdat, cbind(mean, sd) ~ station, distr = "norm")
as.parameters(xdat, . ~ station, distr = "norm")
as.parameters(xdat, cbind(mean, sd) ~ ., distr = "norm")

xdat <- data.frame(station = c(1, 2), m = c(2, 0), s = c(1, 1))
as.parameters(xdat, cbind(m, s) ~ station, distr = "norm")
## Not run: 
##D as.parameters(xdat, cbind(m, s) ~ station, distr = "gev")
## End(Not run)

###

# Results of as.parameters can be used in the normal TLMoments-scheme:
# they can be transfered to quantiles or to TLMoments.

xdat <- data.frame(station = c(1, 2), mean = c(2, 0), sd = c(1, 1))
quantiles(as.parameters(xdat, cbind(mean, sd) ~ ., distr = "norm"), c(.99))

# quantile estimation
p <- as.parameters(loc = 3, scale = 2, shape = .4, distr = "gev")
quantiles(p, c(.9, .95))
p <- as.parameters(cbind(loc = 10, scale = 4, shape = seq(0, .4, .1)), distr = "gev")
quantiles(p, c(.9, .95))
p <- as.parameters(list(list(mean = 2, sd = 1), list(mean = 0, sd = 1)), distr = "norm")
quantiles(p, c(.95, .975))

# With magrittr
library(magrittr)
as.parameters(loc = 3, scale = 2, shape = .4, distr = "gev") %>% quantiles(c(.9, .99))



