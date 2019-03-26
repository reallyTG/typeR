library(spatstat)


### Name: fryplot
### Title: Fry Plot of Point Pattern
### Aliases: fryplot frypoints
### Keywords: spatial nonparametric

### ** Examples

## unmarked data
fryplot(cells)
Y <- frypoints(cells)

## numerical marks
fryplot(longleaf, width=4, axes=TRUE)

## multitype points
fryplot(amacrine, width=0.2,
                  from=(marks(amacrine) == "on"),
                  chars=c(3,16), cols=2:3,
                  main="Fry plot centred at an On-cell")
points(0,0)



