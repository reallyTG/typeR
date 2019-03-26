library(prLogistic)


### Name: UIS
### Title: UIS - The UMARU IMPACT Study - Data
### Aliases: UIS
### Keywords: datasets

### ** Examples

data("UIS", package = "prLogistic")
 attach(UIS) 
 tmp=table(drugFree,trt)   
 options(digits=2)             
 prop.table(tmp,2)             



