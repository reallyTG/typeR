library(BondValuation)


### Name: AccrInt
### Title: AccrInt (calculation of accrued interest)
### Aliases: AccrInt

### ** Examples

StartDate<-rep(as.Date("2011-08-31"),16)
EndDate<-rep(as.Date("2012-02-29"),16)
Coup<-rep(5.25,16)
DCC<-seq(1,16)
RV<-rep(10000,16)
CpY<-rep(2,16)
Mat<-rep(as.Date("2021-08-31"),16)
YearNCP<-rep(2012,16)
EOM<-rep(1,16)

DCC_Comparison<-data.frame(StartDate,EndDate,Coup,DCC,RV,CpY,Mat,YearNCP,EOM)

AccrIntOutput<-apply(DCC_Comparison[,c('StartDate','EndDate','Coup','DCC',
'RV','CpY','Mat','YearNCP','EOM')],1,function(y) AccrInt(y[1],y[2],y[3],
y[4],y[5],y[6],y[7],y[8],y[9]))
# warnings are due to apply's conversion of the variables' classes in
# DCC_Comparison to class "character"
Accrued_Interest<-do.call(rbind,lapply(AccrIntOutput, function(x) x[[1]]))
Days_Accrued<-do.call(rbind,lapply(AccrIntOutput, function(x) x[[2]]))
DCC_Comparison<-cbind(DCC_Comparison,Accrued_Interest,Days_Accrued)
DCC_Comparison





