library(Benchmarking)


### Name: peers
### Title: Find peer firms and units
### Aliases: peers get.number.peers get.which.peers
### Keywords: ~kwd1 ~kwd2

### ** Examples

x <- matrix(c(100,200,300,500,100,200,600),ncol=1)
y <- matrix(c(75,100,300,400,25,50,400),ncol=1)

e <- dea(x,y)
peers(e)
get.number.peers(e)

# Who are the firms that firm 1 and 4 is peers for
get.which.peers(e, c(1,4))



