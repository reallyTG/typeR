library(REAT)


### Name: locq.growth
### Title: Portfolio matrix for specialization and growth
### Aliases: locq.growth

### ** Examples

data(Goettingen)
# Loads employment data for Goettingen and Germany (2008-2017)

locq.growth(Goettingen$Goettingen2008[2:16], Goettingen$Goettingen2017[2:16],
Goettingen$BRD2008[2:16], Goettingen$BRD2017[2:16], 
psize = Goettingen$Goettingen2017[2:16], 
industry.names = Goettingen$WA_WZ2008[2:16], pcol.border = "grey", 
leg = TRUE, leg.fsize = 0.4, leg.x = -0.2)



