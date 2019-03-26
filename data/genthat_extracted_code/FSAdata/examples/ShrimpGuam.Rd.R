library(FSAdata)


### Name: ShrimpGuam
### Title: Catch and effort data for Deepwater Caridean Shrimp.
### Aliases: ShrimpGuam
### Keywords: datasets

### ** Examples

data(ShrimpGuam)
str(ShrimpGuam)
head(ShrimpGuam)

## Computations by the original authors
# CPE for just the standard traps
ShrimpGuam$CPE <- ShrimpGuam$standard/ShrimpGuam$effort
# Total catch in both traps
ShrimpGuam$total <- ShrimpGuam$standard+ShrimpGuam$pyramid
# Cumulative catch in both traps (with the Ricker modification)
ShrimpGuam$cumCatch <- cumsum(ShrimpGuam$total)-ShrimpGuam$total/2




