library(bigleaf)


### Name: surface.conductance
### Title: Surface Conductance to Water Vapor
### Aliases: surface.conductance

### ** Examples

## filter data to ensure that Gs is a meaningful proxy to canopy conductance (Gc)
DE_Tha_Jun_2014_2 <- filter.data(DE_Tha_Jun_2014,quality.control=FALSE,
                                 vars.qc=c("Tair","precip","VPD","H","LE"),
                                 filter.growseas=FALSE,filter.precip=TRUE,
                                 filter.vars=c("Tair","PPFD","ustar","LE"),
                                 filter.vals.min=c(5,200,0.2,0),
                                 filter.vals.max=c(NA,NA,NA,NA),NA.as.invalid=TRUE,
                                 quality.ext="_qc",good.quality=c(0,1),
                                 missing.qc.as.bad=TRUE,GPP="GPP",doy="doy",
                                 year="year",tGPP=0.5,ws=15,min.int=5,precip="precip",
                                 tprecip=0.1,precip.hours=24,records.per.hour=2)

# calculate Gs based on a simple gradient approach
Gs_gradient <- surface.conductance(DE_Tha_Jun_2014_2,Tair="Tair",pressure="pressure",
                                   VPD="VPD",formulation="Flux-Gradient")
summary(Gs_gradient)

# calculate Gs from the the inverted PM equation (now Rn, and Ga are needed),
# using a simple estimate of Ga based on Thom 1972
Ga <- aerodynamic.conductance(DE_Tha_Jun_2014_2,Rb_model="Thom_1972")[,"Ga_h"]

# if G and/or S are available, don't forget to indicate (they are ignored by default).
# Note that Ga is not added to the data.frame 'DE_Tha_Jun_2014'
Gs_PM <- surface.conductance(DE_Tha_Jun_2014_2,Tair="Tair",pressure="pressure",
                             Rn="Rn",G="G",S=NULL,VPD="VPD",Ga=Ga,
                             formulation="Penman-Monteith")
summary(Gs_PM)

                              
# now add Ga to the data.frame 'DE_Tha_Jun_2014' and repeat
DE_Tha_Jun_2014_2$Ga <- Ga
Gs_PM2 <- surface.conductance(DE_Tha_Jun_2014_2,Tair="Tair",pressure="pressure",
                              Rn="Rn",G="G",S=NULL,VPD="VPD",Ga="Ga",
                              formulation="Penman-Monteith")
# note the difference to the previous version (Ga="Ga")
summary(Gs_PM2)




