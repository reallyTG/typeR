library(pubh)


### Name: freq_cont
### Title: Relative and Cumulative Frequency.
### Aliases: freq_cont

### ** Examples

data(IgM, package="ISwR")
Ab <- data.frame(IgM)
estat(~ IgM, data = Ab)
freq_cont(IgM, seq(0, 4.5, 0.5))



