library(unmarked)


### Name: linetran
### Title: Simulated line transect data
### Aliases: linetran
### Keywords: datasets

### ** Examples

data(linetran)
linetran

# Format for distsamp()
ltUMF <- with(linetran, {
        unmarkedFrameDS(y = cbind(dc1, dc2, dc3, dc4), 
        siteCovs = data.frame(Length, area, habitat), 
        dist.breaks = c(0, 5, 10, 15, 20),
        tlength = linetran$Length * 1000, survey = "line", unitsIn = "m")
        })




