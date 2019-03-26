library(outbreaks)


### Name: rabies_car_2003
### Title: Dog Rabies in Central African Republic, 2003-2012
### Aliases: rabies_car_2003
### Keywords: datasets

### ** Examples


if (require(incidence) && require(ape)) {
  i <- incidence(rabies_car_2003$linelist$date, 28L)
  plot(i)

  tre <- nj(dist.dna(rabies_car_2003$dna))
  plot(tre, main = "Neighbour-Joining tree")

}



