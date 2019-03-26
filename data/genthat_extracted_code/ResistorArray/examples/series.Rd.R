library(ResistorArray)


### Name: series
### Title: Conductance matrix for resistors in series
### Aliases: series
### Keywords: array

### ** Examples

## Resistance of four resistors in series:

resistance(series(rep(1,5)),1,5) ##sic!  FOUR resistors have FIVE nodes

## What current do we need to push into a circuit of five equal
## resistors in order to maintain the potentials at 1v, 2v, ..., 6v?

circuit(series(rep(1,5)),v=1:6)  #(obvious, isn't it?)


## Now, what is the resistance matrix of four nodes connected in series
## with resistances 1,2,3 ohms?

Wu(series(1:3))  #Yup, obvious again.




