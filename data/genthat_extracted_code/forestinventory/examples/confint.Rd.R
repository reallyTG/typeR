library(forestinventory)


### Name: confint
### Title: Calculates Confidence Intervals for Global and Small-Area
###   Estimations
### Aliases: confint confint.onephase confint.twophase confint.threephase

### ** Examples

## Calculate twophase estimations by extended pseudosynthetic estimator
#  for 4 small areas ("A", "B", "C", "D") using the grisons-dataset:
sae.est <- twophase(formula = tvol ~ mean + stddev + max + q75,
                    data = grisons,
                    phase_id = list(phase.col = "phase_id_2p", terrgrid.id = 2),
                    small_area = list(sa.col = "smallarea",
                                      areas = c("A", "B","C", "D"),
                                      unbiased = TRUE))

## calculate 95%-confidence intervals for each small area:
confint(sae.est)

## calculate simultaneous 95%-confidence intervals using 'bonferroni'-method:
confint(sae.est, adjust.method = "bonferroni")



