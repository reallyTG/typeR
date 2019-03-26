library(TropFishR)


### Name: synLFQ7
### Title: Synthetic length-frequency data VII with seasonal oscillation
### Aliases: synLFQ7
### Keywords: data dataset length-frequency

### ** Examples

data(synLFQ7)

# plot of length frequencies
plot(synLFQ7, Fname = "catch")

# plot of restructured length frequencies
synLFQ7 <- lfqRestructure(synLFQ7, MA = 11)
plot(synLFQ7, Fname = "rcounts")






