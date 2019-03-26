library(SPOT)


### Name: OCBA
### Title: Low Level OCBA
### Aliases: OCBA
### Keywords: internal

### ** Examples

## Simple test
OCBA(1:10,1:10,rep(4,10),3)
## Example from the referenced book:
res <- OCBA(c(1.2,2.1,3.4,4.87,6.05),c(3.3,2.0,4.5,5.3,6.9),c(12,6,5,5,4),100)
##expected result: 
res == c(48,38,11,2,1)



