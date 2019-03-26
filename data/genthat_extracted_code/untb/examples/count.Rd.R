library(untb)


### Name: count
### Title: Construct, coerce, and test for a count object
### Aliases: count as.count is.count
### Keywords: math

### ** Examples
 



a <- c(rep("oak",5) ,rep("ash",2),rep("elm",3),rep("xx",4))
as.count(a)




data(saunders)
as.count(saunders[1,-(1:150)])

jj <- sample(1:5,5,replace=TRUE)
as.count(jj)
as.count(jj,add="spp.")




