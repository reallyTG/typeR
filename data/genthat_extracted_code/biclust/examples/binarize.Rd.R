library(biclust)


### Name: binarize
### Title: Binarize
### Aliases: binarize binarizeByPercentage densityOnes
### Keywords: manip array

### ** Examples

  data(BicatYeast)
  m1=binarize(BicatYeast)
  m2=binarize(BicatYeast, 0.2)
  m3=binarizeByPercentage(BicatYeast, 5)
  densityOnes(m3)
  densityOnes(m2)
  densityOnes(m1)
  drawHeatmap(BicatYeast)
  drawHeatmap(m1)
  drawHeatmap(m2)
  drawHeatmap(m3)



