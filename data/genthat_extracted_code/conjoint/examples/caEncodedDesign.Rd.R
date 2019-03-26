library(conjoint)


### Name: caEncodedDesign
### Title: Function caEncodedDesign encodes full or fractional factorial
###   design
### Aliases: caEncodedDesign
### Keywords: multivariate

### ** Examples

#Example 1
library(conjoint)
experiment<-expand.grid(
price=c("low","medium","high"),
variety=c("black","green","red"),
kind=c("bags","granulated","leafy"),
aroma=c("yes","no"))
design=caFactorialDesign(data=experiment,type="orthogonal")
print(design)
code=caEncodedDesign(design)
print(code)
print(cor(code))
write.csv2(design,file="orthogonal_factorial_design.csv",row.names=FALSE)
write.csv2(code,file="encoded_orthogonal_factorial_design.csv",row.names=FALSE)



