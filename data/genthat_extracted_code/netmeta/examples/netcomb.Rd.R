library(netmeta)


### Name: netcomb
### Title: Additive network meta-analysis for combinations of treatments
### Aliases: netcomb
### Keywords: Network meta-analysis Additive network meta-analysis

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
#
summary(net1)
forest(net1, xlim = c(0.2, 50))

# Additive model for treatment components (with placebo as inactive
# treatment)
#
nc1 <- netcomb(net1, inactive = "placebo")
#
summary(nc1)
forest(nc1, xlim = c(0.2, 50))

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
##D net1 <- netmeta(lnOR, selnOR, treat1, treat2, id,
##D                 data = Linde2016, ref = "placebo",
##D                 seq = trts,
##D                 sm = "OR", comb.fixed = FALSE)
##D #
##D summary(net1)
##D forest(net1, xlim = c(0.2, 50))
##D 
##D # Additive model for treatment components (with placebo as inactive
##D # treatment)
##D #
##D nc1 <- netcomb(net1, inactive = "placebo")
##D #
##D summary(nc1)
##D forest(nc1, xlim = c(0.2, 50))
## End(Not run)



