library(hyper2)


### Name: Extract
### Title: Extract or replace parts of a hyper2 object
### Aliases: Extract.hyper2 extract extractor [.hyper2 [<-.hyper2

### ** Examples

data(chess)

chess[1]
chess[c(1,2)]
chess[list(1,1:2)]
chess[1] <- 5

a <- hyper2(pnames=letters[1:8])
a[sapply(seq_len(8),seq_len)] <- 1
a

b <- a
b[1] <- 1000
b[2] <- 2000
b[] <- a      # b[1] overwritten; b[2] preserved





