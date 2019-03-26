library(wrapr)


### Name: grepdf
### Title: Grep for column names from a 'data.frame'
### Aliases: grepdf

### ** Examples



d <- data.frame(xa=1, yb=2)

# starts with
grepdf('^x', d)

# ends with
grepdf('b$', d)




