library(meta)


### Name: update.meta
### Title: Update a meta-analysis object
### Aliases: update.meta
### Keywords: htest

### ** Examples

data(Fleiss93cont)
meta1 <- metacont(n.e, mean.e, sd.e, n.c, mean.c, sd.c,
                  data=Fleiss93cont, sm="SMD", studlab=study)
meta1

# Change summary measure (from 'SMD' to 'MD')
#
update(meta1, sm="MD")

# Restrict analysis to subset of studies
#
update(meta1, subset=1:2)

# Use different levels for confidence intervals
#
meta2 <- update(meta1, level=0.66, level.comb=0.99)
print(meta2, digits=2)
forest(meta2)



