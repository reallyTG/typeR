library(newTestSurvRec)


### Name: fit.Data.Survrecu
### Title: This function let to adjust the IDs the database
### Aliases: fit.Data.Survrecu
### Keywords: dataframe data

### ** Examples
data(MMC.TestSurvRec)
ID<-fit.Data.Survrecu(Survrecu(MMC.TestSurvRec$id,MMC.TestSurvRec$time,
                               MMC.TestSurvRec$event))
ID
fit<-PSH.fit(Survrecu(ID,MMC.TestSurvRec$time,
                               MMC.TestSurvRec$event))
fit$time
fit$surv
plot(fit$time,fit$surv)

 ## No test: 
data(DataColonDukesABvsD)
XL<-data(DataColonDukesABvsD)
DataColonDukesABvsD$Iden
Y<-fit.Data.Survrecu(Survrecu(DataColonDukesABvsD$Iden,DataColonDukesABvsD$time,
                                  DataColonDukesABvsD$event))
Y
fit<-WC.fit(Survrecu(Y,DataColonDukesABvsD$time,DataColonDukesABvsD$event))
fit$time
fit$surv
plot(fit$time,fit$surv)
print(data.frame(time=fit$time,n.event=fit$n.event, 
                     Surv=fit$survfunc,std.error=fit$std.error))
## End(No test)




