library(forestmangr)


### Name: graybill_f
### Title: Graybill F Test
### Aliases: graybill_f

### ** Examples

library(forestmangr)
data("exfm11")
exfm11

# The data frame exfm11 contains a height variable called "TH". This will be our
# standard value. We'll compare it to height estimated using different hypsometric equations.
# These are variables "TH_EST1" and "TH_EST2":
graybill_f( exfm11,"TH", "TH_EST1")

# TH_EST1 is statistically different from "TH".

# It's possible to alter the test's significance level using the signif argument:
graybill_f( exfm11,"TH", "TH_EST1", signif = 0.01)

# Different output options are available through the output argument:
graybill_f( exfm11,"TH", "TH_EST2", output="table")
graybill_f( exfm11,"TH", "TH_EST2", output="full")




