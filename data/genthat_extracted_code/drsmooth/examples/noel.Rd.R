library(drsmooth)


### Name: noel
### Title: No/Lowest Observed Effect Levels
### Aliases: noel

### ** Examples

# Prints all available tests of no/lowest observed effect levels at default alpha=.05:
data(DRdata)
noel("dose", "MF_Log", data=DRdata)

# Dunnett's T3 tests at user-specified alpha of .01:
data(DRdata)
noel("dose", "MF_Log", tests=c("dunnettst3"), alpha=.01, data=DRdata)

# Fisher's exact test for dichotomous outcome data:
data(DIdata)
noel(dosecolumn = "Dose",
     targetcolumn = "Tumor",
     data_type = "dichotomous",
     tot.obs = "n",
     data = DIdata)



