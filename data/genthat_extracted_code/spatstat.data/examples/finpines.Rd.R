library(spatstat.data)


### Name: finpines
### Title: Pine saplings in Finland.
### Aliases: finpines
### Keywords: datasets spatial

### ** Examples

    data(finpines)
  if(require(spatstat)) {
    plot(unmark(finpines), main="Finnish pines: locations")
    plot(finpines, which.marks="height", main="heights")
    plot(finpines, which.marks="diameter", main="diameters")
    plot(finpines, which.marks="diameter", 
              main="diameters to scale", markscale=1/200)
  }



