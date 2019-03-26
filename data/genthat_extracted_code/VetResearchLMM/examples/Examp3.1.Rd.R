library(VetResearchLMM)


### Name: Examp3.1
### Title: Examp3.1 from Duchateau, L. and Janssen, P. and Rowlands, G. J.
###   (1998)._Linear Mixed Models. An Introduction with applications in
###   Veterinary Research_. International Livestock Research Institute.
### Aliases: Examp3.1
### Keywords: datasets

### ** Examples

#-------------------------------------------------------------
## Example 3.1 Model 1 p-80
#-------------------------------------------------------------
# PROC MIXED DATA=ex31;
# CLASS drug dose herd;
# MODEL PCV2=drug dose(drug)/solution ddfm=satterth;
# RANDOM herd(drug);
# ESTIMATE 'Mean Samorin' intercept 1 drug 0 1 dose(drug) 0 0 1;
# ESTIMATE 'Berenil 2 doses' dose(drug) 1 -1 0;
# ESTIMATE 'Ber vs Sam at dose 1' drug 1 -1 dose(drug) 1 0 -1;
# CONTRAST 'Mean Samorin' intercept 1 drug 0 1 dose(drug) 0 0 1;
# CONTRAST 'Berenil dif 2 doses' dose(drug) 1 -1 0;
# CONTRAST 'Ber vs Sam at dose 1' drug 1 -1 dose(drug) 1 0 -l;
# CONTRAST 'some difference' drug 1 -1 dose(drug) 0.5 0.5 -1,
#           drug 0 0 dose(drug) 1 -1 0;
# LSMEANS dose(drug);
# RUN;

 library(lmerTest)
 str(ex31)
 ex31$drug1 <- factor(ex31$drug)
 ex31$dose1 <- factor(ex31$dose)
 ex31$herd1 <- factor(ex31$herd)

 fm3.1 <-
  lmerTest::lmer(
         formula    = PCV2 ~ drug1 + dose1:drug1 + (1|herd1:drug1)
       , data       = ex31
       , REML       = TRUE
       , control    = lmerControl()
       , start      = NULL
       , verbose    = 0L
    #  , subset
    #  , weights
    #  , na.action
    #  , offset
       , contrasts  = list(dose1 = "contr.SAS", drug1 = "contr.SAS")
       , devFunOnly = FALSE
    #  , ...
       )
 summary(fm3.1)
 anova(object = fm3.1, ddf = "Satterthwaite")
 lsmeansLT(model = fm3.1, test.effs = "dose1:drug1")

#-------------------------------------------------------------
## Example 3.1 Model 2 p-84
#-------------------------------------------------------------
# PROC MIXED DATA=ex31;
# CLASS drug dose herd;
# MODEL PCV2=PCV1 drug dose(drug)/solution ddfm=satterth;
# RANDOM herd(drug);
# RUN;

 library(lmerTest)
 str(ex31)
 ex31$drug1 <- factor(ex31$drug)
 ex31$dose1 <- factor(ex31$dose)
 ex31$herd1 <- factor(ex31$herd)

 fm3.2 <-
  lmerTest::lmer(
         formula    = PCV2 ~ PCV1 + drug1 + dose1:drug1 + (1|herd1:drug1)
       , data       = ex31
       , REML       = TRUE
       , control    = lmerControl()
       , start      = NULL
       , verbose    = 0L
    #  , subset
    #  , weights
    #  , na.action
    #  , offset
       , contrasts  = list(dose1 = "contr.SAS", drug1 = "contr.SAS")
       , devFunOnly = FALSE
    #  , ...
       )
 summary(fm3.2)
 anova(object = fm3.2, ddf = "Satterthwaite")
 lsmeansLT(model = fm3.2, test.effs = "herd1:drug1")

#-------------------------------------------------------------
## Example 3.1 Model 3 p-86
#-------------------------------------------------------------
# PROC MIXED DATA=ex31;
# CLASS drug dose herd;
# MODEL PCV2=drug dose(drug) PCV1*dose(drug)/solution ddfm=satterth;
# RANDOM herd(drug);
# RUN;

 library(lmerTest)
 str(ex31)
 ex31$drug1 <- factor(ex31$drug)
 ex31$dose1 <- factor(ex31$dose)
 ex31$herd1 <- factor(ex31$herd)

 fm3.3 <-
  lmerTest::lmer(
         formula    = PCV2 ~ drug1 + PCV1*dose1:drug1 + (1|herd1:drug1)
       , data       = ex31
       , REML       = TRUE
       , control    = lmerControl()
       , start      = NULL
       , verbose    = 0L
    #  , subset
    #  , weights
    #  , na.action
    #  , offset
       , contrasts  = list(dose1 = "contr.SAS", drug1 = "contr.SAS")
       , devFunOnly = FALSE
    #  , ...
       )
 summary(fm3.3)
 anova(object = fm3.3, ddf = "Satterthwaite")
 lsmeansLT(model = fm3.3, test.effs = "dose1:drug1")



