library(surveillance)


### Name: untie
### Title: Randomly Break Ties in Data
### Aliases: untie untie.epidataCS untie.matrix untie.default
### Keywords: utilities manip dplot

### ** Examples

# vector example
set.seed(123)
untie(c(rep(1,3), rep(1.2, 4), rep(3,3)), direction="left", sort=FALSE)

# spatial example
data(imdepi)
coords <- coordinates(imdepi$events)
table(duplicated(coords))
plot(coords, cex=sqrt(multiplicity(coords)))
set.seed(1)
coords_untied <- untie(coords)
stopifnot(!anyDuplicated(coords_untied))
points(coords_untied, col=2) # shifted by very small amount in this case



