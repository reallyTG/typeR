library(bife)


### Name: bife
### Title: Binary Choice Models with Fixed Effects
### Aliases: bife

### ** Examples

library("bife")

# Load 'psid' dataset
dataset <- psid
head(dataset)

# Fixed effects logit model w/o bias-correction
mod_no <- bife(LFP ~ AGE + I(INCH / 1000) + KID1 + KID2 + KID3 | ID, 
 data = dataset, bias_corr = "no")

# Summary of uncorrected structural parameters only        
summary(mod_no)

# Summary plus fixed effects
summary(mod_no, fixed = TRUE)

# Fixed effects logit model with analytical bias-correction
mod_ana <- bife(LFP ~ AGE + I(INCH / 1000) + KID1 + KID2 + KID3 | ID,
 data = dataset)
               
# Summary of bias-corrected structural parameters only
summary(mod_ana)

# Summary of uncorrected structural parameters only
summary(mod_ana, corrected = FALSE)

# Summary of bias-corrected structural parameters plus -adjusted
# fixed effects
summary(mod_ana, fixed = TRUE)

# Extract bias-corrected structural parameters of mod_ana
beta_ana <- coef(mod_ana)
print(beta_ana)

# Extract bias-adjusted fixed effects of mod_ana
alpha_ana <- coef(mod_ana, fixed = TRUE)
print(alpha_ana)

# Extract uncorrected structural parameters of mod_ana
beta_no <- coef(mod_ana, corrected = FALSE)
print(beta_no)

# Extract covariance matrix of bias-corrected structural
# parameters of mod_ana
vcov_ana <- vcov(mod_ana)
print(vcov_ana)

# Extract covariance matrix of uncorrected structural parameters
# of mod_ana
vcov_no <- vcov(mod_ana, corrected = FALSE)
print(vcov_no)




