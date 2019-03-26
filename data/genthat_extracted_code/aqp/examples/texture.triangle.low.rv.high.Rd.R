library(aqp)


### Name: textureTriangleSummary
### Title: Soil Texture Low-RV-High as Defined by Quantiles
### Aliases: textureTriangleSummary texture.triangle.low.rv.high
### Keywords: hplot

### ** Examples

# sample data
data(loafercreek, package='soilDB')

# extract sand, silt, clay proportions
x <- na.omit(data.frame(sand=loafercreek$sand, silt=loafercreek$silt, clay=loafercreek$clay))

# test out the function
textureTriangleSummary(x, p=c(0.05, 0.5, 0.95))
textureTriangleSummary(x, p=c(0.25, 0.5, 0.75), range.col='darkgreen')

# simulate compositional data from source mean / var-covar matrix
if(require(compositions)) {
  # add simulated low-rv-high
  textureTriangleSummary(x, p=c(0.05, 0.5, 0.95), sim=TRUE)
}




