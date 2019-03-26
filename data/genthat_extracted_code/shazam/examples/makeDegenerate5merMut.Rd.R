library(shazam)


### Name: makeDegenerate5merMut
### Title: Make a degenerate 5-mer mutability model based on a 1-mer
###   mutability model
### Aliases: makeDegenerate5merMut

### ** Examples

# Make a degenerate 5-mer model (length of 1024) based on a 1-mer model
example1merMut <- c(A=0.2, T=0.1, C=0.4, G=0.3)
degenerate5merMut <- makeDegenerate5merMut(mut1mer = example1merMut)

# Look at a few 5-mers
degenerate5merMut[c("AAAAT", "AACAT", "AAGAT", "AATAT")]

# Normalized
sum(degenerate5merMut)




