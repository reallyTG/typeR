library(BondValuation)


### Name: AnnivDates
### Title: AnnivDates (time-invariant properties and temporal structure)
### Aliases: AnnivDates

### ** Examples

data(SomeBonds2016)

# Applying the function AnnivDates to the data frame SomeBonds2016.
system.time(
  FullAnalysis<-apply(SomeBonds2016[,c('Issue.Date','Mat.Date','CpY.Input','FIPD.Input',
  'LIPD.Input','FIAD.Input','RV.Input','Coup.Input','DCC.Input','EOM.Input')],1,function(y)
  AnnivDates(y[1],y[2],y[3],y[4],y[5],y[6],y[7],y[8],y[9],y[10],RegCF.equal=1)),
gcFirst = TRUE)
# warnings are due to apply's conversion of the variables' classes in
# SomeBonds2016 to class "character"

# The output stored in FullAnalysis ist a nested list.
# Lets look at what is stored in FullAnalysis for a random bond:
randombond<-sample(c(1:nrow(SomeBonds2016)),1)
FullAnalysis[[randombond]]

# Extracting the data frame Warnings:
AllWarnings<-do.call(rbind,lapply(FullAnalysis, `[[`, 1))
summary(AllWarnings)
# binding the Warnings to the bonds
BondsWithWarnings<-cbind(SomeBonds2016,AllWarnings)

# Extracting the data frame Traits:
AllTraits<-do.call(rbind,lapply(FullAnalysis, `[[`, 2))
summary(AllTraits)
# binding the Traits to the bonds
BondsWithTraits<-cbind(SomeBonds2016,AllTraits)

# Extracting the data frame AnnivDates:
AnnivDates<-lapply(lapply(FullAnalysis, `[[`, 3), `[[`, 5)
AnnivDates<-lapply(AnnivDates, `length<-`, max(lengths(AnnivDates)))
AnnivDates<-as.data.frame(do.call(rbind, AnnivDates))
AnnivDates<-as.data.frame(lapply(AnnivDates, as.Date, as.Date(AllTraits$DateOrigin[1])))
# binding the AnnivDates to the bonds:
BondsWithAnnivDates<-cbind(SomeBonds2016,AnnivDates)

# Extracting the data frames PaySched for each bond and creating a panel:
CoupSched<-lapply(FullAnalysis, `[[`, 4)
CoupSchedPanel<-SomeBonds2016[rep(row.names(SomeBonds2016),sapply(CoupSched, nrow)),]
CoupSched<-as.data.frame(do.call(rbind, CoupSched))
CoupSchedPanel<-cbind(CoupSchedPanel,CoupSched)





