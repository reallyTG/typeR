library(NCmisc)


### Name: Substitute
### Title: Convert objects as arguments to object names
### Aliases: Substitute

### ** Examples

myvar <- list(test=c(1,2,3)); var2 <- "testme"; var3 <- 10:14
print(myvar)
# single variable case, equivalent to base::substitute()
print(substitute(myvar))
print(Substitute(myvar))
# multi variable case, substitute won't work
Substitute(myvar,var2,var3)
# prv() is a wrapper for preview() allowing arguments without parentheses
# which is achieved internally by passing the arguments to Substitute()
preview(c("myvar","var2","var3"))
prv(myvar,var2,var3)



