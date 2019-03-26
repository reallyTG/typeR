library(meta)


### Name: metacont
### Title: Meta-analysis of continuous outcome data
### Aliases: metacont
### Keywords: htest

### ** Examples

data(Fleiss93cont)
meta1 <- metacont(n.e, mean.e, sd.e, n.c, mean.c, sd.c, data=Fleiss93cont, sm="SMD")
meta1
forest(meta1)

meta2 <- metacont(Fleiss93cont$n.e, Fleiss93cont$mean.e,
                  Fleiss93cont$sd.e,
                  Fleiss93cont$n.c, Fleiss93cont$mean.c,
                  Fleiss93cont$sd.c,
                  sm="SMD")
meta2

data(amlodipine)
meta3 <- metacont(n.amlo, mean.amlo, sqrt(var.amlo),
                  n.plac, mean.plac, sqrt(var.plac),
                  data=amlodipine, studlab=study)
summary(meta3)

# Use pooled variance
#
meta4 <- metacont(n.amlo, mean.amlo, sqrt(var.amlo),
                  n.plac, mean.plac, sqrt(var.plac),
                  data=amlodipine, studlab=study,
                  pooledvar=TRUE)
summary(meta4)

# Use Cohen's d instead of Hedges' g as effect measure
#
meta5 <- metacont(n.e, mean.e, sd.e, n.c, mean.c, sd.c, data=Fleiss93cont,
                  sm="SMD", method.smd="Cohen")
meta5

# Use Glass' delta instead of Hedges' g as effect measure
#
meta6 <- metacont(n.e, mean.e, sd.e, n.c, mean.c, sd.c, data=Fleiss93cont,
                  sm="SMD", method.smd="Glass")
meta6

# Use Glass' delta based on the standard deviation in the experimental group
#
meta7 <- metacont(n.e, mean.e, sd.e, n.c, mean.c, sd.c, data=Fleiss93cont,
                  sm="SMD", method.smd="Glass", sd.glass="experimental")
meta7

# Calculate Hedges' g based on exact formulae
#
update(meta1, exact.smd=TRUE)

#
# Meta-analysis of response ratios (Hedges et al., 1999)
#
data(woodyplants)
meta8 <- metacont(n.elev, mean.elev, sd.elev,
		  n.amb, mean.amb, sd.amb,
                  data=woodyplants, sm="ROM")
summary(meta8)
summary(meta8, backtransf=FALSE)



