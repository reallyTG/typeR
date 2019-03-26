library(VetResearchLMM)


### Name: Examp2.4.3.1
### Title: Examp2.4.3.1 from Duchateau, L. and Janssen, P. and Rowlands, G.
###   J. (1998)._Linear Mixed Models. An Introduction with applications in
###   Veterinary Research_. International Livestock Research Institute.
### Aliases: Examp2.4.3.1
### Keywords: datasets

### ** Examples

#-------------------------------------------------------------
## Example 2.4.3.1 p-66
#-------------------------------------------------------------
 # PROC MIXED DATA=ex127;
 # CLASS sire;
 # MODEL ww=;
 # RANDOM sire/solution;
 # RUN;
 
library(lme4)
str(ex127)
fm2.8 <- 
  lme4::lmer(
         formula    = Ww~(1|sire)
       , data       = ex127
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
summary(fm2.8)
lme4::fixef(fm2.8)
lme4::ranef(fm2.8)




