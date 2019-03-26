library(wildlifeDI)


### Name: IAB
### Title: Benhamou's IAB Index
### Aliases: IAB
### Keywords: indices

### ** Examples

data(deer)
deer37 <- deer[1]
deer38 <- deer[2]
#tc = 7.5 minutes, dc = 50 meters
IAB(deer37, deer38, tc=7.5*60, dc=50)
df <- IAB(deer37, deer38, tc=7.5*60, dc=50, local=TRUE)



