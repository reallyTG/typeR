library(neat)


### Name: print.neat
### Title: Print method of 'neat'
### Aliases: print.neat
### Keywords: methods

### ** Examples

A = matrix(0, nrow=7, ncol=7)
A[1,c(2,3)]=1; A[2,c(5,7)]=1;A[3,c(1,4)]=1;A[4,c(2,5,7)]=1;A[6,c(2,5)]=1;A[7,4]=1

labels = letters[1:7]
set1 = c('a','e')
set2 = c('c','g')
set3 = c('d','f')
alist = list('set 1' = set1, 'set 2' = set2)
blist = list('set 3' = set3)

test = neat(alist, blist, network=A, nettype='directed', nodes=labels, alpha=0.05)
print(test)




