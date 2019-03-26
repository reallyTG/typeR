library(vcd)


### Name: shadings
### Title: Shading-generating Functions for Residual-based Shadings
### Aliases: shadings shading_hsv shading_hcl shading_max shading_Friendly
###   shading_Friendly2 shading_Marimekko shading_diagonal shading_sieve
###   shading_binary hcl2hex
### Keywords: hplot

### ** Examples

## load Arthritis data
data("Arthritis")
art <- xtabs(~Treatment + Improved, data = Arthritis)

## plain mosaic display without shading
mosaic(art)

## with shading for independence model
mosaic(art, shade = TRUE)
## which uses the HCL shading
mosaic(art, gp = shading_hcl)
## the residuals are too small to have color,
## hence the cut-offs can be modified
mosaic(art, gp = shading_hcl, gp_args = list(interpolate = c(1, 1.8)))
## the same with the Friendly palette 
## (without significance testing)
mosaic(art, gp = shading_Friendly, gp_args = list(interpolate = c(1, 1.8)))

## assess independence using the maximum statistic
## cut-offs are now critical values for the test statistic
mosaic(art, gp = shading_max)

## association plot with shading as in base R
assoc(art, gp = shading_binary(col = c(1, 2)))

## Marimekko Chart
hec <- margin.table(HairEyeColor, 1:2)
mosaic(hec, gp = shading_Marimekko(hec))
mosaic(HairEyeColor, gp = shading_Marimekko(HairEyeColor))

## Diagonal cells shading
ac <- xtabs(VisualAcuity)
mosaic(ac, gp = shading_diagonal(ac))




