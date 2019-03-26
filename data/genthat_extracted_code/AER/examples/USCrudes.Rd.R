library(AER)


### Name: USCrudes
### Title: US Crudes Data
### Aliases: USCrudes
### Keywords: datasets

### ** Examples

data("USCrudes")
plot(price ~ gravity, data = USCrudes)
plot(price ~ sulphur, data = USCrudes)
fm <- lm(price ~ sulphur + gravity, data = USCrudes)

## 3D Visualization
if(require("scatterplot3d")) {
  s3d <- scatterplot3d(USCrudes[, 3:1], pch = 16)
  s3d$plane3d(fm, lty.box = "solid", col = 4)
}



