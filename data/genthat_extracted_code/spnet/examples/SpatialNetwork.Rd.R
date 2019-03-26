library(spnet)


### Name: SpatialNetwork-class
### Title: Class '"SpatialNetwork"'
### Aliases: SpatialNetwork-class
### Keywords: classes network sp spatial

### ** Examples

people <- c("John", "Elsa", "Brian", "Kate")
position <- c(2,4,6,8)

net1.df <- data.frame(
  'NODE' = people,
  'POSITION' = position
)

net1 <- spnet.create(
  x = net1.df
)
net1

net2 <- spnet.create(
  x = people
)
net2



