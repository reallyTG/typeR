library(EEM)


### Name: drawEEM
### Title: Draw contour for EEM data
### Aliases: drawEEM drawEEM.EEM drawEEM.EEMweight drawEEM.data.frame
###   drawEEM.matrix drawEEM.numeric

### ** Examples

# method for class "EEM"
data(applejuice)
drawEEM(applejuice, 1) # draw contour of the first sample
drawEEM(applejuice, 1, flipaxis = TRUE) # flip the axis

# method for class "EEMweight"
applejuice_uf <- unfold(applejuice) # unfold list into matrix
result <- prcomp(applejuice_uf) 
drawEEM(getLoading(result), 1) # plot loading of the first PC




