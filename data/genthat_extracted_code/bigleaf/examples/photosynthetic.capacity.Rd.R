library(bigleaf)


### Name: photosynthetic.capacity
### Title: Bulk Canopy Photosynthetic Capacity (Vcmax and Jmax)
### Aliases: photosynthetic.capacity

### ** Examples

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

# calculate Ga
Ga <- aerodynamic.conductance(DE_Tha_Jun_2014_2,Rb_model="Thom_1972")[,"Ga_h"]

# calculate Gs from the the inverted PM equation
Gs_PM <- surface.conductance(DE_Tha_Jun_2014_2,Tair="Tair",pressure="pressure",
                             Rn="Rn",G="G",S=NULL,VPD="VPD",Ga=Ga,
                             formulation="Penman-Monteith")[,"Gs_mol"]

# calculate Ci 
Ci <- intercellular.CO2(DE_Tha_Jun_2014_2,Ca="Ca",GPP="GPP",Gs=Gs_PM) 

# calculate Vcmax25 and Jmax25
photosynthetic.capacity(DE_Tha_Jun_2014_2,Temp="Tair",Ci=Ci,PPFD_j=c(200,500),PPFD_c=1000)




