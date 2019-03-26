library(ape)


### Name: def
### Title: Definition of Vectors for Plotting or Annotating
### Aliases: def
### Keywords: manip

### ** Examples

data(bird.orders)
a <- def(bird.orders$tip.label, Galliformes = 2)
str(a) # numeric
plot(bird.orders, font = a)
co <- def(bird.orders$tip.label, Passeriformes = "red", Trogoniformes = "blue")
str(co) # character
plot(bird.orders, tip.color = co)
### use of a regexp (so we need to quote it) to colour all orders
### with names starting with "C" (and change the default):
co2 <- def(bird.orders$tip.label, "^C" = "gold", default = "grey", regexp = TRUE)
plot(bird.orders, tip.color = co2)



