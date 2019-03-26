library(eRm)


### Name: plotICC
### Title: ICC Plots
### Aliases: plotICC plotICC.Rm plotjointICC plotjointICC.dRm
### Keywords: models

### ** Examples

# Rating scale model, ICC plot for all items
rsm.res <- RSM(rsmdat)
thresholds(rsm.res)
plotICC(rsm.res)

# now items 1 to 4 in one figure without legends
plotICC(rsm.res, item.subset = 1:4, mplot = TRUE, legpos = FALSE)

# Rasch model for items 1 to 8 from raschdat1
# empirical ICCs displaying relative frequencies (default settings)
rm8.res <- RM(raschdat1[,1:8])
plotICC(rm8.res, empICC=list("raw"))

# the same but using different plotting styles
plotICC(rm8.res, empICC=list("raw",type="b",col="blue",lty="dotted"))

# kernel-smoothed empirical ICCs using bandwidth = 2
plotICC(rm8.res, empICC = list("kernel",smooth=3))

# raw empirical ICCs with confidence intervals
# displaying only items 2,3,7,8
plotICC(rm8.res, item.subset=c(2,3,7,8), empICC=list("raw"), empCI=list())

# Joint ICC plot for items 2, 6, 8, and 15 for a Rasch model
res <- RM(raschdat1)
plotjointICC(res, item.subset = c(2,6,8,15), legpos = "left")



