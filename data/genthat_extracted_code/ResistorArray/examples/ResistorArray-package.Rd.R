library(ResistorArray)


### Name: ResistorArray-package
### Title: Electrical Properties of Resistor Networks
### Aliases: ResistorArray-package ResistorArray
### Keywords: package

### ** Examples

# resistance between opposite corners of a skeleton cube:
resistance(cube(),1,7)   # known to be 5/6 Ohm

# resistance of a Jacob's ladder:
 resistance(ladder(60),1,2)  # should be about (sqrt(5)-1)/2

# Google aptitude test:
 array.resistance(1,2,15,17)  # analytical answer 4/pi-1/2



