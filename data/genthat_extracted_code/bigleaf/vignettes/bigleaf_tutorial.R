## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse=TRUE,comment="#>")

## ---- eval=FALSE---------------------------------------------------------
#  install.packages("bigleaf")

## ---- eval=FALSE---------------------------------------------------------
#  library(devtools)
#  install_bitbucket("juergenknauer/bigleaf")

## ------------------------------------------------------------------------
library(bigleaf)

## ------------------------------------------------------------------------
head(DE_Tha_Jun_2014)
tha <- DE_Tha_Jun_2014

## ------------------------------------------------------------------------
LAI <- 7.6   # leaf area index
zh  <- 26.5  # average vegetation height (m)
zr  <- 42    # sensor height (m)
Dl  <- 0.01  # leaf characteristic dimension (m)

## ---- eval=FALSE---------------------------------------------------------
#  potential.ET(tha,Tair="Tair",pressure="pressure",Rn="Rn",VPD="VPD",approach="Priestley-Taylor")
#  potential.ET(tha)
#  potential.ET(tha,Tair=tha$Tair)
#  potential.ET(tha,Tair=25)
#  potential.ET(Tair=25,pressure=100,Rn=200)

## ------------------------------------------------------------------------
potential.ET(Tair=25,pressure=100,Rn=200)
potential.ET(Tair=25,pressure=100,Rn=400)

## ------------------------------------------------------------------------
tha_filtered1 <- filter.data(tha,quality.control=TRUE,vars.qc=c("LE","H","NEE","Tair","VPD","wind"),
                             quality.ext="_qc",good.quality = c(0,1),missing.qc.as.bad=TRUE)

## ------------------------------------------------------------------------
tha_filtered2 <- filter.data(tha,quality.control=FALSE,filter.growseas=TRUE,
                             filter.vars=c("PPFD","ustar","LE","VPD"),
                             filter.vals.min=c(200,0.2,0,0.01), filter.vals.max=c(NA,NA,NA,NA),
                             NA.as.invalid = TRUE,
                             # arguments for growing season filter:
                             GPP="GPP",doy="doy",year="year",tGPP=0.4,ws=15,min.int=5) 

## ------------------------------------------------------------------------
tha_filtered3 <- filter.data(tha,quality.control=FALSE,filter.growseas=FALSE,
                             filter.precip=TRUE,precip="precip",tprecip=0.02,
                             records.per.hour=2,precip.hours=24)

## ------------------------------------------------------------------------
tha_filtered <- filter.data(tha,quality.control=TRUE,filter.growseas=TRUE,
                            filter.precip=TRUE, filter.vars=c("PPFD","ustar","LE","VPD"),
                            filter.vals.min=c(200,0.2,0,0.01),filter.vals.max=c(NA,NA,NA,NA),
                            NA.as.invalid = TRUE,vars.qc=c("GPP","LE","H","NEE","Tair","VPD","wind"),
                            quality.ext="_qc",good.quality = c(0,1),missing.qc.as.bad=TRUE,
                            GPP="GPP",doy="doy",year="year",tGPP=0.4,ws=15,min.int=5,
                            precip="precip",tprecip=0.02,records.per.hour=2,precip.hours=24)

## ------------------------------------------------------------------------
summary(aerodynamic.conductance(tha_filtered))

## ------------------------------------------------------------------------
Ga_Su <- aerodynamic.conductance(tha_filtered,Rb_model="Su_2001",LAI=LAI,zh=zh,d=0.7*zh,
                                 zr=zr,Dl=Dl)
summary(Ga_Su)
tha_filtered <- cbind(tha_filtered,Ga_Su)

## ------------------------------------------------------------------------
surf <- surface.conditions(tha_filtered,calc.surface.CO2=TRUE)
summary(surf)
tha_filtered <- cbind(tha_filtered,surf)

## ------------------------------------------------------------------------
par(mfrow=c(1,2),mar=c(5,4,2,0.5))
plot(tha_filtered[,"Tair"] ~ tha_filtered[,"Tsurf"],xlim=c(8,35),ylim=c(8,35),las=1,
     xlab="Tsurf (°C)",ylab="Tair (°C)",mgp=c(2.2,0.5,0),tcl=-0.2)
abline(0,1)
plot(tha_filtered[,"VPD"] ~ tha_filtered[,"VPD_surf"],xlim=c(0,4),ylim=c(0,4),las=1,
     xlab="VPD surface (kPa)",ylab="VPD air (kPa)",mgp=c(2.2,0.5,0),tcl=-0.2)
abline(0,1)

## ------------------------------------------------------------------------
summary(surface.conductance(tha_filtered))

## ------------------------------------------------------------------------
Gs <- surface.conductance(tha_filtered,G="G")
summary(Gs)
tha_filtered <- cbind(tha_filtered,Gs)

## ------------------------------------------------------------------------
## stomatal slope from the USO model (Medlyn et al. 2011)
g1_USO <- stomatal.slope(tha_filtered,model="USO",g0=0,robust.nls=TRUE)
g1_USO

## ------------------------------------------------------------------------
## stomatal slope from the USO model (Medlyn et al. 2011)
stomatal.slope(tha_filtered,Tair="Tsurf",VPD="VPD_surf",Ca="Ca_surf",model="USO",
               g0=0,robust.nls=TRUE)

## ------------------------------------------------------------------------
## Ball&Berry slope
stomatal.slope(tha_filtered,model="Ball&Berry",g0=0,robust.nls=TRUE)

## ------------------------------------------------------------------------
## Leuning slope
stomatal.slope(tha_filtered,model="Leuning",g0=0,fitD0=TRUE,robust.nls=TRUE)

## ------------------------------------------------------------------------
stomatal_index <- tha_filtered[,"GPP"] / (tha_filtered[,"Ca"] * sqrt(tha_filtered[,"VPD"]))

plot(tha_filtered[,"Gs_mol"] ~ stomatal_index,las=1,
     xlab=expression("GPP / (C"["a"]~sqrt("D"["a"])*")"),
     ylab=expression("G"["sw"]~"(mol m"^{-2}~"s"^{-1}*")"),
     tcl=0.2,mgp=c(2.2,0.5,0),xlim=c(0,0.12))

## ------------------------------------------------------------------------
wind_heights <- seq(22,60,2)
wp <- wind.profile(tha_filtered,heights=wind_heights,zh=zh,zr=zr)
wp_means <- colMeans(wp,na.rm=TRUE)
wp_sd    <- apply(wp,2,sd,na.rm=TRUE)

plot(wind_heights ~ wp_means,xlab=expression("wind speed (m s"^{-1}*")"),ylab="height (m)",
     las=1,mgp=c(2.2,0.5,0),tcl=0.2,xlim=c(0,5))
arrows(wp_means-wp_sd,wind_heights,wp_means+wp_sd,wind_heights,angle=90,
       length=0.02,code=3)
points(x=mean(tha_filtered[,"wind"],na.rm=TRUE),y=zr,col="blue",pch=16)
arrows(mean(tha_filtered[,"wind"],na.rm=TRUE)-sd(tha_filtered[,"wind"],na.rm=TRUE),
       zr,mean(tha_filtered[,"wind"],na.rm=TRUE)+sd(tha_filtered[,"wind"],na.rm=TRUE),
       zr,angle=90,length=0.02,code=3,col="blue")

## ------------------------------------------------------------------------
summary(potential.ET(tha_filtered,G="G",approach="Priestley-Taylor"))
summary(potential.ET(tha_filtered,G="G",approach="Penman-Monteith"),
        Gs_pot=quantile(tha_filtered$Gs_mol,0.95,na.rm=TRUE))

## ------------------------------------------------------------------------
energy.closure(tha)

## ------------------------------------------------------------------------
energy.closure(tha,G="G")

## ------------------------------------------------------------------------
# Saturation vapor pressure (kPa) and slope of the saturation vapor pressure curve (kPa K-1)
Esat.slope(Tair=25)

## ------------------------------------------------------------------------
# psychrometric constant (kPa K-1)
psychrometric.constant(Tair=25,pressure=100)

## ------------------------------------------------------------------------
# air density (kg m-3)
air.density(Tair=25,pressure=100)

## ------------------------------------------------------------------------
# dew point (degC)
dew.point(Tair=25,VPD=1)

## ------------------------------------------------------------------------
# wetbulb temperature (degC)
wetbulb.temp(Tair=25,pressure=100,VPD=1)

## ------------------------------------------------------------------------
# estimate atmospheric pressure from elevation (hypsometric equation)
pressure.from.elevation(elev=500,Tair=25)

## ------------------------------------------------------------------------
# VPD to vapor pressure (e, kPa)
VPD.to.e(VPD=2,Tair=25)

## ------------------------------------------------------------------------
# vapor pressure to specific humidity (kg kg-1)
e.to.q(e=1,pressure=100)

## ------------------------------------------------------------------------
# relative humidity to VPD (kPa)
rH.to.VPD(rH=0.6,Tair=25)

## ------------------------------------------------------------------------
# conductance from ms-1 to mol m-2 s-1
ms.to.mol(G_ms=0.01,Tair=25,pressure=100)

## ------------------------------------------------------------------------
# umol CO2 m-2 s-1 to g C m-2 d-1
umolCO2.to.gC(CO2_flux=20)

## ------------------------------------------------------------------------
## instead of 
PET <- potential.ET(Tair=25,pressure=100,Rn=200)
## one can use
invisible(capture.output(PET <- potential.ET(Tair=25,pressure=100,Rn=200)))

## ------------------------------------------------------------------------
summary(aerodynamic.conductance(tha_filtered,wind_profile=TRUE,zr=zr,d=0.7*zh,z0m=2.65)[,"Ga_h"])
summary(aerodynamic.conductance(tha_filtered,wind_profile=TRUE,zr=zr,d=0.7*zh,z0m=2.65,
                                constants=bigleaf.constants(k=0.4))[,"Ga_h"])

## ------------------------------------------------------------------------
summary(Gb.Thom(tha_filtered$ustar))
summary(Gb.Thom(tha_filtered$ustar,Sc=0.99,Sc_name="CH4"))

## ------------------------------------------------------------------------
G1.bootstrap <- function(dat,LoopNum,SampSizeRel){
  # dat         = input data.frame
  # LoopNum     = number of iterations
  # SampSizeRel = fraction of data sampled for each iteration
  dfout=data.frame(matrix(NA,nrow = LoopNum,ncol = 0)) #Define output dataframe
  dat$RunNum=1:nrow(dat)
  SampSize=round(length(dat$RunNum)*SampSizeRel) #calculate number of data used for resampling

  for (m in 1:LoopNum){
    # sample data:
    SampIDX=sample(x = dat$RunNum,size = SampSize,replace = T) 
    # run the function on the sample data:
    dfout$G1[m]=summary(stomatal.slope(data = dat[SampIDX,],
                                       Tair = dat$Tair[SampIDX],
                                       Gs=dat$Gs_mol[SampIDX],
                                       pressure = dat$pressure[SampIDX],
                                       GPP = dat$GPP[SampIDX],
                                       VPD = dat$VPD[SampIDX],
                                       Ca = dat$Ca[SampIDX],
                       model="USO",g0=0,robust.nls=T))$coef[1,1] 
  }

  return(dfout) # return output dataframe
}

## ---- results="hide"-----------------------------------------------------
# 300 times resampling; each time 75 % of the data: 
tha_G1BT <- G1.bootstrap(dat = tha_filtered,LoopNum = 300,SampSizeRel = 0.75) 
# estimate using all data:
g1_mean <- summary(g1_USO)$coef[1,1]
g1_se   <- summary(g1_USO)$coef[1,2]

par(mar=c(2,6,1,1))
boxplot(tha_G1BT,ylab=expression(italic("g")["1,USO"]~"(kPa"^{0.5}*")"),las=1,mgp=c(2,0.5,0))
points(g1_mean,col="blue",pch=16,cex=1.5)
arrows(1,g1_mean - g1_se,1,g1_mean + g1_se,angle=90,length=0.2,code=3,col="blue",lwd=2)

## ------------------------------------------------------------------------
n_pert <- 200
z0m1   <- 2.65
Dl1    <- 0.01
LAI1   <- 7.6
z0m_sample <- pmax(rnorm(n=n_pert,mean=z0m1,sd=0.25*z0m1),0)
Dl_sample  <- pmax(rnorm(n=n_pert,mean=Dl1,sd=0.25*Dl1),0)
LAI_sample <- rnorm(n=n_pert,mean=LAI1,sd=0.5)

## ------------------------------------------------------------------------
unc_all <- mapply(aerodynamic.conductance,Dl=Dl_sample,z0m=z0m_sample,LAI=LAI_sample,
                        MoreArgs=list(data=tha_filtered,zr=42,zh=26.5,d=0.7*26.5,
                                      N=2,stab_correction=T,
                                      stab_formulation="Dyer_1970",
                                      Rb_model="Su_2001")
                  )

# select "Ga_h" output variable and convert to matrix
unc_Ga_h <- matrix(unlist(unc_all["Ga_h",]),ncol=n_pert,byrow=FALSE) 

# calculate 2.5th, 50th, and 97.5th quantile of the n_pert calculations for every timestep
Ga_low  <- apply(unc_Ga_h,1,quantile,0.025,na.rm=T)
Ga_mean <- apply(unc_Ga_h,1,quantile,0.5,na.rm=T)
Ga_high <- apply(unc_Ga_h,1,quantile,0.975,na.rm=T)
Ga <- cbind(Ga_low,Ga_mean,Ga_high)
summary(Ga)


# calculate the Gs for the three Ga estimates
Gs_low  <- surface.conductance(tha_filtered,Ga=Ga[,"Ga_low"],G="G")[,"Gs_mol"]
Gs_mean <- surface.conductance(tha_filtered,Ga=Ga[,"Ga_mean"],G="G")[,"Gs_mol"]
Gs_high <- surface.conductance(tha_filtered,Ga=Ga[,"Ga_high"],G="G")[,"Gs_mol"]
Gs <- cbind(Gs_low,Gs_mean,Gs_high)
summary(Gs)

## ------------------------------------------------------------------------
par(mfrow=c(1,2))
ind <- c(1:48) # first day
plot(Ga_mean[ind],type="l",lwd=2,xlab="timestep",ylab=expression("G"["ah"]~"(m s"^{-1}*")"),
     las=1,mgp=c(2.2,0.5,0),tcl=-0.2,ylim=c(0.045,0.14))

ok <- which(!is.na(Ga_mean[ind]))
polygon(c(ok,rev(ok)),c(Ga_high[ind][ok],rev(Ga_low[ind][ok])),
        col="grey70",border=NA)
points(Ga_mean[ind],type="l",lwd=2)


plot(Gs_mean[ind],type="l",lwd=2,xlab="timestep",tcl=-0.2,
     ylab=expression("G"["sw"]~"(mol m"^{-2}~"s"^{-1}*")"),las=1,mgp=c(2.2,0.5,0))

ok <- which(!is.na(Gs_mean[ind]))
polygon(c(ok,rev(ok)),c(Gs_high[ind][ok],rev(Gs_low[ind][ok])),
        col="grey70",border=NA)
points(Gs_mean[ind],type="l",lwd=2)

