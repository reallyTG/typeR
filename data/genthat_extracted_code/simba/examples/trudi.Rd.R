library(simba)


### Name: trudi
### Title: Calculate true diversity of any order
### Aliases: trudi
### Keywords: methods multivariate

### ** Examples

# load data
data(bernina)
# run trudi with defaults
trudi(veg)
# testing another q
trudi(veg, 2)

## do something more complex: calculating the diversity components
## for the three time steps in the Bernina data
# a vector of q's
qs <- c(0:10)
# calculating diversity components per q per sampling year
div <- by(veg.lst, years, function(x) data.frame(t(sapply(c(0:10), 
function(y) trudi(mama(x), y)))))
# plot the results
par(mfrow=c(1,3), cex=1.1, las=1)
for(i in c(1:3)){
	plot(gamma ~ qs, data=div[[i]], ylim=c(0,80), type="l", 
	main=names(div)[i])
	lines(alpha ~ qs, data=div[[i]], lty=2)
	lines(beta*10 ~ qs, data=div[[i]], col="red4")
}




