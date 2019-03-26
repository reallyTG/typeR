library(phylin)


### Name: idw
### Title: Inverse Distance Weighting interpolation
### Aliases: idw
### Keywords: idw interpolation

### ** Examples

data(vipers)
data(d.gen)
data(grid)

# interpolate and plot the genetic distances for sample s2 in the d.gen
int <- idw(d.gen[,2], vipers[,1:2], grid)

grid.image(int, grid, main='IDW interpolation', xlab='Longitude', 
           ylab='Latitude', sclab="Genetic distance to sample s2")

points(vipers[,1:2], cex=d.gen[,2]*15+0.2)

# change idw power (i.e. points will have a larger influence in the 
# surroundings)
int <- idw(d.gen[,2], vipers[,1:2], grid, p=5)

result <- data.frame(grid, int)
grid.image(int, grid, main='IDW interpolation', xlab='Longitude', 
           ylab='Latitude', sclab="Genetic distance to sample s2")

points(vipers[,1:2], cex=d.gen[,2]*15+0.2)


# change idw method to "Modified Shepard" and define a maximum 
# neighbour distance
int <- idw(d.gen[,2], vipers[,1:2], grid, 'Modified', R=10)

grid.image(int, grid, main='IDW interpolation', xlab='Longitude', 
           ylab='Latitude', sclab="Genetic distance to sample s2")

points(vipers[,1:2], cex=d.gen[,2]*15+0.2)

#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
#        Example following methods in Vandergast et al. 2008        #
#            Fit a linear model and recover the residuals           #
# ATENTION:                                                         #
#    1- Vandergast et al. (2008) suggests a RMA instead of a        # 
#       ordinary linear regression as in this example. Try package  # 
#       'lmodel2' or or other similar for RMA linear regression.    #
#    2- This example tests if the package 'geometry' is installed   #
#       to compute midpoints. If TRUE, a Delaunay triangulation is  # 
#       used, similarly to Vandergast et al. (2008). Otherwise,     #
#       midpoints are computed for the combination of all pairs of  #
#       samples.                                                    #
#                                                                   #
# the d.gen and d.real matrices in this example have the same       # 
# column and row order!                                             #
#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#

if (is.element('geometry', installed.packages()[,1])) 
    all=FALSE else 
    all=TRUE

mp <- midpoints(vipers[,1:2], all=all)
d.real <- as.matrix(dist(vipers[,1:2]))

fit <- lm(as.vector(d.gen) ~ as.vector(d.real))
resid <- matrix(fit$residuals, nrow(vipers), nrow(vipers))
dimnames(resid) <- dimnames(d.gen)
mp$z <- extract.val(resid, mp[,1:2])

int <- idw(mp[,5], mp[,3:4], grid)

grid.image(int, grid, main='IDW interpolation', 
           xlab='Longitude', ylab='Latitude', 
           sclab="Residuals of genetic vs. real distances")

# plot samples connecting lines
for (i in 1:nrow(mp))
{
    pair <- as.character(unlist(mp[i,1:2]))
    x <- c(vipers[pair[1],1], vipers[pair[2],1])
    y <- c(vipers[pair[1],2], vipers[pair[2],2])
    lines(x, y, lty=2)
}
points(vipers[,1:2], pch=16) # plot samples points in black
points(mp[,3:4], pch=16, col='gray') # plot midpoints in gray




