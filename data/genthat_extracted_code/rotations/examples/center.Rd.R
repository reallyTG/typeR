library(rotations)


### Name: center
### Title: Center rotation data
### Aliases: center center.Q4 center.SO3

### ** Examples

Rs <- ruars(5, rcayley)
cRs <- center(Rs, mean(Rs))
mean(cRs)                      #Close to identity matrix

all.equal(cRs, Rs - mean(Rs))  #TRUE, center and '-' have the same effect
                               #See ?"-.SO3" for more details

center(Rs,Rs)                  #n-Identity matrices: If the second argument is of the same dimension
                               #as Rs then each row is centered around the corresponding
                               #row in the first argument



