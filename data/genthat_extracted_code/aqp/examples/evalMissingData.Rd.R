library(aqp)


### Name: evalMissingData
### Title: Evaluate Missing Data
### Aliases: evalMissingData
### Keywords: manip

### ** Examples

# example data
data(sp2)
# init SPC object
depths(sp2) <- id ~ top + bottom
# compute data completeness
sp2$data.complete <- evalMissingData(sp2, vars = c('r', 'g', 'b'), name = 'name')
# rank
new.order <- order(sp2$data.complete)
# plot along data completeness ranking
plot(sp2, plot.order=new.order)
# add axis, note re-ordering of axis labels
axis(side=1, at=1:length(sp2), labels = round(sp2$data.complete[new.order], 2),
line=-2, cex.axis=0.75)



