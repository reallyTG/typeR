library(embryogrowth)


### Name: tsd
### Title: Estimate the parameters that best describe temperature-dependent
###   sex determination
### Aliases: tsd

### ** Examples

## Not run: 
##D library(embryogrowth)
##D CC_AtlanticSW <- subset(DatabaseTSD, RMU=="Atlantic, SW" & 
##D                           Species=="Caretta caretta" & (!is.na(Sexed) & Sexed!=0))
##D tsdL <- with (CC_AtlanticSW, tsd(males=Males, females=Females, 
##D                                  temperatures=Incubation.temperature-Correction.factor, 
##D                                  equation="logistic", replicate.CI=NULL))
##D tsdH <- with (CC_AtlanticSW, tsd(males=Males, females=Females, 
##D                                  temperatures=Incubation.temperature-Correction.factor, 
##D                                  equation="Hill", replicate.CI=NULL))
##D tsdR <- with (CC_AtlanticSW, tsd(males=Males, females=Females, 
##D                                  temperatures=Incubation.temperature-Correction.factor, 
##D                                  equation="Richards", replicate.CI=NULL))
##D tsdDR <- with (CC_AtlanticSW, tsd(males=Males, females=Females, 
##D                                  temperatures=Incubation.temperature-Correction.factor, 
##D                                  equation="Double-Richards", replicate.CI=NULL))
##D gsd <- with (CC_AtlanticSW, tsd(males=Males, females=Females, 
##D                                  temperatures=Incubation.temperature-Correction.factor, 
##D                                  equation="GSD", replicate.CI=NULL))
##D compare_AIC(Logistic_Model=tsdL, Hill_model=tsdH, Richards_model=tsdR, 
##D                DoubleRichards_model=tsdDR, GSD_model=gsd)
##D compare_AICc(Logistic_Model=tsdL, Hill_model=tsdH, Richards_model=tsdR, 
##D                DoubleRichards_model=tsdDR, GSD_model=gsd, factor.value = -1)
##D compare_BIC(Logistic_Model=tsdL, Hill_model=tsdH, Richards_model=tsdR, 
##D                DoubleRichards_model=tsdDR, GSD_model=gsd, factor.value = -1)
##D ##############
##D eo <- subset(DatabaseTSD, Species=="Emys orbicularis", c("Males", "Females", 
##D                                        "Incubation.temperature"))
##D                                        
##D eo_Hill <- with(eo, tsd(males=Males, females=Females, 
##D                                        temperatures=Incubation.temperature,
##D                                        equation="Hill"))
##D eo_Hill <- tsd(df=eo, equation="Hill", replicate.CI=NULL)
##D eo_logistic <- tsd(eo, replicate.CI=NULL)
##D eo_Richards <- with(eo, tsd(males=Males, females=Females, 
##D                                  temperatures=Incubation.temperature, 
##D                                  equation="Richards", replicate.CI=NULL))
##D ### The Hulin model is a modification of Richards (See Hulin et al. 2009)
##D par <- eo_Richards$par
##D names(par)[which(names(par)=="K")] <- "K2"
##D par <- c(par, K1=0)
##D eo_Hulin <- with(eo, tsd(males=Males, females=Females, 
##D                                  parameters.initial=par, 
##D                                  temperatures=Incubation.temperature, 
##D                                  equation="Hulin", replicate.CI=NULL))
##D ### The Double-Richards model is a Richards model with K1 and K2 using the two values
##D ### below and above P
##D par <- eo_Richards$par
##D names(par)[which(names(par)=="K")] <- "K2"
##D par <- c(par, K1=as.numeric(par["K2"])-0.1)
##D par["K1"] <- par["K1"]-0.1
##D eo_Double_Richards <- with(eo, tsd(males=Males, females=Females,
##D                                  parameters.initial=par,
##D                                  temperatures=Incubation.temperature,
##D                                  equation="Double-Richards", replicate.CI=NULL))
##D compare_AIC(Logistic=eo_logistic, Hill=eo_Hill, Richards=eo_Richards, 
##D              Hulin=eo_Hulin, Double_Richards=eo_Double_Richards)
##D ### Note the asymmetry of the Double-Richards model
##D predict(eo_Double_Richards, 
##D        temperatures=c(eo_Double_Richards$par["P"]-0.2, eo_Double_Richards$par["P"]+0.2))
##D predict(eo_Double_Richards)
##D ### It can be used also for incubation duration
##D CC_AtlanticSW <- subset(DatabaseTSD, RMU=="Atlantic, SW" & 
##D                           Species=="Caretta caretta" & Sexed!=0)
##D tsdL_IP <- with (CC_AtlanticSW, tsd(males=Males, females=Females, 
##D                                  durations=IP.mean, 
##D                                  equation="logistic", replicate.CI=NULL))
##D plot(tsdL_IP, xlab="Incubation durations in days")
## End(Not run)



