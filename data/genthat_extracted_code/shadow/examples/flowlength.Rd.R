library(shadow)


### Name: flowlength
### Title: Calculate flow length
### Aliases: flowlength

### ** Examples

# Example from Fig. 2 in Mayor et al. 2008

elev = rbind(
  c(8, 8, 8, 8, 9, 8, 9),
  c(7, 7, 7, 7, 9, 7, 7),
  c(6, 6, 6, 6, 6, 5, 7),
  c(4, 5, 5, 3, 5, 4, 7),
  c(4, 5, 4, 5, 4, 6, 5),
  c(3, 3, 3, 3, 2, 3, 3),
  c(2, 2, 2, 3, 4, 1, 3)
)
veg = rbind(
  c(TRUE,  TRUE,  TRUE,  TRUE,  FALSE, FALSE, TRUE),
  c(TRUE,  TRUE,  TRUE,  TRUE,  TRUE,  FALSE, FALSE),
  c(FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE),
  c(FALSE, TRUE,  FALSE, FALSE, FALSE, FALSE, TRUE),
  c(TRUE,  TRUE,  FALSE, FALSE, FALSE, FALSE, FALSE),
  c(TRUE,  TRUE,  TRUE,  FALSE, FALSE, FALSE, FALSE),
  c(FALSE, TRUE,  TRUE,  FALSE, FALSE, TRUE,  TRUE)
)

# Calculate flow length
f = flowlength(elev, veg)

# Plot
library(raster)
r = raster(f)
pnt = rasterToPoints(r)
plot(r, main = "Flow length")
text(pnt[, 1:2], as.character(round(pnt[, 3], 1)))




