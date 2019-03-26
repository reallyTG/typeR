library(simba)


### Name: makead
### Title: Create artificial data set (species matrix).
### Aliases: makead ads ads.hot ads.fbg
### Keywords: datagen

### ** Examples

## create a random data-set with 200 species on 60 plots
artda <- makead(200, 60, avSR=25)

## create a gradient running from North to South (therefore you 
## need a spatially explicit model of your data which is obtained 
## with hexgrid())
coor <- hexgrid(0, 4000, 200)
coor <- coor[order(coor$ROW),] #causes coordinates to be in order.
## then the gradient vektor can easily be generated from the ROW names
gradvek <- as.numeric(coor$ROW)
## check how many plots your array has
nrow(coor)
## create a data-set with 200 species
artda <- ads(200, 100, grad.v=gradvek)
## see the species frequency distribution curve
plot(sort(colSums(artda)))




