library(data.table)


### Name: setDF
### Title: Coerce a data.table to data.frame by reference
### Aliases: setDF
### Keywords: data

### ** Examples

X = data.table(x=1:5, y=6:10)
## convert 'X' to data.frame, without any copy.
setDF(X)

X = data.table(x=1:5, y=6:10)
## idem, assigning row names
setDF(X, rownames = LETTERS[1:5])

X = list(x=1:5, y=6:10)
# X is converted to a data.frame without any copy.
setDF(X)



