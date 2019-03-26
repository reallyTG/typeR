library(Rprofet)


### Name: WOEProfet
### Title: WOE Transformation
### Aliases: WOEProfet

### ** Examples

mydata <- ISLR::Default

mydata$ID = seq(1:nrow(mydata)) ## make the ID variable
mydata$default<-ifelse(mydata$default=="Yes",1,0) ## Creating numeric binary target variable

binned <- BinProfet(mydata, id= "ID", target= "default", num.bins = 5) ## Binning variables

WOE_dat <- WOEProfet(binned, "ID","default", 3:5)

head(WOE_dat$BinWOE)
head(WOE_dat$WOE)
WOE_dat$IV
head(WOE_dat$vars$income)





