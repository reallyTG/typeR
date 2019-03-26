library(freegroup)


### Name: Extract
### Title: Extract or replace parts of a free group object
### Aliases: Extract.free [.free [<-.free

### ** Examples


x <- rfree(20,8,8)

x[5:6]
x[1:2]  <- -x[11:12]


x[1:5] %<>%  keep(1:3)





