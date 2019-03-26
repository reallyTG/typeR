library(meta)


### Name: settings.meta
### Title: Print and change default settings to conduct and print or plot
###   meta-analyses in R package *meta*.
### Aliases: settings.meta

### ** Examples

#
# Get listing of current settings
#
settings.meta("print")

#
# Meta-analyses using default settings
#
metabin(10, 20, 15, 20)
metaprop(4, 20)
metabin(10, 20, 15, 20, sm="RD")
metaprop(4, 20, sm="PLN")
#
# Change summary measure for R functions metabin and metaprop
# and store old settings
#
oldset <- settings.meta(smbin="RD", smprop="PLN")
#
metabin(10, 20, 15, 20)
metaprop(4, 20)
#
# Use old settings
#
settings.meta(oldset)

#
# Change level used to calculate confidence intervals
# (99%-CI for studies, 99.9%-CI for pooled effects)
#
metagen(1:3, (2:4)/10, sm="MD")
settings.meta(level=0.99, level.comb=0.999)
metagen(1:3, (2:4)/10, sm="MD")

#
# Always print a prediction interval
#
settings.meta(prediction=TRUE)
metagen(1:3, (2:4)/10, sm="MD")
metagen(4:6, (4:2)/10, sm="MD")

#
# Try to set unknown argument results in a warning
#
settings.meta(unknownarg=TRUE)

#
# Reset to default settings of R package meta
#
settings.meta("reset")
metabin(10, 20, 15, 20)
metaprop(4, 20)
metagen(1:3, (2:4)/10, sm="MD")

#
# Do not back transform results (e.g. print log odds ratios instead of
# odds ratios, print transformed correlations/proportions instead of
# correlations/proportions)
#
settings.meta(backtransf=FALSE)
metabin(10, 20, 15, 20)
metaprop(4, 20)
metacor(c(0.85, 0.7, 0.95), c(20, 40, 10))

#
# Forest plot using RevMan 5 style
#
settings.meta("revman5")
forest(metagen(1:3, (2:4)/10, sm="MD", comb.fixed=FALSE),
       label.left="Favours A", label.right="Favours B",
       colgap.studlab = grid::unit(2, "cm"),
       colgap.forest.left = grid::unit(0.2, "cm"))

#
# Forest plot using JAMA style
#
settings.meta("jama")
forest(metagen(1:3, (2:4)/10, sm="MD", comb.fixed=FALSE),
       label.left="Favours A", label.right="Favours B",
       colgap.studlab = grid::unit(2, "cm"),
       colgap.forest.left = grid::unit(0.2, "cm"))
#
# Use slightly different layout for confidence intervals
# (especially useful if upper confidence limit can be negative)
#
settings.meta(CIseparator=" - ")
forest(metagen(-(1:3), (2:4)/10, sm="MD", comb.fixed=FALSE),
       label.left="Favours A", label.right="Favours B",
       colgap.studlab = grid::unit(2, "cm"),
       colgap.forest.left = grid::unit(0.2, "cm"))

# Use old settings
#
settings.meta(oldset)



