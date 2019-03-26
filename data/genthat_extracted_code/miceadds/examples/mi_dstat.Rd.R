library(miceadds)


### Name: mi_dstat
### Title: Cohen's d Effect Size for Missingness Indicators
### Aliases: mi_dstat

### ** Examples

#############################################################################
# EXAMPLE 1: d effect size for missingness indicators data.ma01
#############################################################################

data(data.ma01)
dat <- data.ma01

# compute d effect sizes
md <- miceadds::mi_dstat(dat)
round( md, 3 )



