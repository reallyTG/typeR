library(rphast)


### Name: write.hmm
### Title: Write an HMM object to a file
### Aliases: write.hmm
### Keywords: hmm

### ** Examples

state.names <- c("neutral", "conserved")
h <- hmm(matrix(c(0.99, 0.01, 0.01, 0.99), nrow=2,
                dimnames=list(state.names, state.names)),
                eq.freq=c(neutral=0.9, conserved=0.1))
filename <- tempfile()
write.hmm(h, filename)
unlink(filename)



