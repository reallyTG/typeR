library(TwoPhaseInd)


### Name: aco2arm
### Title: A function to estimate parameters in augmented case-only
###   designs, the genotype is ascertained for a random subcohort from both
###   the active treatment arm and the placebo arm
### Aliases: aco2arm
### Keywords: case-only designs case-cohort designs

### ** Examples

## Load the example data
data(acodata)
## Case-cohort + case-only estimators
rfit1 <- aco2arm(data=acodata,
                 svtime="vacc1_evinf",
                 event="f_evinf",
                 treatment="f_treat",
                 BaselineMarker="fcgr2a.3",
                 id="ptid",
                 subcohort="subcoh",
                 esttype=1,
                 extra=c("f_agele30","f_hsv_2","f_ad5gt18","f_crcm",
                 "any_drug","num_male_part_cat","uias","uras")) 
rfit1



