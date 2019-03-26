library(HSAUR)


### Name: roomwidth
### Title: Students Estimates of Lecture Room Width
### Aliases: roomwidth
### Keywords: datasets

### ** Examples


  data("roomwidth", package = "HSAUR")
  convert <- ifelse(roomwidth$unit == "feet", 1, 3.28)
  boxplot(I(width * convert) ~ unit, data = roomwidth)




