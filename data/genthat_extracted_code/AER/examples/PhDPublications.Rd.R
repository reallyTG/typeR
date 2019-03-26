library(AER)


### Name: PhDPublications
### Title: Doctoral Publications
### Aliases: PhDPublications
### Keywords: datasets

### ** Examples

## from Long (1997)
data("PhDPublications")

## Table 8.1, p. 227
summary(PhDPublications)

## Figure 8.2, p. 220
plot(0:10, dpois(0:10, mean(PhDPublications$articles)), type = "b", col = 2,
  xlab = "Number of articles", ylab = "Probability")
lines(0:10, prop.table(table(PhDPublications$articles))[1:11], type = "b")
legend("topright", c("observed", "predicted"), col = 1:2, lty = rep(1, 2), bty = "n")

## Table 8.2, p. 228
fm_lrm <- lm(log(articles + 0.5) ~ ., data = PhDPublications)
summary(fm_lrm)
-2 * logLik(fm_lrm)
fm_prm <- glm(articles ~ ., data = PhDPublications, family = poisson)
library("MASS")
fm_nbrm <- glm.nb(articles ~ ., data = PhDPublications)

## Table 8.3, p. 246
library("pscl")
fm_zip <- zeroinfl(articles ~ . | ., data = PhDPublications)
fm_zinb <- zeroinfl(articles ~ . | ., data = PhDPublications, dist = "negbin")



