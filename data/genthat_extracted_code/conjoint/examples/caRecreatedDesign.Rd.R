library(conjoint)


### Name: caRecreatedDesign
### Title: Function caRecreatedDesign reconstructs factorial design
### Aliases: caRecreatedDesign
### Keywords: multivariate

### ** Examples

#Example 1
library(conjoint)
attrNames<-c("price","variety","kind","aroma")
levNumbers<-c(3,3,3,2)
z<-c("low","medium","high","black","green","red","bags","granulated","leafy","yes","no")
profNumbers<-c(3,4,14,20,27,29,33,35,39,43,46,50,51)
design<-caRecreatedDesign(attrNames,levNumbers,z,profNumbers)
print(design)
write.csv2(design$dnumbers,file="design_numbers.csv",row.names=FALSE)
write.csv2(design$dnames,file="design_names.csv",row.names=FALSE)



