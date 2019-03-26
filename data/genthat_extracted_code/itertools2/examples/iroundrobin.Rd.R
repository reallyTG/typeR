library(itertools2)


### Name: iroundrobin
### Title: Iterator that traverses each given iterable in a roundrobin
###   order
### Aliases: iroundrobin

### ** Examples

it <- iterators::iter(c("A", "B", "C"))
it2 <- iterators::iter("D")
it3 <- iterators::iter(c("E", "F"))
as.list(iroundrobin(it, it2, it3)) # A D E B F C

it_rr <- iroundrobin(1:3, 4:5, 7:10)
as.list(it_rr) # 1 4 7 2 5 8 3 9 10



