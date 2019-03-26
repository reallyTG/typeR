library(VetResearchLMM)


### Name: Examp2.4.2.2
### Title: Examp2.4.2.2 from Duchateau, L. and Janssen, P. and Rowlands, G.
###   J. (1998)._Linear Mixed Models. An Introduction with applications in
###   Veterinary Research_. International Livestock Research Institute.
### Aliases: Examp2.4.2.2
### Keywords: datasets

### ** Examples

#-------------------------------------------------------------
## Example 2.4.2.2 p-64
#-------------------------------------------------------------
# PROC MIXED DATA=ex125 METHOD=ML;
# CLASS drug dose region;
# MODEL pcv=drug dose drug*dose;
# RANDOM region drug*region;
# RUN;
# 
# PROC MIXED DATA=ex125 METHOD=REML;
# CLASS drug dose region;
# MODEL pcv=drug dose drug*dose;
# RANDOM region drug*region;
# RUN;
 
 
library(lme4)
str(ex125)

fm2.4 <- 
  lme4::lmer(
         formula    = Pcv ~ dose*Drug + (1|Region/Drug)
       , data       = ex125
       , REML       = FALSE
       , control    = lmerControl()
       , start      = NULL
       , verbose    = 0L
    #  , subset
    #  , weights
    #  , na.action
    #  , offset
       , contrasts  = NULL
       , devFunOnly = FALSE
    #  , ...
       ) 
summary(fm2.4)
anova(fm2.4)

fm2.5 <- 
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
       , contrasts  = NULL
       , devFunOnly = FALSE
    #  , ...
       )  
summary(fm2.5)
anova(fm2.5)

library(lmerTest)

fm2.6 <- 
    lmerTest::lmer(
         formula    = Pcv ~ dose*Drug + (1|Region/Drug)
      	, data       = ex125
      	, REML       = FALSE
      	, control    = lmerControl()
      	, start      = NULL
      	, verbose    = 0L
      #	, subset
      #	, weights
      #	, na.action
      #	, offset
      	, contrasts  = NULL
      	, devFunOnly = FALSE
      #	, ...
      	)
summary(fm2.6)
anova(fm2.6)

fm2.7 <- 
    lmerTest::lmer(
         formula    = Pcv ~ dose*Drug + (1|Region/Drug)
      	, data       = ex125
      	, REML       = TRUE
      	, control    = lmerControl()
      	, start      = NULL
      	, verbose    = 0L
      #	, subset
      #	, weights
      #	, na.action
      #	, offset
      	, contrasts  = NULL
      	, devFunOnly = FALSE
      #	, ...
      	) 
summary(fm2.7)
anova(fm2.7)




