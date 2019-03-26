library(phylin)


### Name: extract.val
### Title: Extact pairwise values from a matrix in a specified order.
### Aliases: extract.val
### Keywords: variogram kriging

### ** Examples


data(vipers)
data(d.gen)

# calculate midpoints
mp <- midpoints(vipers[,1:2])

# extract values from d.gen. Columns 1 and 2 of mp have the information 
# about source and target samples.   
pair.data <- extract.val(d.gen, mp[,1:2]) 

# it is easier to view in a plot:
plot(vipers[,1:2], pch=vipers[,3], main="Midpoints between samples", 
     xlab="Longitude", ylab="Latitude")
#trace all connecting lines between samples
sps <- rownames(vipers)
for (i in 1:nrow(mp)) 
{
    sp <- mp[i, 1:2] #source an target samples
    mask <- c(which(sps == sp[,1]), which(sps == sp[,2]))
    lines(vipers$x[mask], vipers$y[mask], lty=2, col='lightgrey')
}

#midpoints with genetic distance acentuated
points(mp[,3:4], col='red', pch=16, cex=pair.data*15+0.5) 




