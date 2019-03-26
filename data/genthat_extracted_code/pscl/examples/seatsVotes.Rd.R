library(pscl)


### Name: seatsVotes
### Title: A class for creating seats-votes curves
### Aliases: seatsVotes
### Keywords: misc

### ** Examples

data(ca2006)
x <- ca2006$D/(ca2006$D+ca2006$R)
sv <- seatsVotes(x,
                 desc="Democratic Vote Shares, California 2006 congressional elections")



