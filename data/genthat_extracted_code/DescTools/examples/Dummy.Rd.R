library(DescTools)


### Name: Dummy
### Title: Generate Dummy Codes for a Factor
### Aliases: Dummy
### Keywords: math

### ** Examples

x <- c("red","blue","green","blue","green","red","red","blue")
Dummy(x)
Dummy(x, base = 2)

Dummy(x, method = "sum")


y <- c("Max","Max","Max","Max","Max","Bill","Bill","Bill")

Dummy(y)
Dummy(y, base = "Max")

Dummy(y, base = "Max", method="full")


# "Undummy" (revert the dummy coding)
m <- Dummy(y, method="full")
m
z <- apply(m, 1, function(x) colnames(m)[x==1])
z
identical(y, as.vector(z))

m <- Dummy(y)
m
z <- apply(m, 1, function(x) ifelse(sum(x)==0, attr(m,"base"), colnames(m)[x==1]))
z



