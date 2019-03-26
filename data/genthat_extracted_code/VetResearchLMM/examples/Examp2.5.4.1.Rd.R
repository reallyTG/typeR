library(VetResearchLMM)


### Name: Examp2.5.4.1
### Title: Examp2.5.4.1 from Duchateau, L. and Janssen, P. and Rowlands, G.
###   J. (1998)._Linear Mixed Models. An Introduction with applications in
###   Veterinary Research_. International Livestock Research Institute.
### Aliases: Examp2.5.4.1
### Keywords: datasets

### ** Examples

#-------------------------------------------------------------
## Example 2.5.4.1 p-74
#-------------------------------------------------------------
 # PROC MIXED DATA=ex125;
 # CLASS drug dose region;
 # MODEL pcv=drug dose drug*dose / ddfm=satterth;
 # RANDOM region drug*region;
 # ESTIMATE 'Samorin mean' INTERCEPT 1 drug 0 1 dose 0.5 0.5
 #                             drug*dose 0 0 0.5 0.5;
 # RUN;
 
 # PROC GLM DATA=ex125;
 # CLASS drug dose region;
 # MODEL pcv=region drug region*drug dose drug*dose;
 # ESTIMATE 'Samorin mean' INTERCEPT 1 drug 0 1 dose 0.5 0.5
 #                             drug*dose 0 0 0.5 0.5;
 # RUN;
  
 library(lme4)
 str(ex125)
 ex125$Region1 <- factor(ex125$Region)
  fm2.13 <- 
  lmerTest::lmer(
         formula    = Pcv ~ dose*Drug + (1|Region/Drug)
       , data       = ex125
       , REML       = TRUE
       , control    = lmerControl()
       , start      = NULL
       , verbose    = 0L
    #  , subset
    #  , weights
    #  , na.action
    #  , offset
       , contrasts  = list(dose = "contr.SAS", Drug = "contr.SAS")
       , devFunOnly = FALSE
    #  , ...
       )                       
  summary(fm2.13)
 
 library(multcomp)
 Contrasts2 <-
           matrix(c(
                   1, 0.5, 0, 0
                 )
                , ncol = 4
                , byrow = TRUE
                , dimnames = list(
                   c("C5")
                 , rownames(summary(fm2.13)$coef)
                )
               )
 
 Contrasts2
 summary(glht(fm2.13, linfct=Contrasts2))
 



