library(TropFishR)


### Name: synLFQ5
### Title: Synthetic length-frequency data V (without seasonal oscillation)
### Aliases: synLFQ5
### Keywords: data dataset length-frequency

### ** Examples

data(synLFQ5)

# plot of length frequencies
plot(synLFQ5, Fname = "catch")

# plot of restructured length frequencies
synLFQ5 <- lfqRestructure(synLFQ5, MA = 15)
plot(synLFQ5, Fname = "rcounts")






