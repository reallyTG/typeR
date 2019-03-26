library(DBfit)


### Name: summary.dbfit
### Title: Summarize the double bootstrap (DB) fit
### Aliases: summary.dbfit

### ** Examples

data(testdata)
y<-testdata[,5]
x<-testdata[,1:4]
fit1<-dbfit(x,y,1) # OLS fit, default
summary(fit1)



