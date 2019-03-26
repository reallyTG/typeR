library(phyloclim)


### Name: niche.overlap
### Title: Quantification of Niche Overlap
### Aliases: niche.overlap

### ** Examples

# load PNOs for Oxalis sect. Palmatifoliae
data(PNO)

# niche overlap on a annual precipitation gradient:
no <- niche.overlap(PNO$AnnualPrecipitation)

# upper triangle: based on Schoeners D
# lower triangle: based on Hellinger distances
print(no)	



