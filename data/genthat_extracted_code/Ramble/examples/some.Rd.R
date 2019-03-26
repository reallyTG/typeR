library(Ramble)


### Name: some
### Title: 'some' matches 1 or more of pattern 'p'. in BNF notation,
###   repetition occurs often enough to merit its own abbreviation. When
###   zero or more repetitions of a phrase 'p' are admissible, we simply
###   write 'p+'. The 'some' combinator corresponds directly to this
###   operator, and is defined in much the same way.
### Aliases: some

### ** Examples

Digit <- function(...) {satisfy(function(x) {return(!!length(grep("[0-9]", x)))})}
some(Digit()) ("123abc")



