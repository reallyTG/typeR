library(EValue)


### Name: threshold
### Title: Compute E-value for single value of risk ratio
### Aliases: threshold

### ** Examples

## Example 1
## Hammond and Holl (1958 JAMA) Data
## Two by Two Table
#          Lung Cancer    No Lung Cancer
# Smoker    397            78557
# Nonsmoker 51             108778

# first get RR and CI bounds
twoXtwoRR(397, 78557, 51, 108778)

# then compute E-values
evalues.RR(10.729780, 8.017457, 14.359688)



