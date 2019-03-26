library(iRepro)


### Name: intervalICC
### Title: Intraclass Correlation Coefficient for Interval-Censored Data
### Aliases: intervalICC print.ICCfit

### ** Examples

# Example with 6 predefined classes (grouped data)
classes <- 1:6
class.limits <- cbind(classes-0.5,classes+0.5)
r1 <- sample(classes,30,replace=TRUE)
r2 <- sample(classes,30,replace=TRUE)

intervalICC(r1,r2,predefined.classes=TRUE,classes,class.limits)

# The same result can be obtained with predefined.classes=FALSE option, 
# although with slower computation time
rtg1 <- matrix(nrow=30,ncol=2)
rtg2 <- matrix(nrow=30,ncol=2)
# when predefined.classes=FALSE, ratings must be given with lower and upper bounds 
# for each observation:
for(i in 1:length(classes)){
  rtg1[r1==classes[i],1] <- class.limits[i,1]
  rtg1[r1==classes[i],2] <- class.limits[i,2]
  rtg2[r2==classes[i],1] <- class.limits[i,1]
  rtg2[r2==classes[i],2] <- class.limits[i,2]
}

intervalICC(rtg1,rtg2,predefined.classes=FALSE)



