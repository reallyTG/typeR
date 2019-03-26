library(SNPassoc)


### Name: WGassociation
### Title: Whole genome association analysis
### Aliases: WGassociation WGstats print.WGassociation
###   summary.WGassociation labels.WGassociation pvalues
###   pvalues.WGassociation codominant.WGassociation dominant.WGassociation
###   recessive.WGassociation overdominant.WGassociation
###   additive.WGassociation [.WGassociation
### Keywords: utilities

### ** Examples

data(SNPs)
datSNP<-setupSNP(SNPs,6:40,sep="")
ansAll<-WGassociation(protein~1,data=datSNP,model="all")

# In that case the formula is not required. You can also write:
# ansAll<-WGassociation(protein,data=datSNP,model="all")


#only codominant and log-additive
ansCoAd<-WGassociation(protein~1,data=datSNP,model=c("co","log-add"))

#for printing p values
print(ansAll)
print(ansCoAd)

#for obtaining a matrix with the p palues
pvalAll<-pvalues(ansAll)
pvalCoAd<-pvalues(ansCoAd)

# when all models are fitted and we are interested in obtaining 
# p values for different genetic models

# codominant model
pvalCod<-codominant(ansAll)

# recessive model
pvalRec<-recessive(ansAll)

# and the same for additive, dominant or overdominant


#summary
summary(ansAll)

#for a detailed report
WGstats(ansAll)

#for plotting the p values
plot(ansAll)


#
# Whole genome analysis
#

data(HapMap)
# Next steps may be very time consuming. So they are not executed

#myDat<-setupSNP(HapMap, colSNPs=3:9809, sort = TRUE,
#   info=HapMap.SNPs.pos, sep="")
#resHapMap<-WGassociation(group~1, data=myDat, model="log")


# However, the results are saved in the object "resHapMap"
# to illustrate print, summary and plot functions
summary(resHapMap)
plot(resHapMap)
print(resHapMap)




