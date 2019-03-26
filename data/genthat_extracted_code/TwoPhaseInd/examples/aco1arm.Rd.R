library(TwoPhaseInd)


### Name: aco1arm
### Title: A function to estimate parameters in augmented case-only
###   designs, the genotype is ascertained for a random subcohort from the
###   active treatment arm or the placebo arm
### Aliases: aco1arm
### Keywords: case-only designs case-cohort designs

### ** Examples

## Load the example data
data(acodata)
## ACO in active arm
rfit1 <- aco1arm(data=acodata,
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

## ACO in placebo arm
rfit2 <- aco1arm(data=acodata,
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
rfit2




