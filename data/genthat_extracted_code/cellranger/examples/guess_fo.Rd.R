library(cellranger)


### Name: guess_fo
### Title: Guess cell reference string format
### Aliases: guess_fo

### ** Examples

A1 <- c("A1", "$A1", "A$1", "$A$1", "a1")
guess_fo(A1)
R1C1 <- c("R1C1", "R1C[-1]", "R[-1]C1", "R[-1]C[9]")
guess_fo(R1C1)

guess_fo("RC2")
guess_fo("12")
guess_fo(12)



