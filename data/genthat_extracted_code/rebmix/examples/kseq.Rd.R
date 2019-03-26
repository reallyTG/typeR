library(rebmix)


### Name: kseq
### Title: Sequence of Bins or Nearest Neighbours Generation
### Aliases: kseq
### Keywords: parameter estimation

### ** Examples

# Generate numbers of bins.

n <- 10000

Sturges <- as.integer(1 + log2(n)) # Minimum v follows Sturges rule.
Log10 <- as.integer(10 * log10(n)) # Maximum v follows Log10 rule.
RootN <- as.integer(2 * n^0.5) # Maximum v follows RootN rule.

K <- kseq(from = Sturges, to = Log10, f = 0.05)

K

K <- kseq(from = Sturges, to = RootN, f = 0.03)

K



