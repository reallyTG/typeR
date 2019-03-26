library(wiqid)


### Name: standardize
### Title: Scaling and centring of vectors, matrices and arrays
### Aliases: standardize standardize2match

### ** Examples

# Generate some fake elevation data:
elev <- runif(100, min=100, max=500)
mean(elev) ; sd(elev)
str( e <- standardize(elev) )
mean(e) ; sd(e)

# Standardize so that e=0 corresponds to exactly 300m and +/- 1 to
#   a change of 100m:
e <- standardize(elev, center=300, scale=100)
mean(e)
mean(elev) - 300
range(e)
range(elev) - 300

# Generate data matrix for survey duration for 3 surveys at 10 sites
dur <- matrix(round(runif(30, 20, 60)), nrow=10, ncol=3)
d <- standardize(dur)
mean(d) ; sd(d)

# Standardize new data to match the mean and SD of 'dur'
(new <- seq(20, 60, length.out=11))
standardize2match(new, dur)

# compare with base::scale
dx <- base::scale(dur)
colMeans(dx) ; apply(dx, 2, sd)
colMeans(d) ; apply(d, 2, sd)
# Don't use 'standardize' if the columns in the matrix are different variables!



