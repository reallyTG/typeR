library(ResistorArray)


### Name: array.resistance
### Title: Resistance between two arbitrary points on a regular lattice of
###   unit resistors
### Aliases: array.resistance
### Keywords: array

### ** Examples

jj.approximate <-  array.resistance(1,2,15,17,give=FALSE)
jj.exact <- 4/pi-1/2
print(jj.exact - jj.approximate)

persp(array.resistance(4,0,14,16,give=TRUE),theta=50,r=1e9,expand=0.6)



