library(occ)


### Name: occ
### Title: Estimates PET neuroreceptor occupancies
### Aliases: occ occ.ols occ.ref occ.reml plot.occ print.occ
###   print.summary.occ summary.occ
### Keywords: maximum likelihood estimation neuroreceptor neuroreceptor
###   occupancy occupancy occupancy plot PET positron emission tomography
###   receptor receptor occupancy reference region restricted maximum
###   likelihood estimation

### ** Examples

## Total volumes of distribution (VT) from a simulated PET study
## including a baseline scan, as well as two other scans after
## administration of a drug. Note that each row in the matrix
## represents a ROI, whilst each column represents a scan.

data(occ.example)
occ.example

#                  Baseline 1st postdose 2nd postdose
# Cerebellum           0.39         0.28         0.30
# Frontal cortex       0.72         0.35         0.47
# Occipital cortex     0.96         0.43         0.62
# Parietal cortex      0.75         0.34         0.50
# Temporal cortex      0.44         0.26         0.31


## Default REML fitting of these simulated data:

m = occ(occ.example)

print(m)     # Prints the neuroreceptor occupancy coefficients

summary(m)   # Also prints the non-displaceable volume of
             # distribution (VND), the specific volumes of
             # distribution (VS) and the measurement error

fitted(m)    # Prints the fitted values

residuals(m) # Prints the residuals

plot(m)      # Plots the estimated and observed volumes of
             # distribution



