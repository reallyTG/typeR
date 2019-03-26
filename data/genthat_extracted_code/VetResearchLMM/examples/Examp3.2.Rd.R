library(VetResearchLMM)


### Name: Examp3.2
### Title: Examp3.2 from Duchateau, L. and Janssen, P. and Rowlands, G. J.
###   (1998)._Linear Mixed Models. An Introduction with applications in
###   Veterinary Research_. International Livestock Research Institute.
### Aliases: Examp3.2
### Keywords: datasets

### ** Examples

#-------------------------------------------------------------
## Example 3.3 p-88
#-------------------------------------------------------------
# PROC MIXED DATA=ex32;
# CLASS sex sire_id breed;
# MODEL ww = sex agew breed/SOLUTION DDFM=SATTERTH;
# RANDOM sire_id(breed)/SOLUTION;
# LSMEANS breed/ADJUST = TUKEY;
# RUN;

 library(lmerTest)
 str(ex32)
 ex32$sire_id1 <- factor(ex32$sire_id)
 ex32$breed1   <- factor(ex32$breed)

 fm3.4 <-
  lmerTest::lmer(
         formula    = Ww ~ sex + agew + breed1 + (1|sire_id1:breed1)
       , data       = ex32
       , REML       = TRUE
       , control    = lmerControl()
       , start      = NULL
       , verbose    = 0L
    #  , subset
    #  , weights
    #  , na.action
    #  , offset
       , contrasts  = list(sex = "contr.SAS", breed1 = "contr.SAS")
       , devFunOnly = FALSE
    #  , ...
       )
 summary(fm3.4)
 anova(object = fm3.4, ddf = "Satterthwaite")
 lsmeansLT(model = fm3.4)



