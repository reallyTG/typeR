library(netmeta)


### Name: forest.netcomb
### Title: Forest plot for additive network meta-analysis
### Aliases: forest.netcomb
### Keywords: plot Forest plot Additive network meta-analysis

### ** Examples

data(Linde2016)

# Only consider studies including Face-to-face PST (to reduce runtime
# of example)
#
face <- subset(Linde2016, id %in% c(16, 24, 49, 118))

# Conduct random effects network meta-analysis
#
net1 <- netmeta(lnOR, selnOR, treat1, treat2, id,
                data = face, ref = "placebo",
                sm = "OR", comb.fixed = FALSE)

# Additive model for treatment components (with placebo as inactive
# treatment)
#
nc1 <- netcomb(net1, inactive = "placebo")
#
forest(nc1)

## Not run: 
##D # Specify, order of treatments
##D #
##D trts <- c("TCA", "SSRI", "SNRI", "NRI", "Low-dose SARI", "NaSSa",
##D           "rMAO-A", "Ind drug", "Hypericum", "Face-to-face CBT",
##D           "Face-to-face PST", "Face-to-face interpsy", "Face-to-face psychodyn",
##D           "Other face-to-face", "Remote CBT", "Self-help CBT", "No contact CBT",
##D           "Face-to-face CBT + SSRI", "Face-to-face interpsy + SSRI",
##D           "Face-to-face PST + SSRI", "UC", "Placebo")
##D #
##D # Note, three treatments are actually combinations of 'SSRI' with
##D # other components:
##D #
##D # "Face-to-face CBT + SSRI",
##D # "Face-to-face interpsy + SSRI",
##D # "Face-to-face PST + SSRI"
##D 
##D # Conduct random effects network meta-analysis
##D #
##D net2 <- netmeta(lnOR, selnOR, treat1, treat2, id,
##D                 data = Linde2016, ref = "placebo",
##D                 seq = trts,
##D                 sm = "OR", comb.fixed = FALSE)
##D #
##D summary(net2)
##D 
##D # Additive model for treatment components (with placebo as inactive
##D # treatment)
##D #
##D nc2 <- netcomb(net2, inactive = "placebo")
##D #
##D forest(nc2)
## End(Not run)



