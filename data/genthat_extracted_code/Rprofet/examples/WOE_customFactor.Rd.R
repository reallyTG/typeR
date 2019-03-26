library(Rprofet)


### Name: WOE_customFactor
### Title: Custom Binning Factor Variables
### Aliases: WOE_customFactor

### ** Examples

mydata <- ISLR::Default
mydata$default <- ifelse(mydata$default=="Yes", 1, 0) ## target coded with 1, 0
## WOE_customFactor
custom1 <- WOE_customFactor(mydata, var="student", target="default",
                 new_levels=c("Student : No","Student : Yes"))
levels(custom1)
## --------------------------
mydata$balance_cat <- cut(mydata$balance, breaks = c(-1,400,800,1200,1600,2000,2400,2800),
                      labels = c("Very-Low","Low","Med-Low","Med","Med-High","High","Very-High"))
custom2 <- WOE_customFactor(mydata, var="balance_cat", target="default",
                   new_levels=c(1,1,2,2,2,3,3))
levels(custom2)




