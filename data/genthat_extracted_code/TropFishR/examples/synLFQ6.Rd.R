library(TropFishR)


### Name: synLFQ6
### Title: Synthetic length-frequency data VI (without seasonal
###   oscillation)
### Aliases: synLFQ6
### Keywords: data dataset length-frequency

### ** Examples

data(synLFQ6)

# plot of length frequencies
plot(synLFQ6, Fname = "catch")

# plot of restructured length frequencies
synLFQ6 <- lfqRestructure(synLFQ6, MA = 7)
plot(synLFQ6, Fname = "rcounts")






