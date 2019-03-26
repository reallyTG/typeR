library(Ramble)


### Name: alt
### Title: 'alt' combinator is similar to alternation in BNF. the parser
###   '(alt(p1, p2))' recognises anything that 'p1' or 'p2' would.  The
###   approach taken in this parser follows (Fairbairn86), in which either
###   is interpretted in a sequential (or exclusive) manner, returning the
###   result of the first parser to succeed, and failure if neither does.
### Aliases: alt

### ** Examples

(item() %alt% succeed("2")) ("abcdef")



