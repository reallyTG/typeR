library(PairedData)


### Name: paired.plotProfiles
### Title: Profile plot
### Aliases: paired.plotProfiles

### ** Examples

data(PrisonStress)
paired.plotProfiles(PrisonStress,"PSSbefore","PSSafter",subjects="Subject",groups="Group")

# Changing the line colour
paired.plotProfiles(PrisonStress,"PSSbefore","PSSafter")+geom_line(colour="red")



