library(epiR)


### Name: epi.kappa
### Title: Kappa statistic
### Aliases: epi.kappa
### Keywords: univar

### ** Examples

## EXAMPLE 1:
## Kidney samples from 291 salmon were split with one half of the 
## samples sent to each of two laboratories where an IFAT test 
## was run on each sample. The following results were obtained:

## Lab 1 positive, lab 2 positive: 19
## Lab 1 positive, lab 2 negative: 10
## Lab 1 negative, lab 2 positive: 6
## Lab 1 negative, lab 2 negative: 256

dat <- as.table(matrix(c(19,10,6,256), nrow = 2, byrow = TRUE))
colnames(dat) <- c("L1-pos","L1-neg")
rownames(dat) <- c("L2-pos","L2-neg")

epi.kappa(dat, method = "fleiss", alternative = "greater", conf.level = 0.95)

## The z test statistic is 11.53 (P < 0.01). We accept the alternative
## hypothesis that the kappa statistic is greater than zero.

## The proportion of agreements after chance has been excluded is 
## 0.67 (95% CI 0.56 to 0.79). We conclude that, on the basis of 
## this sample, that there is substantial agreement between the two
## laboratories.

## EXAMPLE 2 (from Watson and Petrie 2010, page 1170):
## Silva et al. (2007) compared an early pregnancy enzyme-linked immunosorbent
## assay test for pregnancy associated glycoprotein on blood samples collected 
## from lactating dairy cows at day 27 after artificial insemination with 
## transrectal ultrasound (US) diagnosis of pregnancy at the same stage. 
## The results were as follows:

## ELISA positive, US positive: 596
## ELISA positive, US negative: 61
## ELISA negative, US positive: 29
## ELISA negative, Ul negative: 987

dat <- as.table(matrix(c(596,61,29,987), nrow = 2, byrow = TRUE))
colnames(dat) <- c("US-pos","US-neg")
rownames(dat) <- c("ELISA-pos","ELISA-neg")

epi.kappa(dat, method = "watson", alternative = "greater", conf.level = 0.95)

## The proportion of agreements after chance has been excluded is 
## 0.89 (95% CI 0.86 to 0.91). We conclude that that there is substantial 
## agreement between the two pregnancy diagnostic methods.




