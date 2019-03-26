library(ggplot2)


### Name: print.ggproto
### Title: Format or print a ggproto object
### Aliases: print.ggproto format.ggproto

### ** Examples

Dog <- ggproto(
  print = function(self, n) {
    cat("Woof!\n")
  }
 )
Dog
cat(format(Dog), "\n")



