library(bife)


### Name: apeff_bife
### Title: Average Partial Effects for Binary Choice Models with Fixed
###   Effects
### Aliases: apeff_bife

### ** Examples

library("bife")

# Load 'psid' dataset
dataset <- psid
head(dataset)

# Fixed effects logit model w/o bias-correction
mod_no <- bife(LFP ~ AGE + I(INCH / 1000) + KID1 + KID2 + KID3 | ID,
 data = dataset, bias_corr = "no")
               
# Compute uncorrected average partial effects for mod_no
# Note: bias_corr does not affect the result
apeff_bife(mod_no, discrete = c("KID1", "KID2", "KID3")) 

# Fixed effects logit model with analytical bias-correction
mod_ana <- bife(LFP ~ AGE + I(INCH / 1000) + KID1 + KID2 + KID3 | ID,
 data = dataset)
               
# Compute semi-corrected average partial effects for mod_ana
apeff_bife(mod_ana, discrete = c("KID1", "KID2", "KID3"),
 bias_corr = "semi")

# Compute analytical bias-corrected average partial effects
# for mod_ana
apeff_bife(mod_ana, discrete = c("KID1", "KID2", "KID3"))
 



