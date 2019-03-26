library(eseis)


### Name: signal_rotate
### Title: Rotate signal vectors using a 3-D rotation matrix.
### Aliases: signal_rotate
### Keywords: eseis

### ** Examples


## create synthetic data set
data <- rbind(x = sin(seq(0, pi, length.out = 10)),
y = sin(seq(0, pi, length.out = 10)),
z = rep(0, 10))

## rotate the data set
x_rot <- signal_rotate(data = data, 
                       angle = 15)
                      
## plot the rotated data set 
plot(x_rot[1,], col = 1, ylim = c(-2, 2))
points(x_rot[2,], col = 2)
points(x_rot[3,], col = 3)




