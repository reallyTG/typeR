library(Ramble)


### Name: using
### Title: 'using' combinator allows us to manipulate results from a
###   parser, for example building a parse tree. The parser '(p %using% f)'
###   has the same behaviour as the parser 'p', except that the function
###   'f' is applied to each of its result values.
### Aliases: using

### ** Examples

(item() %using% as.numeric) ("1abc")



