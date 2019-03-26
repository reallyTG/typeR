library(simba)


### Name: CqN
### Title: Probabilistic multiple-plot similarity indices following Chao et
###   al. (2008). Strictly preliminary.
### Aliases: CqN CqNa
### Keywords: methods multivariate

### ** Examples

# get data
data(bernina)
# run CqNa on the first time step in the summit data
CqNa(veg[1:7,], q=1)
# vary q to see what is happening when you lay more emphasis on rare (0) 
# or common (2) species
CqNa(veg[1:7,], q=0)
CqNa(veg[1:7,], q=0)

# check the development of multiple plot similarity on the summits in time
ans <- c(rep(1907,7), rep(1985,7), rep(2003,7))
by(veg, ans, function(x) CqNa(x, q=1))




