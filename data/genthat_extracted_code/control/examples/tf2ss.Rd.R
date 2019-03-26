library(control)


### Name: tf2ss
### Title: Transfer function model conversion to State-space model.
### Aliases: tf2ss

### ** Examples

tf2ss(tf(1, c(1,2,1)))

## Not run:   OR 

sys <- tf(1, c(1,2,1))
tf2ss(sys)

## Not run:   OR 

sys2 <- tf2ss(1, c(1,2,1))




