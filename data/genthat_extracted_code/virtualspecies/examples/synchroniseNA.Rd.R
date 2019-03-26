library(virtualspecies)


### Name: synchroniseNA
### Title: Synchronise NA values among layers of a stack
### Aliases: synchroniseNA

### ** Examples

# Creation of a stack with different NAs across layers
m <- matrix(nr = 10, nc = 10, 1:100)
r1 <- raster(m)
r2 <- raster(m)
r1[sample(1:ncell(r1), 20)] <- NA
r2[sample(1:ncell(r2), 20)] <- NA
s <- stack(r1, r2)


# Effect of the synchroniseNA() function
plot(s) # Not yet synchronised
s <- synchroniseNA(s)
plot(s) # Synchronised




