library(Rprofet)


### Name: WOEplotter
### Title: Visualizing WOE and Target Rates
### Aliases: WOEplotter

### ** Examples

mydata <- ISLR::Default

mydata$ID = seq(1:nrow(mydata)) ## make the ID variable
mydata$default<-ifelse(mydata$default=="Yes",1,0) ## Creating numeric binary target variable

binned <- BinProfet(mydata, id= "ID", target= "default", num.bins = 5) ## Binning variables

WOEplotter(binned, target= "default", var= "income_Bins")

##--Changing Colors------------------------------
WOEplotter(binned, target= "default", var= "income_Bins", color = "#33FF33")




