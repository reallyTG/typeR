library(rrtable)


### Name: df2flextable
### Title: Convert data.frame to flextable
### Aliases: df2flextable

### ** Examples

require(flextable)
require(officer)
df2flextable(head(iris),vanilla=TRUE,colorheader=TRUE)
df2flextable(head(iris),vanilla=TRUE,digits=c(1,2,3,4))
df2flextable(head(iris),vanilla=FALSE)
df2flextable(head(iris),vanilla=FALSE,vlines=FALSE,fontsize=14)
df2flextable(head(mtcars))



