library(fungible)


### Name: Omega
### Title: Compute Omega hierarchical
### Aliases: Omega

### ** Examples

## Create a bifactor structure
bifactor <- matrix(c(.21, .49, .00, .00,
                     .12, .28, .00, .00,
                     .17, .38, .00, .00,
                     .23, .00, .34, .00,
                     .34, .00, .52, .00,
                     .22, .00, .34, .00,
                     .41, .00, .00, .42,
                     .46, .00, .00, .47,
                     .48, .00, .00, .49),
                   nrow = 9, ncol = 4, byrow = TRUE)

## Compute Omega
Out1 <- Omega(lambda = bifactor)




