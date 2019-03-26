library(TropFishR)


### Name: synLFQ8
### Title: Synthetic length-frequency data VIII with variable harvest rate
### Aliases: synLFQ8
### Keywords: data dataset length-frequency

### ** Examples

data(synLFQ8)

# plot of length frequencies
plot(synLFQ8, Fname = "catch")

# plot of restructured length frequencies
synLFQ8 <- lfqRestructure(synLFQ8, MA = 11)
plot(synLFQ8, Fname = "rcounts")






