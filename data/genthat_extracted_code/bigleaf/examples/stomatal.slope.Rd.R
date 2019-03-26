library(bigleaf)


### Name: stomatal.slope
### Title: Stomatal Slope Parameter "g1"
### Aliases: stomatal.slope

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

# calculate Gs from the the inverted PM equation
Ga <- aerodynamic.conductance(DE_Tha_Jun_2014_2,Rb_model="Thom_1972")[,"Ga_h"]

# if G and/or S are available, don't forget to indicate (they are ignored by default).
Gs_PM <- surface.conductance(DE_Tha_Jun_2014_2,Tair="Tair",pressure="pressure",
                             Rn="Rn",G="G",S=NULL,VPD="VPD",Ga=Ga,
                             formulation="Penman-Monteith")[,"Gs_mol"]
                             
### Estimate the stomatal slope parameter g1 using the USO model
mod_USO <- stomatal.slope(DE_Tha_Jun_2014_2,model="USO",GPP="GPP",Gs=Gs_PM,
                          robust.nls=FALSE,nmin=40,fitg0=FALSE)
                          
### Use robust regression to minimize influence of outliers in Gs                           
mod_USO <- stomatal.slope(DE_Tha_Jun_2014_2,model="USO",GPP="GPP",Gs=Gs_PM,
                          robust.nls=TRUE,nmin=40,fitg0=FALSE)

### Estimate the same parameter from the Ball&Berry model and prescribe g0
mod_BB <- stomatal.slope(DE_Tha_Jun_2014_2,model="Ball&Berry",GPP="GPP",
                         robust.nls=FALSE,Gs=Gs_PM,g0=0.01,nmin=40,fitg0=FALSE)

## same for the Leuning model, but this time estimate both g1 and g0 (but fix D0)
mod_Leu <- stomatal.slope(DE_Tha_Jun_2014_2,model="Leuning",GPP="GPP",Gs=Gs_PM,
                          robust.nls=FALSE,nmin=40,fitg0=FALSE,D0=1.5,fitD0=FALSE)




