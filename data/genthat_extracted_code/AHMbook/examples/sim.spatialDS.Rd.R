library(AHMbook)


### Name: sim.spatialDS
### Title: Simulates data for a basic spatial distance sampling model
### Aliases: sim.spatialDS

### ** Examples

# Generate data with the default arguments and look at the structure:
tmp <- sim.spatialDS()
str(tmp)

# Generate date with model = "logit" and analyse the data with unmarked::pcount.spatialHDS
set.seed(1234)
tmp <- sim.spatialDS(model="logit")
# Plot shows a large area of good habitat west of the observer with many animals detected
str(tmp)  # 272 animals detected out of 850 inside the circle (N.real)

# Get the count of animals detected in each pixel
pixel.count <- tabulate(tmp$pixel.id, nbins=nrow(tmp$grid))
# Centre the Habitat covariate
Habitat <- tmp$Habitat - mean(tmp$Habitat)
# Create a detection covariate: distance between observer and pixel center
dist <- with(tmp, sqrt((grid[,1]-B)^2 + (grid[,2]-B)^2))
# Construct an unmarkedFrame
umf <- unmarkedFramePCount(y=cbind(pixel.count),
   siteCovs=data.frame(dist=dist, Habitat=Habitat))
summary(umf)

# Fit some models
(fm0 <- pcount.spHDS(~ -1 + I(dist^2) ~ 1, umf, K=20))
(fm1 <- pcount.spHDS(~ -1 + I(dist^2) ~ Habitat, umf, K=20))
# The model with Habitat has much lower AIC
# Get an estimate of the total population in the square (true is N = 1000)
sum(predict(fm1, type='state')[, 1])



