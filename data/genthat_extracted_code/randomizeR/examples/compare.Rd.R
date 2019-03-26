library(randomizeR)


### Name: compare
### Title: Comparison of randomization procedures
### Aliases: compare compare compare,issue,missing-method
###   compare,issue,endpoint-method

### ** Examples

# compare Random Allocation Rule and Big Stick for N = 4
# with respect to the correct guesses
RAR <- getAllSeq(rarPar(4))
BSD <- getAllSeq(bsdPar(4, mti = 2))
corGuess <- corGuess("CS")
(comp <- compare(corGuess, RAR, BSD))
plot(comp)

# compare the same procedures with respect to selection bias
endp <- normEndp(c(2, 2), c(1, 1))
selBias <- selBias("CS", 4, "exact")
(comp <- compare(selBias, RAR, BSD, endp = endp))
plot(comp)




