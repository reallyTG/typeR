library(RConics)


### Name: arcLengthEllipse
### Title: Arc length of an ellipse
### Aliases: arcLengthEllipse

### ** Examples

p1 <- c(3,1)
p2 <- c(0,2)

# Ellipse with semi-axes: a = 5, b= 2
saxes <- c(5,2)

# 1 iteration
arcLengthEllipse(p1,p2,saxes,n=1)

# 5 iterations
arcLengthEllipse(p1,p2,saxes,n=5)

# 10 iterations
arcLengthEllipse(p1,p2,saxes,n=10)



