library(NCmisc)


### Name: headl
### Title: A good way to preview large lists.
### Aliases: headl

### ** Examples

sub1 <- list(list(1:100),list(2:101),list(101:200),list(201:300),list(301:400))
big.list <- list(sub1,sub1,sub1,sub1,sub1,sub1)
headl(sub1)
headl(big.list,skip=2)



