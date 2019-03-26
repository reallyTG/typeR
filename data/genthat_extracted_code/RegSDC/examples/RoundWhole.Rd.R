library(RegSDC)


### Name: RoundWhole
### Title: Round values that are close two whole numbers
### Aliases: RoundWhole
### Keywords: internal

### ** Examples

x <- c(0.0002, 1.00003, 3.00014)
RoundWhole(x)     # No values rounded
RoundWhole(x, 4)  # One value rounded
RoundWhole(x, 3)  # All values rounded
RoundWhole(x, 3, TRUE)  # One value rounded



