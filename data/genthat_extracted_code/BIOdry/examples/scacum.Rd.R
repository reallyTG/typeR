library(BIOdry)


### Name: scacum
### Title: Cummulative-scaled sums
### Aliases: scacum

### ** Examples

x <- c(0.79,0.32,0.53,0.43,0.18)
names(x) <- 1948:1952
scacum(x,sc.c = 4,rf.t = 1951)

##If sc.c = NA then cummulative values are scaled arround
##max(cumsum(x)):
max(cumsum(x))
scacum(x,NA,1951)



