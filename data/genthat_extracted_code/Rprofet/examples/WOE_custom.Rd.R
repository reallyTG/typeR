library(Rprofet)


### Name: WOE_custom
### Title: Custom Binning Numeric Variables
### Aliases: WOE_custom

### ** Examples

mydata <- ISLR::Default
mydata$default <- ifelse(mydata$default=="Yes", 1, 0) ## target coded with 1, 0
WC_1 <- WOE_custom(dataset=mydata, var="balance", target = "default",
           breaks=seq(0,3000,1000))
levels(factor(WC_1))
WC_2 <- WOE_custom(dataset=mydata, var="income", target = "default",
             breaks=seq(0,75000, 15000))
levels(factor(WC_2))




