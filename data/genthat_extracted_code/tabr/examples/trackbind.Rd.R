library(tabr)


### Name: trackbind
### Title: Bind track tables
### Aliases: trackbind

### ** Examples

x <- phrase("c ec'g' ec'g'", "4 4 2", "5 432 432")
x1 <- track(x)
x2 <- track(x, voice = 2)
trackbind(x1, x1)
trackbind(x1, x2, tabstaff = c(1, 1))



