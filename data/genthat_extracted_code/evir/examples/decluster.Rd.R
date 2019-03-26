library(evir)


### Name: decluster
### Title: Decluster Point Process
### Aliases: decluster
### Keywords: manip

### ** Examples

# decluster the 200 exceedances of a particular threshold in 
# the negative BMW data
data(bmw)
out <- pot(-bmw, ne = 200) 
decluster(out$data, 30) 



