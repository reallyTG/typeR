library(ResistorArray)


### Name: currents
### Title: Calculates currents in an arbitrary resistor array
### Aliases: currents currents.matrix
### Keywords: array

### ** Examples

currents(cube(),1,7)
currents.matrix(cube(),1,7)

 #check above solution: print out the currents flowing into each node:
 zapsmall(apply(currents.matrix(cube(),1,7),1,sum))



