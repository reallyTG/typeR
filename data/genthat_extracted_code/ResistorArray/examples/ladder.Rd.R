library(ResistorArray)


### Name: ladder
### Title: Jacob's ladder of resistors
### Aliases: ladder
### Keywords: array

### ** Examples


#  Resistance of an infinite Jacob's ladder with unit resistors is known
#  to be (sqrt(5)-1)/2:

 phi <- (sqrt(5)-1)/2
 resistance(ladder(20),1,2) - phi
 resistance(ladder(60),1,2) - phi

 Wu(ladder(20))[1,2]-phi


# z is the resistance of all the resistors:

 ladder(n=8,z=1/(1:13))

# See how node 1 is the "earth", with resistors of conductance 1,2,...,7
#  connecting to nodes 2-8.  Then nodes 5 & 6, say, are connected by a
#  resistor of conductance 11.




