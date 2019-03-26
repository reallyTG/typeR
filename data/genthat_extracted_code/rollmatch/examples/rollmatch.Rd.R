library(rollmatch)


### Name: rollmatch
### Title: Rolling entry matching
### Aliases: rollmatch

### ** Examples

data(package="rollmatch", "rem_synthdata_small")

formula <- as.formula(treat ~ qtr_pmt + yr_pmt + age)

r_match <- rollmatch(formula, data = rem_synthdata_small, tm = "quarter",
                       entry = "entry_q", id = "indiv_id", alpha = 0.2)

r_match




