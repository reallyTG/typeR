library(Rprofet)


### Name: BinProfet
### Title: Binning Variable(s)
### Aliases: BinProfet

### ** Examples

mydata <- ISLR::Default
head(mydata)

mydata$ID <- seq(1:nrow(mydata)) ## make an ID variable
mydata$default <- ifelse(mydata$default=="Yes", 1, 0) ## target coded with 1, 0

## bin balance and income
binned1 <- BinProfet(mydata, id="ID", target="default",
                  varcol = c("balance",  "income"), num.bins = 5)
head(binned1)

## bin categorical variable-------------------
binned2 <- BinProfet(mydata, id="ID", target="default",
                   varcol = "student", num.bins = 5)
head(binned2)
summary(binned2$student_Bins) ## num.bins overriden




