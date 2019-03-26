library(venneuler)


### Name: venneuler
### Title: Calculates Venn and Euler Diagram
### Aliases: venneuler
### Keywords: multivariate hplot

### ** Examples

vd <- venneuler(c(A=0.3, B=0.3, C=1.1, "A&B"=0.1, "A&C"=0.2, "B&C"=0.1 ,"A&B&C"=0.1))
plot(vd)
# same as c(A=1, `A&B&C`=1, C=1)
m <- data.frame(elements=c("1","2","2","2","3"), sets=c("A","A","B","C","C"))
v <- venneuler(m)
plot(v)
m <- as.matrix(data.frame(A=c(1.5, 0.2, 0.4, 0, 0),
                          B=c(0  , 0.2, 0  , 1, 0),
                          C=c(0  , 0  , 0.3, 0, 1)))
# without weights
v <- venneuler(m > 0)
plot(v)
# with weights
v <- venneuler(m)
plot(v)



