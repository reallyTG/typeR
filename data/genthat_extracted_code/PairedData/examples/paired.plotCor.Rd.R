library(PairedData)


### Name: paired.plotCor
### Title: Paired correlation plot
### Aliases: paired.plotCor

### ** Examples

data(PrisonStress)
paired.plotCor(PrisonStress,"PSSbefore","PSSafter")

# Changing the theme of the ggplot object
paired.plotCor(PrisonStress,"PSSbefore","PSSafter")+theme_bw()



