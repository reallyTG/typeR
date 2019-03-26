library(survey)


### Name: yrbs
### Title: One variable from the Youth Risk Behaviors Survey, 2015.
### Aliases: yrbs
### Keywords: datasets

### ** Examples

data(yrbs)

yrbs_design <- svydesign(id=~psu, weight=~weight, strata=~stratum,
data=yrbs)
yrbs_design <- update(yrbs_design, qn8yes=2-qn8)

ci <- svyciprop(~qn8yes, yrbs_design, na.rm=TRUE, method="xlogit")
ci

## to print more digits: matches SUDAAN and SPSS exactly, per table 3 of reference
coef(ci)
SE(ci)
attr(ci,"ci")



