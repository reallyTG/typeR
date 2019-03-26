library(MuMIn)


### Name: pdredge
### Title: Automated model selection using parallel computation
### Aliases: pdredge
### Keywords: models

### ** Examples


## Don't show: 
# Normally this should be simply "require(parallel) || require(snow)",
# but here we resort to an (ugly) trick to avoid MuMIn's dependency on one of
# these packages and still pass R-check:
if(MuMIn:::.parallelPkgCheck(quiet = TRUE)) {
## End(Don't show)

# One of these packages is required:
## Not run: require(parallel) || require(snow)

# From example(Beetle)

Beetle100 <- Beetle[sample(nrow(Beetle), 100, replace = TRUE),]

fm1 <- glm(Prop ~ dose + I(dose^2) + log(dose) + I(log(dose)^2),
    data = Beetle100, family = binomial, na.action = na.fail)

msubset <- expression(xor(dose, `log(dose)`) & (dose | !`I(dose^2)`)
    & (`log(dose)` | !`I(log(dose)^2)`))
varying.link <- list(family = alist(logit = binomial("logit"),
    probit = binomial("probit"), cloglog = binomial("cloglog") ))

# Set up the cluster
clusterType <- if(length(find.package("snow", quiet = TRUE))) "SOCK" else "PSOCK"
clust <- try(makeCluster(getOption("cl.cores", 2), type = clusterType))
## Don't show: 
if(inherits(clust, "cluster")) { 
## End(Don't show)
clusterExport(clust, "Beetle100")

# noticeable gain only when data has about 3000 rows (Windows 2-core machine)
print(system.time(dredge(fm1, subset = msubset, varying = varying.link)))
print(system.time(pdredge(fm1, cluster = FALSE, subset = msubset,
    varying = varying.link)))
print(system.time(pdd <- pdredge(fm1, cluster = clust, subset = msubset,
    varying = varying.link)))

print(pdd)

## Not run: 
##D # Time consuming example with 'unmarked' model, based on example(pcount).
##D # Having enough patience you can run this with 'demo(pdredge.pcount)'.
##D library(unmarked)
##D data(mallard)
##D mallardUMF <- unmarkedFramePCount(mallard.y, siteCovs = mallard.site,
##D     obsCovs = mallard.obs)
##D (ufm.mallard <- pcount(~ ivel + date + I(date^2) ~ length + elev + forest,
##D     mallardUMF, K = 30))
##D clusterEvalQ(clust, library(unmarked))
##D clusterExport(clust, "mallardUMF")
##D 
##D # 'stats4' is needed for AIC to work with unmarkedFit objects but is not
##D # loaded automatically with 'unmarked'.
##D require(stats4)
##D invisible(clusterCall(clust, "library", "stats4", character.only = TRUE))
##D 
##D #system.time(print(pdd1 <- pdredge(ufm.mallard,
##D #   subset = `p(date)` | !`p(I(date^2))`, rank = AIC)))
##D 
##D system.time(print(pdd2 <- pdredge(ufm.mallard, clust,
##D     subset = `p(date)` | !`p(I(date^2))`, rank = AIC, extra = "adjR^2")))
##D 
##D 
##D # best models and null model
##D subset(pdd2, delta < 2 | df == min(df))
##D 
##D # Compare with the model selection table from unmarked
##D # the statistics should be identical:
##D models <- get.models(pdd2, delta < 2 | df == min(df), cluster = clust)
##D 
##D modSel(fitList(fits = structure(models, names = model.names(models,
##D     labels = getAllTerms(ufm.mallard)))), nullmod = "(Null)")
## End(Not run)

stopCluster(clust)
## Don't show: 
} else # if(! inherits(clust, "cluster"))
message("Could not set up the cluster")
}
## End(Don't show)




