library(eba)


### Name: thurstone
### Title: Thurstone-Mosteller Model (Case V)
### Aliases: thurstone print.thurstone
### Keywords: models

### ** Examples

## Taste data (David, 1988, p. 116)
taste <- matrix(c( 0,  3,  2,  2,
                  12,  0, 11,  3,
                  13,  4,  0,  5,
                  13, 12, 10,  0), 4, 4, byrow=TRUE)
dimnames(taste) <- setNames(rep(list(c("A1", "A2", "A3", "A4")), 2),
                            c(">", "<"))
thurstone(taste)  # Thurstone-Mosteller model fits OK



