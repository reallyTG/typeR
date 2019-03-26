library(regclass)


### Name: extrapolation_check
### Title: A crude check for extrapolation
### Aliases: extrapolation.check extrapolation_check

### ** Examples

  data(SALARY)
  M <- lm(Salary~Education*Experience+Months,data=SALARY)
  newdata <- data.frame(Education=c(0,5,10),Experience=c(15,15,15),Months=c(0,0,0))
  extrapolation_check(M,newdata) 
  #Individuals 1 and 3 are rather unusual (though not terribly) while individual 2 is typical.  



