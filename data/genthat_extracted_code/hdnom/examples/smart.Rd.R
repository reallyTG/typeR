library(hdnom)


### Name: smart
### Title: Imputed SMART Study Data
### Aliases: smart

### ** Examples

data(smart)
dim(smart)

# # Code for generating the smart dataset by imputing the smarto data
# library("mice")
# library("Hmisc")
# data(smarto)
# set.seed(1000)
# smarti = aregImpute(~ I(TEVENT) + EVENT + SEX + I(AGE) +
#   DIABETES + CEREBRAL + CARDIAC + AAA + PERIPH +
#   STENOSIS + SYSTBP + DIASTBP + SYSTH + DIASTH +
#   I(LENGTH) + I(WEIGHT) + I(BMI) +
#   I(CHOL) + I(HDL) + I(LDL) + I(TRIG) + I(HOMOC) + I(GLUT) + I(CREAT) + I(IMT) +
#   as.factor(ALBUMIN) + as.factor(SMOKING) + I(PACKYRS) + as.factor(ALCOHOL),
#   n.impute = 10, data = smarto)
# imputed = impute.transcan(smarti, imputation = 1, data = smarto,
#   list.out = TRUE, pr = FALSE, check = FALSE)
# smart = smarto
# smart[names(imputed)] = imputed
# str(smart)



