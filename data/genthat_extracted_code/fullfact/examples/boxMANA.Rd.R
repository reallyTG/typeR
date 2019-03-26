library(fullfact)


### Name: boxMANA
### Title: Boxplot of resampled results
### Aliases: boxMANA

### ** Examples


#Import bootstrap resampled data model results
data(chinook_bootL) #Chinook salmon offspring length

#Default plot
boxMANA(comp=chinook_bootL)
#Add plot modifications
boxMANA(comp=chinook_bootL,yunit=20,ymax=100,cex_ylab=1.3)

##Group length and survival together in the same plot
data(chinook_bootS) #Chinook salmon offspring survival
chinook_bootL$trait<- "length"
chinook_bootS$trait<- "survival"

colnames(chinook_bootL[,-2])
colnames(chinook_bootS)
#
comb_boot<- rbind(chinook_bootL[,-2],chinook_bootS) #remove 'tray'
comb_boot$trait<- as.factor(comb_boot$trait) #to form levels

#Default plot
boxMANA(comp=comb_boot)
#Add plot modifications
boxMANA(comp=comb_boot,yunit=20,ymax=100,cex_ylab=1.3)



