library(desire)


### Name: harrington1
### Title: One-sided Harrington type desirability function
### Aliases: harrington1 ddesire.harrington1 pdesire.harrington1
###   qdesire.harrington1 edesire.harrington1 vdesire.harrington1
###   dharrington1 pharrington1 qharrington1 rharrington1 eharrington1
###   vharrington1
### Keywords: optimize multivariate

### ** Examples

##Assigning the function object to h: 
h <- harrington1(-2, .1, 2, .9) 

## Plot of desirability function: 
plot(h)

## Desirability function of a vector: 
h(seq(-2,2,0.1))

## d/p/q/r/e/v examples: 
ddesire(.8, h, 0, 1)
 dharrington1(.8, -2, .1, 2, .9, 0, 1) 

ddesire(.8, h, c(0,0.5), c(1,1.5))

pdesire(.8, h, 0, 1)
pharrington1(.8, -2, .1, 2, .9, 0, 1)

qdesire(.8, h, 0, 1)
qharrington1(.8, -2, .1, 2, .9, 0, 1)

rdesire(1e6, h, 0, 1)
rharrington1(1e6, -2, .1, 2, .9, 0, 1)

edesire(h,3,0.5)
eharrington1(-2, .1, 2, .9,3,0.5)

vdesire(h,3,0.5)
vharrington1(-2, .1, 2, .9,3,0.5) 

## b_0 and b_1 values: 
environment(h)$b0 
environment(h)$b1



