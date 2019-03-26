library(ltable)


### Name: table_f
### Title: Function _table_f_
### Aliases: table_f
### Keywords: utilities

### ** Examples

data(sdata, package="ltable")
table_f(sdata, "a")
table_f(sdata, "a", MV=TRUE, extended=TRUE)
table_f(sdata, "a,b,c")
table_f(sdata, "a,b,c,d", type=2, digits=3)
table_f(sdata, "b,c,a,d", MV=TRUE, extended=TRUE, cb=TRUE)



