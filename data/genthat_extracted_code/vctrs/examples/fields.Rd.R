library(vctrs)


### Name: fields
### Title: Tools for accessing the fields of a record.
### Aliases: fields n_fields field field<-
### Keywords: internal

### ** Examples

x <- new_rcrd(list(x = 1:3, y = 3:1, z = letters[1:3]))
n_fields(x)
fields(x)

field(x, "y")
field(x, "y") <- runif(3)
field(x, "y")



