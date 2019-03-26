library(OpenImageR)


### Name: delationErosion
### Title: Delation or Erosion of an image
### Aliases: delationErosion

### ** Examples


path = system.file("tmp_images", "1.png", package = "OpenImageR")

image = readImage(path)

res_delate = delationErosion(image, Filter = c(3,3), method = 'delation')

res_erode = delationErosion(image, Filter = c(5,5), method = 'erosion')




