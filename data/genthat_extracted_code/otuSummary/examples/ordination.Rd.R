library(otuSummary)


### Name: ordination
### Title: Quickly check the constrained or unconstrained ordination plot
### Aliases: ordination
### Keywords: aplot

### ** Examples

data(varespec)
data(varechem)

ordination(otutab = varespec, env = NULL, SiteInRow = TRUE, percent = FALSE,
    mySite = NULL, ordtype = "urda", display = "sites", biplot = FALSE,
    legPos = "bottomright", showsite = FALSE, saveplot = FALSE)

ordination(otutab = varespec, env = varechem, SiteInRow = TRUE, percent = FALSE,
    mySite = NULL, ordtype = "c_rda", display = "sites", biplot = FALSE,
    legPos = "bottomright", showsite = FALSE, scale = TRUE)



