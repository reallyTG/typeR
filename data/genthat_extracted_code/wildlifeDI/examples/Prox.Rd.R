library(wildlifeDI)


### Name: Prox
### Title: Proximity Index
### Aliases: Prox
### Keywords: indices

### ** Examples

data(deer)
deer37 <- deer[1]
deer38 <- deer[2]
#tc = 7.5 minutes, dc = 50 meters
Prox(deer37, deer38, tc=7.5*60, dc=50)
df <- Prox(deer37, deer38, tc=7.5*60, dc=50, local=TRUE)



