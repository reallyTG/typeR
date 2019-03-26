library(BTYD)


### Name: bgbb.pmf.General
### Title: BG/BB General Probability Mass Function
### Aliases: bgbb.pmf.General

### ** Examples

params <- c(1.20, 0.75, 0.66, 2.78)
# Probability that a customer will make 3 transactions in the 10
# transaction opportunities following the 6 transaction opportunities
# in the calibration period, given BG/BB parameters.
bgbb.pmf.General(params, n.cal=6, n.star=10, x.star=3)

# Vectors may also be provided as input:
# Comparison between different frequencies:
bgbb.pmf.General(params, n.cal=6, n.star=10, x.star=1:10)
# Comparison between different holdout transaction opportunities:
bgbb.pmf.General(params, n.cal=6, n.star=5:15, x.star=3)



