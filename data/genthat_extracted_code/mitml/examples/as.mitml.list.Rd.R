library(mitml)


### Name: as.mitml.list
### Title: Convert a list of data sets to 'mitml.list'
### Aliases: as.mitml.list

### ** Examples

# data frame with 'imputation' indicator
dat <- data.frame(imputation=rep(1:10,each=20), x=rnorm(200))

# split into a list and convert to 'mitml.list'
l <- split(dat, dat$imputation)
l <- as.mitml.list(l)

is.mitml.list(l)
# TRUE



