library(Ramble)


### Name: then
### Title: 'then' combinator corresponds to sequencing in BNF. The parser
###   '(then(p1, p2))' recognises anything that 'p1' and 'p2' would if
###   placed in succession.
### Aliases: then

### ** Examples

(item() %then% succeed("123")) ("abc")



