library(wildlifeDI)


### Name: DI
### Title: Dynamic interaction index
### Aliases: DI
### Keywords: indices

### ** Examples

data(deer)
deer37 <- deer[1]
deer38 <- deer[2]
#tc = 7.5 minutes
DI(deer37, deer38, tc = 7.5*60)
df <- DI(deer37, deer38, tc = 7.5*60, local = TRUE)



