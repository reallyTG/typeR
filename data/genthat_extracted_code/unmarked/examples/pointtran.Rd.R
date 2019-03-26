library(unmarked)


### Name: pointtran
### Title: Simulated point-transect data
### Aliases: pointtran
### Keywords: datasets

### ** Examples

data(pointtran)
pointtran

# Format for distsamp()
ptUMF <- with(pointtran, {
        unmarkedFrameDS(y = cbind(dc1, dc2, dc3, dc4, dc5), 
        siteCovs = data.frame(area, habitat), 
        dist.breaks = seq(0, 25, by=5), survey = "point", unitsIn = "m")
        })



