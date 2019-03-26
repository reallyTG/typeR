library(BondValuation)


### Name: DP
### Title: DP (dirty price calculation of a fixed-coupon bond)
### Aliases: DP

### ** Examples

CP<-rep(100,16)
SETT<-rep(as.Date("2014-10-15"),16)
Em<-rep(as.Date("2013-11-30"),16)
Mat<-rep(as.Date("2021-04-21"),16)
CpY<-rep(2,16)
FIPD<-rep(as.Date("2015-02-28"),16)
LIPD<-rep(as.Date("2020-02-29"),16)
FIAD<-rep(as.Date("2013-11-30"),16)
RV<-rep(100,16)
Coup<-rep(5.25,16)
DCC<-seq(1,16,by=1)
DP.DCC_Comparison<-data.frame(CP,SETT,Em,Mat,CpY,FIPD,LIPD,FIAD,RV,Coup,DCC)

# you can pass an array to AnnivDates
List<-suppressWarnings(
        AnnivDates(unlist(DP.DCC_Comparison[1,c(3:11)],use.names=FALSE))
)

# and use its output in DP
suppressWarnings(
       DP(unlist(DP.DCC_Comparison[1,c(1:11)],use.names=FALSE),AnnivDatesOutput=List)
)

# or just apply DP to the data frame
DP.Output<-suppressWarnings(
              apply(DP.DCC_Comparison[,c('CP','SETT','Em','Mat','CpY','FIPD',
                                           'LIPD','FIAD','RV','Coup','DCC')],
                     1,function(y) DP(y[1],y[2],y[3],y[4],y[5],y[6],y[7],
                                      y[8],y[9],y[10],y[11])))

DiryPrice<-do.call(rbind,lapply(lapply(DP.Output, `[[`, 2), `[[`, 1))
DP.DCC_Comparison<-cbind(DP.DCC_Comparison,DiryPrice)
DP.DCC_Comparison




