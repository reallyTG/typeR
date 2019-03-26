library(RCircos)


### Name: RCircos.Get.Data.Point.Height
### Title: Calculate the Height of Data in A Track
### Aliases: RCircos.Get.Data.Point.Height
### Keywords: methods

### ** Examples

data.values <- runif(1000, -4, 11)
library(RCircos)
data.height <- RCircos.Get.Data.Point.Height(data.values,  
    min.value=-4, max.value=14, plot.type="points",  
    track.height=NULL)



