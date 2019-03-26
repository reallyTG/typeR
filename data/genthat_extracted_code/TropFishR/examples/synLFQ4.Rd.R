library(TropFishR)


### Name: synLFQ4
### Title: Synthetic length-frequency data IV (with seasonal oscillation)
### Aliases: synLFQ4
### Keywords: data dataset length-frequency

### ** Examples

data(synLFQ4)

# plot of length frequencies
plot(synLFQ4, Fname = "catch")

# plot of restructured length frequencies
synLFQ4 <- lfqRestructure(synLFQ4, MA = 15)
plot(synLFQ4, Fname = "rcounts")






