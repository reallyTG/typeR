library(ndl)


### Name: cueCoding
### Title: code a vector of cues as n-grams
### Aliases: cueCoding
### Keywords: discriminative learning

### ** Examples

# Cues from the \code{think} data: Person, Number, Register
cues <- c("First", "Plural", "hs95")
cueCoding(cues, maxn=1)
cueCoding(cues, maxn=2)



