library(BondValuation)


### Name: BondVal.Price
### Title: BondVal.Price (calculation of CP, AccrInt, DP, ModDUR, MacDUR
###   and Conv)
### Aliases: BondVal.Price

### ** Examples

data(PanelSomeBonds2016)
randombond<-sample(c(1:length(which(!(duplicated(PanelSomeBonds2016$ID.No))))),1)
df.randombond<-PanelSomeBonds2016[which(PanelSomeBonds2016$ID.No==randombond),]

PreAnalysis.randombond<-suppressWarnings(AnnivDates(
  unlist(df.randombond[
           1,c('Issue.Date','Mat.Date','CpY.Input','FIPD.Input','LIPD.Input',
               'FIAD.Input','RV.Input','Coup.Input','DCC.Input','EOM.Input')],
         use.names=FALSE)))

system.time(
  for (i in c(1:nrow(df.randombond))) {
    BondVal.Price.Output<-suppressWarnings(BondVal.Price(
      unlist(
        df.randombond[
          i,c('YtM.Input','TradeDate','Issue.Date','Mat.Date','CpY.Input',
              'FIPD.Input','LIPD.Input','FIAD.Input','RV.Input','Coup.Input',
              'DCC.Input','EOM.Input')],use.names=FALSE),
      AnnivDatesOutput=PreAnalysis.randombond))
    df.randombond$CP.Out[i]<-BondVal.Price.Output$CP
  }
)
plot(seq(1,nrow(df.randombond),by=1),df.randombond$CP.Out,"l")




