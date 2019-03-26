library(PairedData)


### Name: paired.plotBA
### Title: Bland-Altman plot
### Aliases: paired.plotBA

### ** Examples

data(PrisonStress)
paired.plotBA(PrisonStress,"PSSbefore","PSSafter")

# Extending the resulting ggplot object by faceting
paired.plotBA(PrisonStress,"PSSbefore","PSSafter")+facet_grid(~Group)



