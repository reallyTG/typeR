library(virtualspecies)


### Name: sampleOccurrences
### Title: Sample occurrences in a virtual species distribution
### Aliases: sampleOccurrences

### ** Examples

# Create an example stack with six environmental variables
a <- matrix(rep(dnorm(1:100, 50, sd = 25)), 
            nrow = 100, ncol = 100, byrow = TRUE)
env <- stack(raster(a * dnorm(1:100, 50, sd = 25)),
             raster(a * 1:100),
             raster(a * logisticFun(1:100, alpha = 10, beta = 70)),
             raster(t(a)),
             raster(exp(a)),
             raster(log(a)))
names(env) <- paste("Var", 1:6, sep = "")   

# More than 6 variables: by default a PCA approach will be used
sp <- generateRandomSp(env, niche.breadth = "wide")

# Sampling of 25 presences
sampleOccurrences(sp, n = 25)

# Sampling of 30 presences and absences
sampleOccurrences(sp, n = 30, type = "presence-absence")


# Reducing of the probability of detection
sampleOccurrences(sp, n = 30, type = "presence-absence", 
                  detection.probability = 0.5)
                  
# Further reducing in relation to environmental suitability
sampleOccurrences(sp, n = 30, type = "presence-absence", 
                  detection.probability = 0.5,
                  correct.by.suitability = TRUE)
                  
                  
# Creating sampling errors (far too much)
sampleOccurrences(sp, n = 30, type = "presence-absence", 
                  error.probability = 0.5)
                  
# Introducing a sampling bias (oversampling)
biased.area <- extent(0.5, 0.7, 0.6, 0.8)
sampleOccurrences(sp, n = 50, type = "presence-absence", 
                  bias = "extent",
                  bias.area = biased.area)
# Showing the area in which the sampling is biased
plot(biased.area, add = TRUE)     

# Introducing a sampling bias (no sampling at all in the chosen area)
biased.area <- extent(0.5, 0.7, 0.6, 0.8)
sampleOccurrences(sp, n = 50, type = "presence-absence", 
                  bias = "extent",
                  bias.strength = 0,
                  bias.area = biased.area)
# Showing the area in which the sampling is biased
plot(biased.area, add = TRUE)    
samps <- sampleOccurrences(sp, n = 50, 
                           bias = "manual",
                           weights = sp$suitab.raster)
plot(sp$suitab.raster)
points(samps$sample.points[, c("x", "y")])

# Create a sampling bias so that more presences are sampled in areas with 
# higher suitability

  
    

# Reproduce sampling based on the saved .Random.seed from a previous result
samps <- sampleOccurrences(sp, n = 100, 
                           type = "presence-absence", 
                           detection.probability = 0.7, 
                           bias = "extent", 
                           bias.strength = 50, 
                           bias.area = biased.area)
# Reset the random seed using the value saved in the attributes               
.Random.seed <- attr(samps, "seed") 
reproduced_samps <- sampleOccurrences(sp, n = 100, 
                                      type = "presence-absence",
                                      detection.probability = 0.7,
                                      bias = "extent",
                                      bias.strength = 50,
                                      bias.area = biased.area)
identical(samps$sample.points, reproduced_samps$sample.points)          



