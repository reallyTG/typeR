library(paramlink)


### Name: setAvailable
### Title: Functions for modifying availability vectors
### Aliases: setAvailable swapAvailable

### ** Examples


data(toyped)
x = linkdat(toyped)
x = setAvailable(x, 3:4)
x = swapAvailable(x, 2:3)
x$available




