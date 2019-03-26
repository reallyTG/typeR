library(ResistorArray)


### Name: Wu
### Title: Wu's resistance matrix
### Aliases: Wu
### Keywords: array

### ** Examples


Wu(cube())

Wu(cube())[1,2] - resistance(cube(),1,2)

Wu(series(1:7))  # observe how resistance between, say, nodes 2
                 # and 5 is 9 (=2+3+4)




