library(AquaEnv)


### Name: TAfit
### Title: TAfit
### Aliases: TAfit
### Keywords: misc

### ** Examples
## Not run: 
##D 
##D ####################################
##D # Calculating TA from titration data
##D ####################################
##D 
##D #### 1.) proof of concept ##########
##D ####################################
##D ####################################
##D 
##D # generate "data":
##D S <- 35
##D t <- 15
##D 
##D SumCO2     <- 0.002000
##D TA         <- 0.002200
##D initial_ae <- aquaenv(S=S, t=t, SumCO2=SumCO2, TA=TA)
##D 
##D mass_sample  <- 0.01  # the mass of the sample solution in kg
##D mass_titrant <- 0.003 # the total mass of the added titrant solution
##D                       # in kg
##D conc_titrant <- 0.01  # the concentration of the titrant solution in
##D                       # mol/kg-soln
##D S_titrant    <- 0.5   # the salinity of the titrant solution (the
##D                       # salinity of a solution with a ionic strength
##D                       # of 0.01 according to:
##D                       # I = (19.924 S) / (1000 - 1.005 S)
##D steps        <- 20    # the amount of steps the mass of titrant is
##D                       # added in 
##D type         <- "HCl"
##D 
##D ae <- titration(initial_ae, mass_sample, mass_titrant, conc_titrant,
##D                 S_titrant, steps, type)
##D 
##D plot(ae, ae$delta_mass_titrant, what="pH", newdevice=FALSE)
##D 
##D # the input data for the TA fitting routine: a table with the added
##D # mass of the titrant and the resulting free scale pH
##D titcurve <- cbind(ae$delta_mass_titrant, ae$pH)
##D 
##D 
##D # for the TA fitting procedure all total quantities except SumCO2
##D # (SumNH4, SumH2S, SumH3PO4, SumSiOH4, SumHNO3, SumHNO2, SumBOH3,
##D # SumH2SO4, SumHF) need to be known. However, the latter three
##D # can be calculated from salinity as it is done in this example.
##D 
##D fit1 <- TAfit(initial_ae, titcurve, conc_titrant, mass_sample,
##D               S_titrant)
##D fit1
##D 
##D # E (V) values as input variables: generate E values using
##D # E0=0.4 V and the nernst equation
##D tottitcurve <- convert(titcurve[,2], "pHscale", "free2sws", S=S,
##D                        t=t)
##D # (Nernst equation relates E to TOTAL [H+] (DOE1994, p.7,
##D # ch.4, sop.3), BUT, if fluoride is present, its SWS, so
##D # we use SWS!
##D Etitcurve   <- cbind(titcurve[,1], (0.4 - ((PhysChemConst$R/10)
##D                *initial_ae$T/PhysChemConst$F)
##D                *log(10^-tottitcurve)))  # Nernst equation
##D 
##D fit2 <- TAfit(initial_ae, Etitcurve, conc_titrant, mass_sample,
##D               S_titrant, Evals=TRUE, verbose=TRUE)
##D fit2
##D           
##D 
##D # k_co2 fitting: one K_CO2 (k_co2) for the whole titration curve
##D # is fitted, i.e. there is NO correction for K_CO2 changes due to
##D # changing S due to mixing with the titrant
##D fit3 <- TAfit(initial_ae, titcurve, conc_titrant, mass_sample,
##D               S_titrant, K_CO2fit=TRUE)
##D fit3
##D 
##D # assume the titrant has the same salinity as the sample
##D # (and is made up of natural seawater, i.e. containing SumBOH4,
##D # SumH2SO4 and SumHF as functions of S), then the "right" K_CO2
##D # should be fitted i.e we do NOT give the argument S_titrant
##D # and set the flag seawater_titrant to TRUE
##D ae       <- titration(initial_ae, mass_sample, mass_titrant,
##D                       conc_titrant, steps=steps, type=type,
##D                       seawater_titrant=TRUE)
##D titcurve <- cbind(ae$delta_mass_titrant, ae$pH)
##D 
##D fit4 <- TAfit(initial_ae, titcurve, conc_titrant, mass_sample,
##D               K_CO2fit=TRUE, seawater_titrant=TRUE)
##D fit4
##D 
##D # fitting of TA, SumCO2, K_CO2 and E0
##D Etitcurve <- cbind(titcurve[,1], (0.4 - ((PhysChemConst$R/10)
##D                    *initial_ae$T/PhysChemConst$F)
##D                    *log(10^-titcurve[,2])))
##D fit5 <- TAfit(initial_ae, Etitcurve, conc_titrant, mass_sample,
##D               K_CO2fit=TRUE, seawater_titrant=TRUE, Evals=TRUE)
##D fit5
##D 
##D # fitting of non equally spaced data:
##D neqsptitcurve <- rbind(titcurve[1:9,], titcurve[11:20,])
##D fit6 <- TAfit(initial_ae, neqsptitcurve, conc_titrant,
##D                mass_sample, seawater_titrant=TRUE,
##D                equalspaced=FALSE)
##D fit6
##D 
##D #add some "noise" on the generated data
##D noisetitcurve <- titcurve * rnorm(length(titcurve),
##D                  mean=1, sd=0.01) #one percent error possible
##D plot(ae, ae$delta_mass_titrant, what="pH", type="l", col="red",
##D      xlim=c(0,0.003), ylim=c(3,8.1), newdevice=FALSE)
##D par(new=TRUE)
##D plot(noisetitcurve[,1],noisetitcurve[,2], type="l",
##D      xlim=c(0,0.003), ylim=c(3,8.1))
##D 
##D fit7 <- TAfit(initial_ae, noisetitcurve, conc_titrant,
##D               mass_sample, seawater_titrant=TRUE)
##D fit7
##D 
##D 
##D 
##D 
##D # 2.) test with generated data from Dickson1981 #
##D #################################################
##D #################################################
##D 
##D conc_titrant = 0.3     # mol/kg-soln
##D mass_sample  = 0.2     # kg
##D S_titrant    = 14.835  # is aequivalent to the ionic strength
##D                        # of 0.3 mol/kg-soln 
##D   
##D SumBOH3  = 0.00042 # mol/kg-soln
##D SumH2SO4 = 0.02824 # mol/kg-soln
##D SumHF    = 0.00007 # mol/kg-soln
##D 
##D # convert mass of titrant from g to kg
##D sam <- cbind(sample_dickson1981[,1]/1000, sample_dickson1981[,2]) 
##D 
##D dicksonfit <- TAfit(aquaenv(t=25, S=35, SumBOH3=SumBOH3,
##D                     SumH2SO4=SumH2SO4, SumHF=SumHF), sam,
##D                     conc_titrant, mass_sample,
##D                     S_titrant=S_titrant, debug=TRUE)
##D dicksonfit
##D #TA     Dickson1981: 0.00245
##D #SumCO2 Dickson1981: 0.00220
##D 
##D # => not exactly the same! why?
##D 
##D 
##D 
##D # a.) does salinity correction (S_titrant) matter or not?
##D ##########################################################
##D 
##D # without salinity correction
##D dicksontitration1 <- titration(aquaenv(t=25, S=35, SumCO2=0.00220,
##D                                SumBOH3=SumBOH3, SumH2SO4=SumH2SO4,
##D                                SumHF=SumHF, TA=0.00245),
##D                                mass_sample=mass_sample,
##D                                mass_titrant=0.0025,
##D                                conc_titrant=conc_titrant,
##D                                steps=50, type="HCl")
##D 
##D # with salinity correction
##D dicksontitration2 <- titration(aquaenv(t=25, S=35, SumCO2=0.00220,
##D                                SumBOH3=SumBOH3, SumH2SO4=SumH2SO4,
##D                                SumHF=SumHF, TA=0.00245),
##D                                mass_sample=mass_sample,
##D                                mass_titrant=0.0025,
##D                                conc_titrant=conc_titrant,
##D                                S_titrant=S_titrant,
##D                                steps=50, type="HCl")          
##D 
##D plot(dicksontitration1, xval=dicksontitration1$delta_mass_titrant,
##D      what="pH", xlim=c(0,0.0025), ylim=c(3,8.2), newdevice=FALSE,
##D      col="red") 
##D par(new=TRUE)
##D plot(dicksontitration2, xval=dicksontitration2$delta_mass_titrant,
##D      what="pH", xlim=c(0,0.0025), ylim=c(3,8.2), newdevice=FALSE,
##D      col="blue") 
##D par(new=TRUE)
##D plot(sam[,1], sam[,2], type="l", xlim=c(0,0.0025), ylim=c(3,8.2))
##D 
##D # => salinity correction makes NO difference, because the relation
##D # between total sample and added titrant is very large:
##D # salinity only drops from 35 to 34.75105
##D 
##D #BUT: there is an offset between the "Dickson" curve and our curve:
##D plot(dicksontitration2$pH - sam[,2])
##D 
##D 
##D # b.) does it get better if we fit K_CO2 as well?
##D #################################################
##D dicksonfit2 <- TAfit(aquaenv(t=25, S=35, SumBOH3=SumBOH3,
##D                              SumH2SO4=SumH2SO4, SumHF=SumHF), sam,
##D                              conc_titrant, mass_sample,
##D 			     S_titrant=S_titrant, debug=TRUE,
##D 			     K_CO2fit=TRUE)
##D dicksonfit2
##D #TA     Dickson1981: 0.00245
##D #SumCO2 Dickson1981: 0.00220
##D 
##D # => yes it does, but it is not perfect yet!
##D 
##D 
##D # c.) differing K values
##D #########################
##D # Dickson uses fixed K values that are slightly different than ours
##D dicksontitration3 <- titration(aquaenv(t=25, S=35, SumCO2=0.00220,
##D                                SumBOH3=SumBOH3, SumH2SO4=SumH2SO4,
##D                                SumHF=SumHF, TA=0.00245, k_w=4.32e-14,
##D 			       k_co2=1e-6, k_hco3=8.20e-10,
##D 			       k_boh3=1.78e-9, k_hso4=(1/1.23e1),
##D 			       k_hf=(1/4.08e2)),
##D 			       mass_sample=mass_sample,
##D 			       mass_titrant=0.0025,
##D 			       conc_titrant=conc_titrant,
##D 			       steps=50, type="HCl",
##D 			       S_titrant=S_titrant, k_w=4.32e-14,
##D 			       k_co2=1e-6, k_hco3=8.20e-10,
##D 			       k_boh3=1.78e-9, k_hso4=(1/1.23e1),
##D 			       k_hf=(1/4.08e2))          
##D plot(dicksontitration3, xval=dicksontitration3$delta_mass_titrant,
##D      what="pH", xlim=c(0,0.0025), ylim=c(3,8.2), newdevice=FALSE,
##D      col="blue") 
##D par(new=TRUE)
##D plot(sam[,1], sam[,2], type="l", xlim=c(0,0.0025), ylim=c(3,8.2))
##D 
##D plot(dicksontitration3$pH - sam[,2])
##D # => no offset between the pH curves
##D 
##D # => exactly the same curves!
##D 
##D 
##D dicksonfit3 <- TAfit(aquaenv(t=25, S=35, SumBOH3=SumBOH3,
##D                      SumH2SO4=SumH2SO4, SumHF=SumHF, k_w=4.32e-14,
##D                      k_co2=1e-6, k_hco3=8.20e-10, k_boh3=1.78e-9,
##D 		     k_hso4=(1/1.23e1), k_hf=(1/4.08e2)),
##D                      sam, conc_titrant, mass_sample,
##D 		     S_titrant=S_titrant, debug=TRUE,
##D                      k_w=4.32e-14, k_co2=1e-6, k_hco3=8.20e-10,
##D 		     k_boh3=1.78e-9, k_hso4=(1/1.23e1),
##D 		     k_hf=(1/4.08e2))
##D dicksonfit3
##D 
##D # PERFECT fit!
##D 
##D plot(sam[,1], sam[,2], xlim=c(0,0.0025), ylim=c(3,8.2), type="l")
##D par(new=TRUE)
##D plot(tit$delta_mass_titrant, calc, xlim=c(0,0.0025), ylim=c(3,8.2),
##D      type="l", col="red")
##D 
## End(Not run)


