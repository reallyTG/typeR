library(ssMousetrack)


### Name: generate_design
### Title: Generate the design of a mouse-tracking experiment
### Aliases: generate_design

### ** Examples


## Generate a design with Q = 2 categorical variables:
## the first variable has K = 4 levels generated via symmetric method
## the second variable has K = 3 levels generated via random method.
X <- generate_design(I = 10, J = 12, K = c(4,3), Z.type = c("symmetric","random"))
print(X)



