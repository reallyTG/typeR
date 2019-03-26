library(Rdpack)


### Name: char2Rdpiece
### Title: Convert a character vector to Rd piece
### Aliases: char2Rdpiece
### Keywords: RdoBuild

### ** Examples

# add a keyword section
char2Rdpiece("graphics","keyword")

# an element suitable to be put in a "usage" section
char2Rdpiece("log(x, base = exp(1))", "usage")

#
char2Rdpiece("Give more examples for this function.", "Todo", force.sec = TRUE)






