library(BuyseTest)


### Name: constStrata
### Title: Strata creation
### Aliases: constStrata
### Keywords: function

### ** Examples

data(veteran,package="survival")
  
# strata with two variables : celltype and karno
veteran$strata1 <- constStrata(veteran,c("celltype","karno"))
table(veteran$strata1)
  
# strata with three variables : celltype, karno and age dichotomized at 60 years
veteran$age60 <- veteran$age>60
veteran$age60 <- factor(veteran$age60,labels=c("<=60",">60")) # convert to factor with labels
veteran$strata2 <- constStrata(veteran,c("celltype","karno","age60"))
table(veteran$strata2) # factor strata variable 
  
veteran$strata2 <- constStrata(veteran,c("celltype","karno","age60"), as.numeric=TRUE)
table(veteran$strata2) # numeric strata variable




