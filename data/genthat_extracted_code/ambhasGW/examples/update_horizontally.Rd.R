library(ambhasGW)


### Name: update_horizontally
### Title: Horizontal distribution of the flow in grid.
### Aliases: update_horizontally

### ** Examples




# create synthetic head:
h <- cbind(c(1,2,3),c(4,5,6),c(7,8,9))
h
beta <- 0.5
h1 <- update_horizontally(h, beta)
h1

# increase the value of beta:
beta <- 1.0
h1 <- update_horizontally(h, beta)

# decrease the value of beta:
beta <- 0
h1 <- update_horizontally(h, beta)
h1




