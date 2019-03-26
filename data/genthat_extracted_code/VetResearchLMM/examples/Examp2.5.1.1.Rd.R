library(VetResearchLMM)


### Name: Examp2.5.1.1
### Title: Examp2.5.1.1 from Duchateau, L. and Janssen, P. and Rowlands, G.
###   J. (1998)._Linear Mixed Models. An Introduction with applications in
###   Veterinary Research_. International Livestock Research Institute.
### Aliases: Examp2.5.1.1
### Keywords: datasets

### ** Examples

#-------------------------------------------------------------
## Example 2.5.1.1 p-67
#-------------------------------------------------------------
 # PROC MIXED DATA=ex125;
 # CLASS drug dose region;
 # MODEL pcv=drug dose drug*dose / solution covb;
 # RANDOM region drug*region;
 # RUN;
 
library(lme4)
str(ex125)

fm2.9 <- 
  lme4::lmer(
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
 summary(fm2.9)
 anova(fm2.9)
 summary(fm2.9)$vcov




