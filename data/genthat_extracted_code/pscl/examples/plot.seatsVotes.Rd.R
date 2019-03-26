library(pscl)


### Name: plot.seatsVotes
### Title: plot seats-votes curves
### Aliases: plot.seatsVotes
### Keywords: hplot

### ** Examples

data(ca2006)
x <- ca2006$D/(ca2006$D+ca2006$R)
sv <- seatsVotes(x,
                 desc="Democratic Vote Shares, California 2006 congressional elections")

plot(sv)
plot(sv,type="density")
plot(sv,type="density",transform=TRUE)



