library(Rprofet)


### Name: ScorecardProfet
### Title: Scorecard Builder
### Aliases: ScorecardProfet

### ** Examples

mydata <- ISLR::Default

mydata$ID = seq(1:nrow(mydata)) ## make the ID variable
mydata$default<-ifelse(mydata$default=="Yes",1,0) ## Creating numeric binary target variable

binned <- BinProfet(mydata, id= "ID", target= "default", num.bins = 5) ## Binning variables

WOE_dat <- WOEProfet(binned, "ID","default", 3:5) ## WOE transformation of bins

Score_dat <- ScorecardProfet(WOE_dat, target="default",
                             id= "ID", PDO = 50, BaseOdds = 10, BasePts = 1000, reverse = TRUE)

Score_dat$GLMSummary
head(Score_dat$Scorecard) ## Less points means more likely to default





