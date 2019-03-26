library(bigleaf)


### Name: stomatal.sensitivity
### Title: Stomatal Sensitivity to VPD
### Aliases: stomatal.sensitivity

### ** Examples

## calculate Ga, Gs, and the stomatal sensitivity to VPD for the site FR-Pue in
## May 2012. Data are filtered for daytime, sufficiently high ustar, etc.
FR_Pue_May_2012_2 <- filter.data(FR_Pue_May_2012,quality.control=TRUE,
                                 vars.qc=c("Tair","precip","H","LE"),
                                 filter.growseas=FALSE,filter.precip=TRUE,
                                 filter.vars=c("Tair","PPFD","ustar","VPD"),
                                 filter.vals.min=c(5,200,0.2,0.3),
                                 filter.vals.max=c(NA,NA,NA,NA),
                                 NA.as.invalid=TRUE,quality.ext="_qc",
                                 good.quality=c(0,1),missing.qc.as.bad=TRUE,
                                 precip="precip",tprecip=0.1,precip.hours=24,
                                 records.per.hour=2)
Ga <- aerodynamic.conductance(FR_Pue_May_2012_2)
Gs <- surface.conductance(FR_Pue_May_2012_2,Ga=Ga[,"Ga_h"])
stomatal.sensitivity(FR_Pue_May_2012_2,Gs=Gs[,"Gs_mol"],VPD="VPD")




