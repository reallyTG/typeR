library(Ramble)


### Name: many
### Title: 'many' matches 0 or more of pattern 'p'. In BNF notation,
###   repetition occurs often enough to merit its own abbreviation. When
###   zero or more repetitions of a phrase 'p' are admissible, we simply
###   write 'p*'. The 'many' combinator corresponds directly to this
###   operator, and is defined in much the same way.
### Aliases: many

### ** Examples

Digit <- function(...) {satisfy(function(x) {return(!!length(grep("[0-9]", x)))})}
many(Digit()) ("123abc")
many(Digit()) ("abc")



