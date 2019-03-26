library(vegan)


### Name: capscale
### Title: [Partial] Distance-based Redundancy Analysis
### Aliases: capscale dbrda
### Keywords: multivariate

### ** Examples

data(varespec)
data(varechem)
## Basic Analysis
vare.cap <- capscale(varespec ~ N + P + K + Condition(Al), varechem,
                     dist="bray")
vare.cap
plot(vare.cap)
anova(vare.cap)
## Avoid negative eigenvalues with additive constant
capscale(varespec ~ N + P + K + Condition(Al), varechem,
                     dist="bray", add =TRUE)
## Avoid negative eigenvalues by taking square roots of dissimilarities
capscale(varespec ~ N + P + K + Condition(Al), varechem,
                     dist = "bray", sqrt.dist= TRUE)
## Principal coordinates analysis with extended dissimilarities
capscale(varespec ~ 1, dist="bray", metaMDS = TRUE)
## dbrda
dbrda(varespec ~ N + P + K + Condition(Al), varechem,
                     dist="bray")
## avoid negative eigenvalues also with Jaccard distances
dbrda(varespec ~ N + P + K + Condition(Al), varechem,
                     dist="jaccard")



