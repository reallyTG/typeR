library(epitools)


### Name: kapmeier
### Title: Implements product-limit (Kaplan-Meier) method
### Aliases: kapmeier
### Keywords: survival

### ** Examples

##Product-limit method using 'kapmeier' function
tt <- c(1,17,20,9,24,16,2,13,10,3)
ss <- c(1,1,1,1,0,0,0,1,0,1)
round(kapmeier(tt, ss), 3)



