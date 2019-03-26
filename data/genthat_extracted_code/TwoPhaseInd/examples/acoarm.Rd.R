library(TwoPhaseInd)


### Name: acoarm
### Title: A function to estimate parameters in Cox proportional hazard
###   models by augmented case-only designs for randomized clinical trials
###   with failure time endpoints
### Aliases: acoarm
### Keywords: case-only designs case-cohort designs

### ** Examples

## Load the example data
data(acodata)
## ACO in placebo arm
rfit0 <- acoarm(data=acodata,
                 svtime="vacc1_evinf",
                 event="f_evinf",
                 treatment="f_treat",
                 BaselineMarker="fcgr2a.3",
                 id="ptid",
                 subcohort="subcoh",
                 esttype=1,
                 augment=0,
                 extra=c("f_agele30","f_hsv_2","f_ad5gt18","f_crcm",
                 "any_drug","num_male_part_cat","uias","uras")) 
rfit0

## ACO in active arm
rfit1 <- acoarm(data=acodata,
                 svtime="vacc1_evinf",
                 event="f_evinf",
                 treatment="f_treat",
                 BaselineMarker="fcgr2a.3",
                 id="ptid",
                 subcohort="subcoh",
                 esttype=1,
                 augment=1,
                 extra=c("f_agele30","f_hsv_2","f_ad5gt18","f_crcm",
                 "any_drug","num_male_part_cat","uias","uras")) 
rfit1

## ACO in both arms
rfit2 <- acoarm(data=acodata,
                 svtime="vacc1_evinf",
                 event="f_evinf",
                 treatment="f_treat",
                 BaselineMarker="fcgr2a.3",
                 id="ptid",
                 subcohort="subcoh",
                 esttype=1,
                 augment=2,
                 extra=c("f_agele30","f_hsv_2","f_ad5gt18","f_crcm",
                 "any_drug","num_male_part_cat","uias","uras")) 
rfit2




