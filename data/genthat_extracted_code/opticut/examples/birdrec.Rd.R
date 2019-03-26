library(opticut)


### Name: birdrec
### Title: Bird Species Detections
### Aliases: birdrec
### Keywords: datasets

### ** Examples

data(birdrec)
str(birdrec)

aggregate(rowSums(birdrec$xtab),
    list(TOY=birdrec$samp$TOY, TOD=birdrec$samp$TOD), mean)
boxplot(rowSums(birdrec$xtab) ~ TOD + TOY, birdrec$samp,
    col=c("gold", "tomato"), ylab="# detections")

## Not run: 
##D y <- ifelse(birdrec$xtab > 0, 1, 0)
##D g <- paste0(gsub("[[:digit:]]", "", as.character(birdrec$samp$TOY)),
##D     substr(as.character(birdrec$samp$TOD), 1, 4))
##D g <- factor(g, levels=c("EarlyMorn", "MidMorn", "LateMorn",
##D     "EarlyMidn", "MidMidn", "LateMidn"))
##D ## binary response model
##D oc <- opticut(y ~ 1, strata=g, dist="binomial")
##D ## multi-level response model
##D mc <- multicut(y ~ 1, strata=g, dist="binomial")
##D 
##D ## testing equality of labels
##D splito <- as.character(summary(oc)$summary$split)
##D splitm <- as.character(summary(mc)$summary$split)
##D table(splito == splitm)
##D ## seeing how much those differ
##D bpo <- summary(oc)$bestpart
##D bpm <- summary(mc)$bestpart
##D rs <- rowSums(abs(bpo-bpm))
##D table(rs)
##D 10 * bpo[rs > 0,] + bpm[rs > 0,]
## End(Not run)



