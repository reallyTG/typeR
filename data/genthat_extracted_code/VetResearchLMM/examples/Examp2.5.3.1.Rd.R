library(VetResearchLMM)


### Name: Examp2.5.3.1
### Title: Examp2.5.3.1 from Duchateau, L. and Janssen, P. and Rowlands, G.
###   J. (1998)._Linear Mixed Models. An Introduction with applications in
###   Veterinary Research_. International Livestock Research Institute.
### Aliases: Examp2.5.3.1
### Keywords: datasets

### ** Examples

#-------------------------------------------------------------
## Example 2.5.3.1 p-70
#-------------------------------------------------------------
 # PROC GLM DATA=ex125;
 # CLASS drug dose region;
 # MODEL pcv=region drug region*drug dose drug*dose;
 # RANDOM region drug*region;
 # RUN;


 # PROC MIXED DATA=ex125;
 # CLASS drug dose region;
 # MODEL pcv=drug dose drug*dose / ddfm=satterth;
 # RANDOM region drug*region;
 # ESTIMATE 'drug dif' drug -1 1 drug*dose -0.5 -0.5 0.5 0.5;
 # ESTIMATE 'Samorin mean' INTERCEPT 1 drug 0 1 dose 0.5 0.5
 #                             drug*dose 0 0 0.5 0.5;
 # ESTIMATE 'Samorin HvsL' dose 1 -1 drug*dose 0 0 1 -1;
 # ESTIMATE 'Samorin high' INTERCEPT 1 drug 0 1 dose 1 0
 #                             drug*dose 0 0 1 0;
 # RUN;

library(lme4)
str(ex125)
ex125$Region1 <- factor(ex125$Region)
 fm2.11 <-
  aov(
      formula     = Pcv ~ Region1 + Drug + Error(Drug:Region1) + dose + dose:Drug
    , data        = ex125
    , projections = FALSE
    , qr          = TRUE
    , contrasts   = NULL
  #  , ...
    )
 summary(fm2.11)

 fm2.12 <-
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
 summary(fm2.12)
 anova(object = fm2.12, ddf = "Satterthwaite")

library(multcomp)
Contrasts1 <-
          matrix(c(
                  1, 0.5, 0, 0
                , 0, 0, -1, -0.5
                , 1, 1, 0, 0
                , 0, 1, 0, 0
                )
               , ncol = 4
               , byrow = TRUE
               , dimnames = list(
                  c("C1", "C2", "C3", "C4")
                , rownames(summary(fm2.12)$coef)
               )
              )

Contrasts1
summary(glht(fm2.12, linfct=Contrasts1))




