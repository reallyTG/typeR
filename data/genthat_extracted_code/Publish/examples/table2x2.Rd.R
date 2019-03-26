library(Publish)


### Name: table2x2
### Title: 2x2 table calculus for teaching
### Aliases: table2x2

### ** Examples

table2x2(table("marker"=rbinom(100,1,0.4),"response"=rbinom(100,1,0.1)))
table2x2(matrix(c(71,18,38,8),ncol=2),stats="table")
table2x2(matrix(c(71,18,38,8),ncol=2),stats=c("rr","fisher"))



