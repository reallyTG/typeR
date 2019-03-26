library(VetResearchLMM)


### Name: Examp2.5.2.1
### Title: Examp2.5.2.1 from Duchateau, L. and Janssen, P. and Rowlands, G.
###   J. (1998)._Linear Mixed Models. An Introduction with applications in
###   Veterinary Research_. International Livestock Research Institute.
### Aliases: Examp2.5.2.1
### Keywords: datasets

### ** Examples

#-------------------------------------------------------------
## Example 2.5.2.1 p-68
#-------------------------------------------------------------
 # PROC MIXED DATA=ex125;
 # CLASS drug dose region;
 # MODEL pcv=drug dose drug*dose / solution covb;
 # RANDOM region drug*region;
 # LSMEANS drug*dose;
 # RUN;

library(lmerTest)
str(ex125)

fm2.10 <-
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
summary(fm2.10)
anova(fm2.10)
summary(fm2.10)$vcov
lsmeansLT(model = fm2.10)



