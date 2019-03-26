library(scorecard)


### Name: report
### Title: Scorecard Modeling Report
### Aliases: report

### ** Examples

## Not run: 
##D data("germancredit")
##D 
##D y = 'creditability'
##D x = c(
##D   "status.of.existing.checking.account",
##D   "duration.in.month",
##D   "credit.history",
##D   "purpose",
##D   "credit.amount",
##D   "savings.account.and.bonds",
##D   "present.employment.since",
##D   "installment.rate.in.percentage.of.disposable.income",
##D   "personal.status.and.sex",
##D   "property",
##D   "age.in.years",
##D   "other.installment.plans",
##D   "housing"
##D )
##D 
##D special_values=NULL
##D breaks_list=list(
##D  status.of.existing.checking.account=c("... < 0 DM%,%0 <= ... < 200 DM",
##D    "... >= 200 DM / salary assignments for at least 1 year", "no checking account"),
##D  duration.in.month=c(8, 16, 34, 44),
##D  credit.history=c(
##D    "no credits taken/ all credits paid back duly%,%all credits at this bank paid back duly",
##D    "existing credits paid back duly till now", "delay in paying off in the past",
##D    "critical account/ other credits existing (not at this bank)"),
##D  purpose=c("retraining%,%car (used)", "radio/television",
##D    "furniture/equipment%,%domestic appliances%,%business%,%repairs",
##D    "car (new)%,%others%,%education"),
##D  credit.amount=c(1400, 1800, 4000, 9200),
##D  savings.account.and.bonds=c("... < 100 DM", "100 <= ... < 500 DM",
##D    "500 <= ... < 1000 DM%,%... >= 1000 DM%,%unknown/ no savings account"),
##D  present.employment.since=c("unemployed%,%... < 1 year", "1 <= ... < 4 years",
##D    "4 <= ... < 7 years", "... >= 7 years"),
##D  installment.rate.in.percentage.of.disposable.income=c(2, 3),
##D  personal.status.and.sex=c("female : divorced/separated/married", "male : single",
##D    "male : married/widowed"),
##D  property=c("real estate", "building society savings agreement/ life insurance",
##D    "car or other, not in attribute Savings account/bonds", "unknown / no property"),
##D  age.in.years=c(26, 28, 35, 37),
##D  other.installment.plans=c("bank%,%stores", "none"),
##D  housing=c("rent", "own", "for free")
##D  )
##D 
##D # Example I
##D # input dt is a dataframe
##D # split input dataframe into two
##D report(germancredit, y, x, breaks_list, special_values, seed=618, save_report='report1')
##D # donot split input data
##D report(germancredit, y, x, breaks_list, special_values, seed=NULL, save_report='report2')
##D 
##D # Example II
##D # input dt is a list
##D # only one dataset
##D report(list(dt=germancredit), y, x,
##D   breaks_list, special_values, seed=NULL, save_report='report3')
##D # multiple datasets
##D report(list(dt1=germancredit[sample(1000,500)],
##D             dt2=germancredit[sample(1000,500)]), y, x,
##D  breaks_list, special_values, seed=NULL, save_report='report4')
##D # multiple datasets
##D report(list(dt1=germancredit[sample(1000,500)],
##D             dt2=germancredit[sample(1000,500)],
##D             dt3=germancredit[sample(1000,500)]), y, x,
##D  breaks_list, special_values, seed=NULL, save_report='report5')
##D 
## End(Not run)




