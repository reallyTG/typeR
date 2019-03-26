library(desire)


### Name: harrington2
### Title: Two-sided Harrington type desirability function
### Aliases: harrington2 ddesire.harrington2 pdesire.harrington2
###   qdesire.harrington2 edesire.harrington2 vdesire.harrington2
###   dharrington2 pharrington2 qharrington2 rharrington2 eharrington2
###   vharrington2
### Keywords: optimize multivariate

### ** Examples
##Assigning the function object to h: 
h <- harrington2(3,7,1) 

## Plot of desirability function: 
plot(h)

## Desirability function of a vector: 
h(seq(2,8,0.1))

## d/p/q/r/e/v examples: 
ddesire(4, h, 0, 1)
dharrington2(4, 3, 7, 1, 0, 1) 

ddesire(4, h, c(0,0.5),c(1,1.5))

pdesire(4, h, 0, 1)
pharrington2(4, 3, 7, 1, 0, 1)

qdesire(0.8, h, 0, 1)
qharrington2(0.8, 3, 7, 1, 0, 1)

rdesire(1e6, h, 0, 1)
rharrington2(1e6, 3, 7, 1, 0, 1)

edesire(h,3,0.5)

vdesire(h,3,0.5)



