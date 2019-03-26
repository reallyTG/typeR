library(wildlifeDI)


### Name: contacts
### Title: Mapping wildlife contacts
### Aliases: contacts
### Keywords: indices

### ** Examples

data(deer)
deer37 <- deer[1]
deer38 <- deer[2]
#tc = 7.5 minutes, dc = 50 meters
spts <- contacts(deer37, deer38, tc=7.5*60, dc=50)



