library(superheat)


### Name: superheat
### Title: Generate supervised heatmaps.
### Aliases: superheat

### ** Examples

# plot a heatmap of the numerical iris variables
# cluster by species and plot Sepal.Length on the right
# save the superheat object to access the membership vectors
sh <- superheat(X = iris[,-c(1, 5)],
                yr = iris[,1],
                yr.axis.name = "Sepal.Length",
                membership.rows = iris$Species)
sh$membership.rows



