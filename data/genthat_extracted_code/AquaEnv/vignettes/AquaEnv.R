### R code from vignette source 'AquaEnv.rnw'

###################################################
### code chunk number 1: Preliminaries
###################################################
library("AquaEnv")
library("deSolve")
options(width=80)
Plotit <- AquaEnv:::plot.aquaenv
plot.aquaenv <- function(...) {
  if ("newdevice" %in% list(...))
    Plotit(...)
  else  
  Plotit(newdevice = FALSE, ...)  # else Sweave does not work...
}


###################################################
### code chunk number 2: AquaenvElements
###################################################
test <- aquaenv(S = 35, t = 10)
test$t


###################################################
### code chunk number 3: CallingKFuncsDirectly
###################################################
K_CO2(S = 15, t = 30)
K0_CO2(S = 15, t = 30)
Ksp_calcite(S = 15, t = 30, p = 100)


###################################################
### code chunk number 4: Avector
###################################################
K_CO2(S = 10:15, t = 30)


###################################################
### code chunk number 5: MinimalAquaenv
###################################################
ae <- aquaenv(S = 30, t = 15)
ae$K_CO2


###################################################
### code chunk number 6: AquaenvWithDepth
###################################################
ae <- aquaenv(S = 30, t = 15, p = 10)
names(ae)
ae$Ksp_calcite


###################################################
### code chunk number 7: AquaenvPressures
###################################################
ae <- aquaenv(S = 30, t = 15, p = 10)
ae[c("p", "P")]
ae <- aquaenv(S = 30, t = 15, P = 10)
unlist(ae[c("p", "P")])
ae <- aquaenv(S = 30, t = 15, P = 10, Pa = 0.5)
unlist(ae[c("p", "P")])
ae <- aquaenv(S = 30, t = 15, d = 100)
unlist(ae[c("p", "P")])
ae <- aquaenv(S = 30, t = 15, d = 100, lat = 51)
unlist(ae[c("p", "P")])


###################################################
### code chunk number 8: SkeletonAquaenv
###################################################
ae <- aquaenv(S = 30, t = 15, p = 10, skeleton = TRUE)
names(ae)


###################################################
### code chunk number 9: CompleteAquaenvSystem
###################################################
S      <- 30
t      <- 15
p      <- 10
SumCO2 <- 0.0020
pH     <- 8
TA     <- 0.002142233
fCO2   <- 0.0005272996
CO2    <- 2.031241e-05

ae <- aquaenv(S, t, p, SumCO2 = SumCO2, pH = pH)
ae$TA

ae <- aquaenv(S, t, p, SumCO2 = SumCO2, TA = TA)
ae$pH

ae <- aquaenv(S, t, p, SumCO2 = SumCO2, CO2 = CO2)
ae$pH

names(ae)


###################################################
### code chunk number 10: SpeciationSkeletonAquaenv
###################################################
ae <- aquaenv(S, t, p, SumCO2 = SumCO2, pH = pH, speciation = FALSE)
names(ae)

ae <- aquaenv(S, t, p, SumCO2 = SumCO2, pH = pH, speciation = FALSE, 
              skeleton = TRUE)
names(ae)


###################################################
### code chunk number 11: DSAAquaenv
###################################################
ae <- aquaenv(S, t, p, SumCO2 = SumCO2, fCO2 = fCO2, dsa = TRUE)
ae$dTAdH
ae$revelle


###################################################
### code chunk number 12: ErrorMessagesAquaenv
###################################################
ae <- aquaenv(S, t, p, SumCO2 = SumCO2, CO2 = CO2, fCO2 = fCO2)
ae <- aquaenv(S, t, p, SumCO2 = SumCO2, pH = pH, TA = TA)
ae <- aquaenv(S, t, p, SumCO2 = SumCO2, pH = pH, CO2 = CO2)
ae <- aquaenv(S, t, p, SumCO2 = SumCO2, pH = pH, fCO2 = fCO2)
ae <- aquaenv(S, t, p, SumCO2 = SumCO2, TA = TA, CO2 = CO2)
ae <- aquaenv(S, t, p, SumCO2 = SumCO2, TA = TA, fCO2 = fCO2)


###################################################
### code chunk number 13: SumCO2Calculating
###################################################
fCO2   <- 0.0006943363
CO2    <- 2.674693e-05
pH     <- 7.884892
TA     <- 0.0021

S <- 30
t <- 15
p <- 10

ae <- aquaenv(S, t, p, SumCO2 = NULL, pH = pH, CO2 = CO2)
ae$SumCO2

ae <- aquaenv(S, t, p, SumCO2 = NULL, pH = pH, fCO2 = fCO2)
ae$SumCO2

ae <- aquaenv(S, t, p, SumCO2 = NULL, pH = pH, TA = TA)
ae$SumCO2

ae <- aquaenv(S, t, p, SumCO2 = NULL, TA = TA, CO2 = CO2)
ae$SumCO2

ae <- aquaenv(S, t, p, SumCO2 = NULL, TA = TA, fCO2 = fCO2)
ae$SumCO2


###################################################
### code chunk number 14: CloningAquaenv
###################################################
S      <- 30
t      <- 15
SumCO2 <- 0.0020
TA     <- 0.00214

ae <- aquaenv(S, t, SumCO2 = SumCO2, TA = TA)
ae$pH

ae1 <- aquaenv(ae = ae)      # this is the same
ae1$pH

ae2 <- aquaenv(ae = ae, pH = 9)
c(ae$TA, ae2$TA)

ae3 <- aquaenv(ae = ae, TA = 0.002)
c(ae$pH, ae3$pH)

K_CO2 <- 1e-6
ae4 <- aquaenv(ae = ae, k_co2 = 1e-6)
c(ae$TA, ae4$TA)


###################################################
### code chunk number 15: PreparingInput
###################################################
S <- 10
t <- 15

pH_NBS      <- 8.142777
SumCO2molar <- 0.002016803

(pH_free     <- convert(pH_NBS,      "pHscale", "nbs2free",    S = S, t = t))
(SumCO2molin <- convert(SumCO2molar, "conc",    "molar2molin", S = S, t = t))

ae <- aquaenv(S, t, SumCO2 = SumCO2molin, pH = pH_free)
ae$pH
ae$SumCO2


###################################################
### code chunk number 16: InputVectors
###################################################
SumCO2 <- 0.0020
pH     <- 8
S      <- 30
t      <- 1:5
p      <- 10

ae <- aquaenv(S, t, p, SumCO2 = SumCO2, pH = pH)
rbind(t = ae$t, TA = ae$TA)


###################################################
### code chunk number 17: Selectplot
###################################################
plot(ae, xval = t, xlab = "t/(deg C)", 
  what = c("pH", "CO2", "HCO3", "CO3"), 
  mfrow = c(1, 4))


###################################################
### code chunk number 18: MoreInputVectors1 (eval = FALSE)
###################################################
## ae <- aquaenv(S=20:24, t=15, p=10, SumCO2 = SumCO2, pH = pH, dsa = TRUE)
## rbind(ae$S, ae$TA)


###################################################
### code chunk number 19: MoreInputVectors6
###################################################
ae <- aquaenv(20, 10, SumCO2=seq(0.001, 0.002, 0.00025), TA = 0.002)
rbind(ae$SumCO2, ae$pH, ae$HCO3)


###################################################
### code chunk number 20: SumCO2CalcInputVecs1
###################################################
ae <- aquaenv(S = 30, t = 11:15, SumCO2 = NULL, pH = pH, CO2 = CO2, 
              dsa = TRUE)
ae$SumCO2


###################################################
### code chunk number 21: Dataframe
###################################################
ae <- aquaenv(S = 30, t = 11:15, SumCO2 = NULL, pH = 8, CO2 = 2e-5)
aedataframe <- as.data.frame(ae)
dim(aedataframe)
aedataframe[, 1:3]
aetest      <- aquaenv(ae = aedataframe, from.data.frame = TRUE)


###################################################
### code chunk number 22: Elementconversion
###################################################
ae <- aquaenv(S = 30, t = 10)
ae$SumBOH3
ae <- convert(ae, "mol/kg-soln", "umol/kg-H2O", 1e6/ae$molal2molin, "unit")
ae$SumBOH3


###################################################
### code chunk number 23: DSAQuantities1
###################################################
ae <- aquaenv(S = 30, t = 15, d = 10, SumCO2 = 0.002, pH = 8, dsa = TRUE)


###################################################
### code chunk number 24: DSAQuantities2
###################################################
ae$dTAdH
ae$dTAdSumCO2


###################################################
### code chunk number 25: DSAQuantities3
###################################################
ae$dTAdKdKdS
ae$dTAdKdKdSumH2SO4


###################################################
### code chunk number 26: DSAQuantities4
###################################################
ae$c1


###################################################
### code chunk number 27: BufferFactors1
###################################################
BF <- BufferFactors()
names(BF)
BF$dtotX.dpH


###################################################
### code chunk number 28: BufferFactors2
###################################################
ae <- aquaenv(S = 30, t = 15, d = 10, SumCO2 = 0.002, pH = 8.1, 
              skeleton = TRUE)
BF <- BufferFactors(ae = ae)
BF$RF


###################################################
### code chunk number 29: BufferFactors3
###################################################
ae <- aquaenv(S = 30, t = 15, d = 10, SumCO2 = 0.002, pH = 8.1, dsa = TRUE)
BF <- BufferFactors(ae = ae)
cbind(ae$dTAdH,BF$beta.H)


###################################################
### code chunk number 30: BufferFactors4
###################################################
parameters <- c(DIC = 0.002, Alk = 0.0022)
BF <- BufferFactors(parameters = parameters)
BF$RF


###################################################
### code chunk number 31: BufferFactors5
###################################################
ae <- aquaenv(S = 30, t = 15, d = 10, SumCO2 = 0.002, pH = 8.1, 
              skeleton = TRUE)
BF <- BufferFactors(ae = ae)
BF$RF

parameters <- c(Alk = 0.0022)
BF_2 <- BufferFactors(ae = ae, parameters = parameters)
BF_2$RF


###################################################
### code chunk number 32: BufferFactors6
###################################################
BF <- BufferFactors(species = c("CO2", "HCO3", "CO3", "SumNH4"))
BF$dtotX.dX


###################################################
### code chunk number 33: BufferFactors7
###################################################
ae <- aquaenv(S = 30, t = 15, d = 10, SumCO2 = 0.002, pH = 8.1, 
              skeleton = TRUE)
BF <- BufferFactors(ae = ae, species = c("SumCO2", "SumNH4"))
BF$dtotX.dX


###################################################
### code chunk number 34: BufferFactors7
###################################################
BF <- BufferFactors(k1k2 = "roy")
BF$RF

BF <- BufferFactors(k_co2 = 1e-6)
BF$RF


###################################################
### code chunk number 35: Plot1
###################################################
ae <- aquaenv(20:30, 10)
plot(ae, xval = 20:30, xlab = "S", what = c("K_CO2", "K_HCO3", "K_BOH3"), 
  size = c(10, 2), mfrow = c(1,3))


###################################################
### code chunk number 36: OrdDynModParamList (eval = FALSE)
###################################################
## parameters <- list(             
##        S          = 25        , # psu       
##        t_min      = 5         , # degrees C
##        t_max      = 25        , # degrees C
##                   
##        k          = 0.4       , # 1/d           proportionality factor for air-water exchange
##        rOx        = 0.0000003 , # mol-N/(kg*d)  maximal rate of oxic mineralisation
##        rNitri     = 0.0000002 , # mol-N/(kg*d)  maximal rate of nitrification 
##        rPP        = 0.000006  , # mol-N/(kg*d)  maximal rate of primary production
##                    
##        ksDINPP    = 0.000001  , # mol-N/kg
##        ksNH4PP    = 0.000001  , # mol-N/kg
##                    
##        D          = 0.1       , # 1/d           (dispersive) transport coefficient
##                    
##        O2_io      = 0.000296  , # mol/kg-soln 
##        NO3_io     = 0.000035  , # mol/kg-soln 
##        SumNH4_io  = 0.000008  , # mol/kg-soln 
##        SumCO2_io  = 0.002320  , # mol/kg-soln 
##        TA_io      = 0.002435  , # mol/kg-soln 
##                    
##        C_Nratio   = 8         , # mol C/mol N   C:N ratio of organic matter
##                    
##        a           = 30       , # time at which PP begins     
##        b           = 50       , # time at which PP stops again
##                    
##        modeltime   = 100        # duration of the model
##                    )


###################################################
### code chunk number 37: OrdDynModFunction (eval = FALSE)
###################################################
## 
## temperature <- with (parameters, 
##     approxfun(x = 0:101,
##                y = c(seq(t_min, t_max, (t_max-t_min)/50), 
##                      seq(t_max, t_min, -(t_max-t_min)/50))) 
##       )
## 
## boxmodel <- function(time, state, parameters) {
##   with (
##         as.list(c(state, parameters)),     {
##           t       <- temperature(time)          
##           ae      <- aquaenv(S = S, t = t, SumCO2 = SumCO2, 
##                              SumNH4 = SumNH4, TA = TA)
##                                     
##           ECO2    <- k * (ae$CO2_sat - ae$CO2)            
##           EO2     <- k * (ae$O2_sat  - O2)             
##          
##           # dilution
##           TO2     <- D*(O2_io     - O2)
##           TNO3    <- D*(NO3_io    - NO3)
##           TSumNH4 <- D*(SumNH4_io - SumNH4)
##           TTA     <- D*(TA_io     - TA)
##           TSumCO2 <- D*(SumCO2_io - SumCO2)
##           
##           RNit      <- rNitri * SumNH4/(SumNH4+1e-8)
## 
##           ROx       <- rOx 
##           ROxCarbon <- ROx * C_Nratio
## 
##           pNH4PP <- 0
##           RPP <- 0
##           
##           if ((time > a) && (time < b)) {
##               RPP    <- rPP * ((SumNH4+NO3)/(ksDINPP + (SumNH4+NO3)))
##               pNH4PP <- SumNH4/(SumNH4+NO3)
##           } 
## 
##           RPPCarbon <- RPP * C_Nratio
##           
##           dO2     <- TO2     + EO2 - ROxCarbon - 2*RNit  + (2-2*pNH4PP)*RPP + RPPCarbon
##           dNO3    <- TNO3    + RNit -(1-pNH4PP)*RPP
## 
##           dSumCO2 <- TSumCO2 + ECO2 + ROxCarbon - RPPCarbon
##           dSumNH4 <- TSumNH4 + ROx  - RNit - pNH4PP*RPP
##                     
##           dTA     <- TTA     + ROx - 2*RNit -(2*pNH4PP-1)*RPP 
## 
##           ratesofchanges <- c(dO2, dNO3, dSumNH4, dSumCO2, dTA)
##           
##           return(list(ratesofchanges, ae[c("t", "NH4", "NH3", "pH")]))
##         } )
## }


###################################################
### code chunk number 38: OrdDynModSolution (eval = FALSE)
###################################################
##  initialstate <-   with (parameters,       
##      c(O2=O2_io, NO3=NO3_io, SumNH4=SumNH4_io, SumCO2=SumCO2_io, TA=TA_io))
##      
##  times        <- 1:100
##  output       <- vode(initialstate,times,boxmodel,parameters, hmax = 1)        


###################################################
### code chunk number 39: OrdDynModePlotting (eval = FALSE)
###################################################
## plot(output) 


###################################################
### code chunk number 40: SinglePHModParams
###################################################
parameters <- list(             
     S          = 25    , # psu       
     t          = 15    , # degrees C
                   
     k          = 0.4       , # 1/d	    proportionality factor for air-water exchange
     rOx        = 0.0000003 , # mol-N/(kg*d)  maximal rate of oxic mineralisation
     rNitri     = 0.0000002 , # mol-N/(kg*d)  maximal rate of nitrification 
     rPP        = 0.0000006 , # mol-N/(kg*d)  maximal rate of primary production
                   
     ksSumNH4   = 0.000001  , # mol-N/kg
                  
     D          = 0.1       , #   1/d            (dispersive) transport coefficient
                   
     SumNH4_io  = 0.000008  , # mol/kg-soln 
     SumCO2_io  = 0.002320  , # mol/kg-soln 
     TA_io      = 0.002435  , # mol/kg-soln 
                   
     C_Nratio   = 8       , # mol C/mol N     C:N ratio of organic matter
                  
     a          = 5       , # time from which PP begins     
     b          = 20       , # time where PP shuts off again
                   
     modeltime  = 30        # duration of the model
                   )


###################################################
### code chunk number 41: SinglePHModFunction
###################################################
boxmodel <- function(timestep, currentstate, parameters)
{
  with (
        as.list(c(currentstate,parameters)),
        {  
          # the "classical" implicit pH calculation method is applied in aquaenv
          ae <- aquaenv(S=S, t=t, SumCO2=sumCO2, 
            SumNH4=sumNH4, TA=alkalinity, dsa=TRUE)
                                    
          ECO2    <- k * (ae$CO2_sat - ae$CO2)            
        
          RNit      <- rNitri 
          ROx       <- rOx 
        
          if ((timestep > a) && (timestep < b))
              RPP <- rPP * (sumNH4/(ksSumNH4 + sumNH4))
          else
              RPP <- 0
           
          dsumCO2 <- ECO2 + C_Nratio*ROx - C_Nratio*RPP
          dsumNH4 <- ROx  - RNit - RPP
          dalkalinity <- ROx - 2*RNit - RPP
          
          # The DSA pH
          dH    <- (dalkalinity - (dsumCO2*ae$dTAdSumCO2 + dsumNH4*ae$dTAdSumNH4))/ae$dTAdH
          DSApH <- -log10(H)

          # The DSA pH using pH dependent fractional stoichiometry (= using partitioning coefficients)
          rhoHECO2 <- ae$c2 + 2*ae$c3
          rhoHRNit <- 1 + ae$n1
          rhoHROx  <- C_Nratio * (ae$c2 + 2*ae$c3) - ae$n1
          rhoHRPP  <- -(C_Nratio * (ae$c2 + 2*ae$c3)) + ae$n1
          
          dH_ECO2  <- rhoHECO2*ECO2/(-ae$dTAdH)
          dH_RNit  <- rhoHRNit*RNit/(-ae$dTAdH)
          dH_ROx   <- rhoHROx*ROx  /(-ae$dTAdH)
          dH_RPP   <- rhoHRPP*RPP  /(-ae$dTAdH)

          dH_stoich   <- dH_ECO2 + dH_RNit + dH_ROx + dH_RPP
          DSAstoichpH <- -log10(H_stoich)       

          ratesofchanges <- c(dsumNH4, dsumCO2, dalkalinity, dH, dH_stoich)
          processrates   <- c(ECO2=ECO2, RNit=RNit, ROx=ROx, RPP=RPP)
          DSA            <- c(DSApH=DSApH, rhoHECO2=rhoHECO2, rhoHRNit=rhoHRNit, rhoHROx=rhoHROx,
                              rhoHRPP=rhoHRPP, dH_ECO2=dH_ECO2, dH_RNit=dH_RNit, dH_ROx=dH_ROx, 
                              dH_RPP=dH_RPP, DSAstoichpH=DSAstoichpH)
          
          return(list(ratesofchanges, processrates, DSA, ae))
        }
        )
}


###################################################
### code chunk number 42: SinglPHModSolution
###################################################
with (as.list(parameters),
      {
        H_init       <<- 10^(-(aquaenv(S=S, t=t, SumCO2=SumCO2_io, SumNH4=SumNH4_io, TA=TA_io, 
                                       speciation=FALSE)$pH))
        initialstate <<- c(sumNH4=SumNH4_io, sumCO2=SumCO2_io, alkalinity =TA_io, H=H_init, 
                           H_stoich=H_init)
        times        <<- c(0:modeltime)
      })
output       <- vode(initialstate, times, boxmodel, parameters, hmax=1)        


###################################################
### code chunk number 43: SinglePHModePlotting1
###################################################
select <- c("sumCO2", "alkalinity", "sumNH4", "RPP", "dTAdH", "dTAdSumCO2", 
          "dTAdSumNH4","rhoHECO2", "rhoHRNit", "rhoHROx","dH_ECO2","dH_RNit", 
          "dH_RPP","pH", "DSApH", "DSAstoichpH")
plot(output, which = select, xlab="time/d", mfrow=c(4,4)) 


###################################################
### code chunk number 44: SinglepHModPlotting2
###################################################
what <- c("dH_ECO2", "dH_RNit", "dH_ROx", "dH_RPP")
plot(aquaenv(ae=as.data.frame(output), from.data.frame=TRUE), 
  xval = times, what = what, xlab = "time/d", size = c(7,5), 
  ylab = "mol-H/(kg-soln*d)", legendposition = "bottomright", cumulative = TRUE) 


###################################################
### code chunk number 45: SinplePHModConsistencyCheck
###################################################
matplot(output[, "time"], 
  output[, c("pH", "DSApH", "DSAstoichpH")], type = "l", lty = 1, lwd = 2)


###################################################
### code chunk number 46: ImplicitPHModParams (eval = FALSE)
###################################################
## parameters <- list(             
##     t           = 15        , # degrees C
##     S           = 35        , # psu       
## 
##     SumCO2_t0   = 0.002     , # mol/kg-soln  (comparable to Wang2005)
##     TA_t0       = 0.0022    , # mol/kg-soln  (comparable to Millero1998)
## 
##     kc          = 0.5       , # 1/d	         proportionality factor for air-water exchange
##     kp          = 0.000001  , # mol/(kg-soln*d)	 max rate of calcium carbonate precipitation
##     n           = 2.0       , # -                 exponent for kinetic rate law of precipitation
##                                       
##     modeltime   = 20        , # d              duration of the model
##     outputsteps = 100         #                number of outputsteps
##                    )


###################################################
### code chunk number 47: ImplicitPHModFunction (eval = FALSE)
###################################################
## boxmodel <- function(timestep, currentstate, parameters)
## {
##   with (
##         as.list(c(currentstate,parameters)),
##         {        
##           ae    <- aquaenv(S=S, t=t, SumCO2=SumCO2, TA=TA, SumSiOH4=0, 
##                            SumBOH3=0, SumH2SO4=0, SumHF=0)      
##           
##           Rc    <- kc * ((ae$CO2_sat) - (ae$CO2)) 
##           Rp    <- kp * (1-ae$omega_calcite)^n               
## 
##           dSumCO2 <- Rc - Rp
##           dTA     <- -2*Rp
##           
##           ratesofchanges <- c(dSumCO2, dTA)
##           
##           processrates   <- c(Rc=Rc, Rp=Rp)
##           
##           return(list(ratesofchanges, list(processrates, ae)))
##         }
##         )
## }


###################################################
### code chunk number 48: ImplicitPHModSolution (eval = FALSE)
###################################################
## with (as.list(parameters),
##       {
##         initialstate <<- c(SumCO2=SumCO2_t0, TA=TA_t0)
##         times        <<- seq(0,modeltime,(modeltime/outputsteps))       
##       })
## output       <<- vode(initialstate,times,boxmodel,parameters, hmax=1)


###################################################
### code chunk number 49: ExplicitPHModParams (eval = FALSE)
###################################################
## parameters <- list(             
##     S           = 35        , # psu       
##     t           = 15        , # degrees C
## 
##     SumCO2_t0   = 0.002     , # mol/kg-soln  (comparable to Wang2005)
##     TA_t0       = 0.0022    , # mol/kg-soln  (comparable to Millero1998)
## 
##     kc          = 0.5       , # 1/d	         proportionality factor for air-water exchange
##     kp          = 0.000001  , # mol/(kg-soln*d)	 max rate of calcium carbonate precipitation
##     n           = 2.0       , # -                 exponent for kinetic rate law of precipitation
##                                       
##     modeltime   = 20        , # d              duration of the model
##     outputsteps = 100         #                number of outputsteps
##                    )


###################################################
### code chunk number 50: ExplicitPHModFunction (eval = FALSE)
###################################################
## boxmodel <- function(timestep, currentstate, parameters)
## {
##   with (
##         as.list(c(currentstate,parameters)),
##         {        
##           ae    <- aquaenv(S=S, t=t, SumCO2=SumCO2, pH=-log10(H), SumSiOH4=0, 
##                            SumBOH3=0, SumH2SO4=0, SumHF=0, dsa=TRUE)
##                    
##           Rc    <- kc * ((ae$CO2_sat) - (ae$CO2)) 
##           Rp    <- kp * (1-ae$omega_calcite)^n               
## 
##           dSumCO2 <- Rc - Rp
## 
##           dHRc    <- (      -(ae$dTAdSumCO2*Rc   ))/ae$dTAdH
##           dHRp    <- (-2*Rp -(ae$dTAdSumCO2*(-Rp)))/ae$dTAdH
##           dH      <- dHRc + dHRp
##           
##           ratesofchanges <- c(dSumCO2, dH)
##           
##           processrates   <- c(Rc=Rc, Rp=Rp)
##           outputvars     <- c(dHRc=dHRc, dHRp=dHRp)
##           
##           return(list(ratesofchanges, list(processrates, outputvars, ae)))
##         }
##         )
## }


###################################################
### code chunk number 51: ExplicitPHModSolution (eval = FALSE)
###################################################
## with (as.list(parameters),
##       {
##         aetmp <- aquaenv(S=S, t=t, SumCO2=SumCO2_t0, TA=TA_t0, SumSiOH4=0, SumBOH3=0, SumH2SO4=0, SumHF=0)
##         H_t0  <- 10^(-aetmp$pH)
##         
##         initialstate <<- c(SumCO2=SumCO2_t0, H=H_t0)
##         times        <<- seq(0,modeltime,(modeltime/outputsteps))       
##       })
## output       <- vode(initialstate,times,boxmodel,parameters, hmax=1)


###################################################
### code chunk number 52: FracStoichModParams (eval = FALSE)
###################################################
## parameters <- list(             
##      S           = 35        , # psu       
##      t           = 15        , # degrees C
## 
##      SumCO2_t0   = 0.002     , # mol/kg-soln  (comparable to Wang2005)
##      TA_t0       = 0.0022    , # mol/kg-soln  (comparable to Millero1998)
## 
##      kc          = 0.5       , # 1/d	         proportionality factor for air-water exchange
##      kp          = 0.000001  , # mol/(kg-soln*d)	 max rate of calcium carbonate precipitation
##      n           = 2.0       , # -                 exponent for kinetic rate law of precipitation
##                                       
##      modeltime   = 20        , # d              duration of the model
##      outputsteps = 100         #                number of outputsteps
##                    )


###################################################
### code chunk number 53: FracStoichModFunction (eval = FALSE)
###################################################
## boxmodel <- function(timestep, currentstate, parameters)
## {
##   with (
##         as.list(c(currentstate,parameters)),
##         {        
##           ae    <- aquaenv(S=S, t=t, SumCO2=SumCO2, pH=-log10(H), SumSiOH4=0, 
##                            SumBOH3=0, SumH2SO4=0, SumHF=0, dsa=TRUE)        
##          
##           Rc    <- kc * ((ae$CO2_sat) - (ae$CO2)) 
##           Rp    <- kp * (1-ae$omega_calcite)^n               
## 
##           dSumCO2 <- Rc - Rp
## 
##           rhoc    <- ae$c2 + 2*ae$c3
##           rhop    <- 2*ae$c1 + ae$c2
##           
##           dHRc    <- rhoc*Rc/(-ae$dTAdH)
##           dHRp    <- rhop*Rp/(-ae$dTAdH)
##           dH      <- dHRc + dHRp
##           
##           ratesofchanges <- c(dSumCO2, dH)
##           
##           processrates   <- c(Rc=Rc, Rp=Rp)
##           outputvars     <- c(dHRc=dHRc, dHRp=dHRp, rhoc=rhoc, rhop=rhop)
##           
##           return(list(ratesofchanges, list(processrates, outputvars, ae)))
##         }
##         )
## }


###################################################
### code chunk number 54: FracStoichModSolution (eval = FALSE)
###################################################
## with (as.list(parameters),
##       {
##         aetmp <- aquaenv(S=S, t=t, SumCO2=SumCO2_t0, TA=TA_t0, SumSiOH4=0, 
##                          SumBOH3=0, SumH2SO4=0, SumHF=0)
##         H_t0  <- 10^(-aetmp$pH)
##         
##         initialstate <<- c(SumCO2=SumCO2_t0, H=H_t0)
##         times        <<- seq(0,modeltime,(modeltime/outputsteps))       
##         output       <<- as.data.frame(vode(initialstate,times,boxmodel,parameters, hmax=1))
##       })


###################################################
### code chunk number 55: HClTit1
###################################################
ae_init <- aquaenv(S = 35, t = 15, SumCO2 = 0.0035, SumNH4 = 0.00002, pH = 11.3)


###################################################
### code chunk number 56: HClTit2
###################################################
ae <- titration(ae_init, mass_sample = 0.01, mass_titrant = 0.02, 
   conc_titrant = 0.01, S_titrant = 0.5, steps = 100)


###################################################
### code chunk number 57: HClTit3
###################################################
what  <- c("TA", "pH", "CO2", "HCO3", "CO3", "BOH3", "BOH4", "OH", 
           "NH4", "NH3", "H2SO4", "HSO4", "SO4", "HF", "F", "fCO2")
plot(ae, xval = ae$delta_mass_titrant, xlab = "HCl solution added [kg]", 
     what = what, size = c(12,8), mfrow = c(4,4))


###################################################
### code chunk number 58: HClTit4 (eval = FALSE)
###################################################
## plot(ae, xval = ae$delta_conc_titrant, what = what, 
##      xlab = "[HCl] offset added [mol/kg-soln]", 
##      size = c(14,10), mfrow = c(4,4))
## plot(ae, xval=ae$delta_moles_titrant, xlab = "HCl added [mol]", 
##      what = what, size = c(14,10), mfrow = c(4,4))


###################################################
### code chunk number 59: HClTit5
###################################################
plot(ae, xval = ae$pH, xlab = "free scale pH", what = what, 
     size = c(12,8), mfrow = c(4,4))


###################################################
### code chunk number 60: HClTit6
###################################################
plot(ae, bjerrum = TRUE)


###################################################
### code chunk number 61: HClTit7
###################################################
what  <- c("CO2", "HCO3", "CO3")
plot(ae, what = what, bjerrum = TRUE, lwd = 4, 
  palette = c("cyan", "magenta", "yellow"), 
  bg = "gray", legendinset = 0.1, legendposition = "topleft")


###################################################
### code chunk number 62: HClTit9
###################################################
what  <- c("CO2", "HCO3", "CO3", "BOH3", "BOH4", "OH", 
           "NH4", "NH3", "H2SO4", "HSO4", "SO4", "HF", "F")
plot(ae, what = what, bjerrum = TRUE, log = TRUE)


###################################################
### code chunk number 63: HClTit10
###################################################
plot(ae, what = what, bjerrum = TRUE, log = TRUE, ylim = c(-6,-1), 
     legendinset = 0, lwd = 3, 
     palette = c(1, 3, 4, 5, 6, colors()[seq(100,250,6)]))


###################################################
### code chunk number 64: NaOHTit1 (eval = FALSE)
###################################################
## ae <- titration(aquaenv(S = 35, t = 15, SumCO2 = 0.0035, SumNH4 = 0.00002, pH = 2), 
##        mass_sample = 0.01, mass_titrant = 0.02, conc_titrant = 0.01, 
##        S_titrant = 0.5, steps = 50, type = "NaOH")


###################################################
### code chunk number 65: NaOHTit2 (eval = FALSE)
###################################################
## plot(ae, xval = ae$delta_mass_titrant, xlab = "NaOH solution added [kg]", 
##      mfrow = c(10,10))


###################################################
### code chunk number 66: NaOHTit3 (eval = FALSE)
###################################################
## what  <- c("TA", "pH", "CO2", "HCO3", "CO3", "BOH3", "BOH4", "OH", 
##            "NH4", "NH3", "H2SO4", "HSO4", "SO4", "HF", "F", "fCO2")
## plot(ae, xval = ae$delta_mass_titrant, xlab = "NaOH solution added [kg]", 
##      what = what, size = c(12,8), mfrow = c(4,4))
## plot(ae, xval = ae$pH, xlab = "free scale pH", what = what, 
##      size = c(12,8), mfrow = c(4,4))


###################################################
### code chunk number 67: NaOHTit4 (eval = FALSE)
###################################################
## what  <- c("CO2", "HCO3", "CO3")
## plot(ae, what=what, bjerrum=TRUE)


###################################################
### code chunk number 68: NaOHTit5 (eval = FALSE)
###################################################
## what  <- c("CO2", "HCO3", "CO3", "BOH3", "BOH4", "OH", 
##            "NH4", "NH3", "H2SO4", "HSO4", "SO4", "HF", "F")
## plot(ae, what = what, bjerrum = TRUE, log = TRUE, ylim = c(-6,-1), 
##      legendinset = 0, lwd = 3, palette = c(1,3,4,5,6,colors()[seq(100,250,6)]))


###################################################
### code chunk number 69: TextbookTit1
###################################################
ae <- titration(aquaenv(S = 35, t = 15, SumCO2 = 0.0035, SumNH4 = 0.00002, pH = 11.3), 
      mass_sample = 100, mass_titrant = 0.5, conc_titrant = 3, 
      S_titrant = 0.5, steps = 100)


###################################################
### code chunk number 70: TextbookTit2 (eval = FALSE)
###################################################
## plot(ae, xval = ae$delta_mass_titrant, 
##    xlab = "HCl solution added [kg]", mfrow = c(10, 10))


###################################################
### code chunk number 71: TextbookTit3 (eval = FALSE)
###################################################
## what  <- c("TA", "pH", "CO2", "HCO3", "CO3", "BOH3", "BOH4", "OH", 
##            "NH4", "NH3", "H2SO4", "HSO4", "SO4", "HF", "F", "fCO2")
## plot(ae, xval = ae$delta_mass_titrant, xlab = "HCl solution added [kg]", 
##      what = what, size = c(12, 8), mfrow = c(4,4))
## plot(ae, xval = ae$pH, xlab = "free scale pH", what = what, 
##      size = c(12,8), mfrow = c(4,4))
## plot(ae, xval = ae$delta_conc_titrant, xlab = "[HCl] offset added [mol/kg-soln]", 
##      what = what, size = c(12,8), mfrow = c(4,4))
## plot(ae, xval = ae$delta_moles_titrant, xlab = "HCl added [mol]", 
##      what = what, size = c(12,8), mfrow = c(4,4))


###################################################
### code chunk number 72: TextbookTit4 (eval = FALSE)
###################################################
## plot(ae, bjerrum=TRUE)
## what  <- c("CO2", "HCO3", "CO3")
## plot(ae, what = what, bjerrum = TRUE)
## plot(ae, what = what, bjerrum = TRUE, lwd = 4, 
##      palette=c("cyan", "magenta", "yellow"), bg = "gray", 
##      legendinset = 0.1, legendposition = "topleft")
## what  <- c("CO2", "HCO3", "CO3", "BOH3", "BOH4", "OH", 
##      "NH4", "NH3", "H2SO4", "HSO4", "SO4", "HF", "F")
## plot(ae, what = what, bjerrum = TRUE, log = TRUE)


###################################################
### code chunk number 73: TextbookTit5
###################################################
what  <- c("CO2", "HCO3", "CO3", "BOH3", "BOH4", "OH", 
           "NH4", "NH3", "H2SO4", "HSO4", "SO4", "HF", "F")
plot(ae, what = what, bjerrum = TRUE, log = TRUE, ylim = c(-6,-1), 
     legendinset = 0, lwd = 3, palette = c(1,3,4,5,6,colors()[seq(100,250,6)]))


###################################################
### code chunk number 74: TAfit1
###################################################
ae_init <- aquaenv(S = 35, t = 15, SumCO2 = 0.0035, SumNH4 = 0.00002, pH = 11.3)
ae <- titration(ae_init, mass_sample = 0.01, mass_titrant = 0.02, 
      conc_titrant = 0.01, S_titrant = 0.5, steps = 100)
plot(ae, xval = ae$delta_mass_titrant, xlab = "HCl solution added [kg]", 
     what = "pH", xlim = c(0,0.015))
par(new = TRUE)
plot(ae$delta_mass_titrant[1:100], diff(ae$pH), type = "l", 
     col = "red", xlim = c(0,0.015), ylab = "", xlab = "", yaxt = "n")
par(new = TRUE)
plot(ae$delta_mass_titrant[2:100], diff(diff(ae$pH)), type = "l", 
     col = "blue", xlim = c(0,0.015), ylab = "", xlab = "", yaxt = "n")
abline(h =0, col = "blue")
abline(v = ae$TA[[1]])            
abline(v = ae$TA[[1]] - ae$SumCO2[[1]]) 


###################################################
### code chunk number 75: TAfit2
###################################################
plot(ae, xval = ae$delta_mass_titrant, xlab = "HCl solution added [kg]", 
     what = "pH", xlim = c(0,0.015))
prot1 <- c()
for (i in 1:length(ae$pH))
    prot1 <- c(prot1, (10^-(ae$pH[[i]])+ae$HSO4[[i]]+ae$HF[[i]]+
              ae$CO2[[i]]-ae$CO3[[i]]-ae$BOH4[[i]]-ae$OH[[i]]))

par(new = TRUE)
plot(ae$delta_mass_titrant, prot1, type = "l", col = "blue", xlim = c(0,0.015), 
     ylab = "", xlab = "", yaxt = "n", ylim = c(-0.015,0.015))
prot2 <- c()
for (i in 1:length(ae$pH))
    prot2 <- c(prot2, (10^-(ae$pH[[i]])+ae$HSO4[[i]]+ae$HF[[i]]-
              ae$HCO3[[i]]-2*ae$CO3[[i]]-ae$BOH4[[i]]-ae$OH[[i]]))
par(new = TRUE)
plot(ae$delta_mass_titrant, prot2, type = "l", col = "green", xlim = c(0,0.015), 
     ylab = "", xlab = "", yaxt = "n", ylim = c(-0.015,0.015))
abline(v = ae$TA[[1]])            
abline(v = ae$TA[[1]] - ae$SumCO2[[1]]) 
abline(h = 0)


###################################################
### code chunk number 76: TAfit3
###################################################
ae <- titration(aquaenv(S = 35, t = 15, SumCO2 = 0.0035, SumNH4 = 0.00002, 
                        pH = 11.3), 
                mass_sample = 100, mass_titrant = 0.5, conc_titrant = 3, 
                S_titrant = 0.5, steps = 100)
plot(ae, xval = ae$delta_mass_titrant, xlab = "HCl solution added [kg]", 
     what = "pH", xlim = c(0, 0.5))
prot1 <- c()
for (i in 1:length(ae$pH))
    prot1 <- c(prot1, (10^-(ae$pH[[i]])+ae$HSO4[[i]]+ae$HF[[i]]+
               ae$CO2[[i]]-ae$CO3[[i]]-ae$BOH4[[i]]-ae$OH[[i]]))

par(new = TRUE)
plot(ae$delta_mass_titrant, prot1, type = "l", col = "blue", 
     xlim = c(0,0.5),  ylab = "", xlab = "", yaxt = "n", 
     ylim = c(-0.015, 0.015))
prot2 <- c()
for (i in 1:length(ae$pH))
    prot2 <- c(prot2, (10^-(ae$pH[[i]])+ae$HSO4[[i]]+ae$HF[[i]]-
               ae$HCO3[[i]]-2*ae$CO3[[i]]-ae$BOH4[[i]]-ae$OH[[i]]))
par(new = TRUE)
plot(ae$delta_mass_titrant, prot2, type = "l", col = "green", 
     xlim = c(0,0.5), ylab = "", xlab = "", yaxt = "n", 
     ylim = c(-0.015,0.015))
abline(v = (ae$TA[[1]]*100/3))            
abline(v = ((ae$TA[[1]] - ae$SumCO2[[1]])*100/3)) 
abline(h = 0)


###################################################
### code chunk number 77: TAfit4
###################################################
initial_ae <- aquaenv(S = 35, t = 15, SumCO2 = 0.002, TA = 0.0022)
ae <- titration(initial_ae, mass_sample = 0.01, mass_titrant = 0.003, 
                conc_titrant = 0.01, S_titrant = 0.5, steps = 20)


###################################################
### code chunk number 78: TAfit5
###################################################
titcurve <- cbind(ae$delta_mass_titrant, ae$pH)


###################################################
### code chunk number 79: TAfit6
###################################################
fit1 <- TAfit(initial_ae, titcurve, conc_titrant = 0.01, 
       mass_sample = 0.01, S_titrant = 0.5)
fit1


###################################################
### code chunk number 80: TAfit6a (eval = FALSE)
###################################################
## initial_ae_ <- aquaenv(S = 35, t = 15, SumCO2 = 0.002, TA = 0.0022,
##                        k1k2 = "lueker", khf = "perez")
## ae_         <- titration(initial_ae_, mass_sample = 0.01, mass_titrant = 0.003, 
##                          conc_titrant = 0.01,
##                          S_titrant = 0.5, steps = 20, k1k2 = "roy", 
##                          khf = "perez")
## titcurve_   <- cbind(ae_$delta_mass_titrant, ae_$pH)
## fit1_       <- TAfit(initial_ae_, titcurve_, conc_titrant = 0.01, 
##                      mass_sample = 0.01, S_titrant = 0.5, k1k2 = "roy", 
##                      khf = "perez", verbose = TRUE)
## fit1_	      


###################################################
### code chunk number 81: TAfit7 (eval = FALSE)
###################################################
## ae <- titration(initial_ae, mass_sample = 0.01, mass_titrant = 0.003, 
##                 conc_titrant = 0.01, steps = 20, seawater_titrant = TRUE)
## titcurve    <- cbind(ae$delta_mass_titrant, ae$pH)
## tottitcurve <- cbind(ae$pH, convert(ae$pH, "pHscale", "free2tot", S = 35, t = 15))
## Etitcurve   <- cbind(ae$delta_mass_titrant, 
##   (0.4 - ((PhysChemConst$R/10)*initial_ae$T/PhysChemConst$F)*
##      log(10^-tottitcurve[,2]))) 


###################################################
### code chunk number 82: TAfit8 (eval = FALSE)
###################################################
## fit2 <- TAfit(initial_ae, Etitcurve, conc_titrant = 0.01, mass_sample = 0.01, 
##   Evals = TRUE, verbose = TRUE, seawater_titrant = TRUE)
## fit2     


###################################################
### code chunk number 83: TAfit9
###################################################
fit3 <- TAfit(initial_ae, titcurve, conc_titrant = 0.01, mass_sample = 0.01, 
     S_titrant = 0.5, K_CO2fit = TRUE)
fit3
initial_ae$K_CO2


###################################################
### code chunk number 84: TAfit10
###################################################
ae       <- titration(initial_ae, mass_sample = 0.01, mass_titrant = 0.003, 
                      conc_titrant = 0.01, steps = 20, seawater_titrant = TRUE)
titcurve <- cbind(ae$delta_mass_titrant, ae$pH)
fit4 <- TAfit(initial_ae, titcurve, conc_titrant = 0.01, mass_sample = 0.01, 
              K_CO2fit = TRUE, seawater_titrant = TRUE)
fit4


###################################################
### code chunk number 85: TAfit11 (eval = FALSE)
###################################################
## Etitcurve <- cbind(titcurve[,1], (0.4 - ((PhysChemConst$R/10)*initial_ae$T/
##           PhysChemConst$F)*log(10^-titcurve[,2])))
## fit5 <- TAfit(initial_ae, Etitcurve, conc_titrant = 0.01, mass_sample = 0.01, 
##               K_CO2fit = TRUE, seawater_titrant = TRUE, Evals = TRUE)
## fit5


###################################################
### code chunk number 86: TAfit12 (eval = FALSE)
###################################################
## neqsptitcurve <- rbind(titcurve[1:9,], titcurve[11:20,])
## fit6 <- TAfit(initial_ae, neqsptitcurve, conc_titrant = 0.01, 
##               mass_sample = 0.01, seawater_titrant = TRUE, equalspaced = FALSE, 
##               verbose = TRUE, debug = TRUE)
## fit6


###################################################
### code chunk number 87: TAfit13
###################################################
noisetitcurve <- titcurve * rnorm(length(titcurve), mean = 1, sd = 0.01) #one percent error possible
fit7 <- TAfit(initial_ae, noisetitcurve, conc_titrant = 0.01, mass_sample = 0.01, 
              seawater_titrant = TRUE, verbose = FALSE, debug = TRUE)
fit7


###################################################
### code chunk number 88: TAfit14
###################################################
ylim <- range(noisetitcurve[,2], calc)
xlim <- range(tit$delta_mass_titrant, noisetitcurve[,1])
plot(noisetitcurve[,1], noisetitcurve[,2], xlim = xlim, ylim = ylim, 
     type = "l", xlab = "delta mass titrant", ylab = "pH (free scale)")
par(new = TRUE)
plot(tit$delta_mass_titrant, calc, xlim = xlim, ylim = ylim, type = "l", 
     col = "red", xlab = "", ylab = "")


###################################################
### code chunk number 89: TAfit15
###################################################
conc_titrant <- 0.3     # mol/kg-soln
mass_sample  <- 0.2     # kg
S_titrant    <- 14.835  # is aequivalent to the ionic strength of 0.3 mol/kg-soln 
SumBOH3  <- 0.00042 # mol/kg-soln
SumH2SO4 <- 0.02824 # mol/kg-soln
SumHF    <- 0.00007 # mol/kg-soln


###################################################
### code chunk number 90: TAfit16
###################################################
sam <- cbind(sample_dickson1981[,1]/1000, sample_dickson1981[,2]) # convert mass of titrant from g to kg


###################################################
### code chunk number 91: TAfit17
###################################################
dicksonfit <- TAfit(aquaenv(S = 35, t = 25, SumBOH3 = SumBOH3, 
            SumH2SO4 = SumH2SO4, SumHF=SumHF), sam, conc_titrant, 
            mass_sample, S_titrant = S_titrant, debug = TRUE)
dicksonfit


###################################################
### code chunk number 92: TAfit18
###################################################
dicksontitration1 <- titration(aquaenv(S = 35, t = 25, SumCO2 = 0.00220, 
   SumBOH3 = SumBOH3, SumH2SO4 = SumH2SO4, SumHF = SumHF, TA = 0.00245),
   mass_sample = mass_sample, mass_titrant = 0.0025, 
   conc_titrant = conc_titrant, steps = 50, type = "HCl")


###################################################
### code chunk number 93: TAfit19
###################################################
dicksontitration2 <- titration(aquaenv(S = 35, t = 25, SumCO2 = 0.00220, 
   SumBOH3 = SumBOH3, SumH2SO4 = SumH2SO4, SumHF = SumHF, TA = 0.00245),
   mass_sample = mass_sample, mass_titrant = 0.0025, 
   conc_titrant = conc_titrant, S_titrant = S_titrant, steps = 50, type = "HCl")          


###################################################
### code chunk number 94: TAfit20
###################################################
plot(dicksontitration1, xval = dicksontitration1$delta_mass_titrant, 
    what = "pH", xlim = c(0,0.0025), ylim = c(3,8.2), col = "red", 
    xlab = "delta mass titrant") 
par(new = TRUE)
plot(dicksontitration2, xval = dicksontitration2$delta_mass_titrant, 
    what = "pH", xlim = c(0,0.0025), ylim = c(3,8.2), col = "blue", xlab = "") 
par(new = TRUE)
plot(sam[,1], sam[,2], type = "l", xlim = c(0,0.0025), 
    ylim = c(3,8.2), xlab = "", ylab = "")


###################################################
### code chunk number 95: TAfit21
###################################################
plot(dicksontitration2$pH - sam[,2])


###################################################
### code chunk number 96: TAfit22
###################################################
dicksonfit2 <- TAfit(aquaenv(S = 35, t = 25, SumBOH3 = SumBOH3, 
       SumH2SO4 = SumH2SO4, SumHF = SumHF), sam, conc_titrant, 
       mass_sample, S_titrant = S_titrant, debug = TRUE, K_CO2fit = TRUE)
dicksonfit2


###################################################
### code chunk number 97: AquaEnv.rnw:1763-1764
###################################################



###################################################
### code chunk number 98: TAfit23
###################################################
dicksontitration3 <- titration(aquaenv(S = 35, t = 25, SumCO2 = 0.00220, 
   SumBOH3 = SumBOH3, SumH2SO4 = SumH2SO4, SumHF = SumHF, TA = 0.00245, 
   k_w = 4.32e-14, k_co2 = 1e-6, k_hco3 = 8.20e-10, k_boh3 = 1.78e-9, 
   k_hso4 = (1/1.23e1), k_hf = (1/4.08e2)),
   mass_sample = mass_sample, mass_titrant = 0.0025, conc_titrant = conc_titrant,  
   steps = 50, type = "HCl", S_titrant = S_titrant,
   k_w = 4.32e-14, k_co2 = 1e-6, k_hco3 = 8.20e-10, k_boh3 = 1.78e-9, 
   k_hso4 = (1/1.23e1), k_hf = (1/4.08e2))          

plot(dicksontitration3, xval = dicksontitration3$delta_mass_titrant, 
  what = "pH", xlim = c(0,0.0025), ylim = c(3,8.2), col = "blue", 
  xlab = "delta mass titrant") 
par(new = TRUE)
plot(sam[,1], sam[,2], type = "l", xlim = c(0,0.0025), ylim = c(3,8.2), 
  xlab = "", ylab = "")


###################################################
### code chunk number 99: TAfit24
###################################################
plot(dicksontitration3$pH - sam[,2])


###################################################
### code chunk number 100: TAfit25
###################################################
dicksonfit3 <- TAfit(aquaenv(S = 35, t = 25, SumBOH3 = SumBOH3, SumH2SO4 = SumH2SO4, 
       SumHF = SumHF, k_w = 4.32e-14, k_co2 = 1e-6, k_hco3 = 8.20e-10, 
       k_boh3 = 1.78e-9, k_hso4 = (1/1.23e1), k_hf = (1/4.08e2)),
       sam, conc_titrant, mass_sample, S_titrant = S_titrant, debug = TRUE,
       k_w = 4.32e-14, k_co2 = 1e-6, k_hco3 = 8.20e-10, k_boh3 = 1.78e-9, 
       k_hso4 = (1/1.23e1), k_hf = (1/4.08e2))
dicksonfit3


###################################################
### code chunk number 101: extend1
###################################################
simpletitration <- function(aquaenv,                # an object of class aquaenv: minimal definition, 
                                                    # contains all information about the system: 
                                                    # T, S, d, total concentrations of nutrients etc 
                            volume,                 # the volume of the (theoretical) titration vessel in l 
                            amount,                 # the amount of titrant added in mol
                            steps,                  # the amount of steps the amount of titrant is added in 
                            type)                   # the type of titrant: either "HCl" or "NaOH"
  {
    directionTAchange   <- switch(type, HCl  = -1, NaOH = +1)
    TAconcchangeperstep <- convert(((amount/steps)/volume), "conc", "molar2molin", aquaenv$t, aquaenv$S)

    aquaenvtemp <- aquaenv
    
    for (i in 1:steps)
      {
        TA          <- aquaenvtemp$TA + (directionTAchange * TAconcchangeperstep)
        aquaenvtemp <- aquaenv(ae=aquaenvtemp, TA=TA)
        aquaenv     <- merge(aquaenv, aquaenvtemp)
      }

    aquaenv[["DeltaCTitrant"]] <- convert((amount/volume)/steps*(1:(steps+1)), 
                                          "conc", "molar2molin", aquaenv$t, aquaenv$S)
    return(aquaenv)  # object of class aquaenv which contains a titration simulation
  }


###################################################
### code chunk number 102: extend2
###################################################
ae <- simpletitration(aquaenv(S = 35, t = 15, SumCO2 = 0.003500, 
                              SumNH4 = 0.000020, pH = 11.3), 
           volume =100, amount = 1.5, steps = 100, type = "HCl")
what  <- c("CO2", "HCO3", "CO3", "BOH3", "BOH4", "OH", "NH4", "NH3", 
            "H2SO4", "HSO4", "SO4", "HF", "F")
plot(ae, what = what, bjerrum = TRUE, log = TRUE, ylim = c(-6,-1), 
     legendinset = 0, lwd = 3, palette = c(1,3,4,5,6,colors()[seq(100,250,6)]))


###################################################
### code chunk number 103: extend3
###################################################
simpleTAfit <- function(ae,                   # an object of class aquaenv: minimal definition, 
                                              # contains all information about the system: 
                                              # T, S, d, total concentrations of nutrients etc 
                        pHmeasurements,       # a table containing the titration curve: 
                                              # basically a series of pH values (pH on free proton scale)
                        volume,               # the volume of the titration vessel
                        amount,               # the total amount of the titrant added
                        TAguess=0.0025,       # a first guess for [TA] and [SumCO2] to be used as 
                                              # initial values for the optimization procedure
                        type="HCl")           # the type of titrant: either "HCl" or "NaOH"
  {
    ae$Na <- NULL   # make sure ae gets cloned as "skeleton": cloneaquaenv determines "skeleton" 
                    # TRUE or FALSE from the presence of a value for Na
    residuals <- function(state)
      {
        ae$SumCO2  <- state[[1]]
        pHcalc     <- simpletitration(aquaenv(ae=ae, TA=state[[2]]), volume=volume, 
                                      amount=amount, steps=(length(pHmeasurements)-1), type=type)$pH
        residuals <- pHmeasurements-pHcalc
       
        return(residuals)
      }

    require(minpack.lm)
    out <- nls.lm(fn=residuals, par=c(TAguess, TAguess))  #guess for TA is also used as guess for SumCO2
  
    result                    <- list(out$par[[2]], out$par[[1]], out$deviance)
    attr(result[[1]], "unit") <- "mol/kg-soln"
    attr(result[[2]], "unit") <- "mol/kg-soln"
    names(result)             <- c("TA", "SumCO2", "sumofsquares")
    return(result)  # a list of three values 
                    # ([TA] in mol/kg-solution, [SumCO2] in mol/kg-solution, sum of the squared residuals)
  }


###################################################
### code chunk number 104: extend4
###################################################
pHmeasurements <- ae$pH
fit <- simpleTAfit(aquaenv(S = 35, t = 15, SumNH4 = 0.00002), 
       pHmeasurements, volume = 100, amount = 1.5)
fit


###################################################
### code chunk number 105: CleaningUp
###################################################
graphics.off()


