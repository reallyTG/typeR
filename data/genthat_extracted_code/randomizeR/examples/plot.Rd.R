library(randomizeR)


### Name: plot
### Title: Generic plotting of comparison objects
### Aliases: plot plot plot,comparison,character-method
###   plot,comparison,missing-method

### ** Examples

# compare Random Allocation Rule and Big Stick for N = 4
# with respect to the correct guesses
RAR <- getAllSeq(rarPar(4))
BSD <- getAllSeq(bsdPar(4, mti = 2))
corGuess <- corGuess("CS")
comp <- compare(corGuess, RAR, BSD)
plot(comp)




