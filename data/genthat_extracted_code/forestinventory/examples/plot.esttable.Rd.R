library(forestinventory)


### Name: plot.esttable
### Title: Plotting Estimation Results
### Aliases: plot.esttable

### ** Examples


## run onephase estimation:
op.a <- onephase(formula = tvol~1,
                 data = grisons,
                 phase_id = list(phase.col = "phase_id_2p", terrgrid.id = 2),
                 area = list(sa.col = "smallarea", areas = c("A", "B", "C", "D")))

## run small area twophase estimation:
sae.2p.est <- twophase(formula = tvol ~ mean + stddev + max + q75,
                       data = grisons,
                       phase_id = list(phase.col = "phase_id_2p", terrgrid.id = 2),
                       small_area = list(sa.col = "smallarea", areas = c("A", "B","C", "D"),
                                         unbiased = TRUE))

## run small area threephase estimation:
sae.3p.est <- threephase(formula.s0 =  tvol ~ mean,
                         formula.s1 = tvol ~ mean + stddev + max + q75,
                         data = grisons,
                         phase_id = list(phase.col = "phase_id_3p", s1.id = 1, terrgrid.id = 2),
                         small_area=list(sa.col = "smallarea", areas = c("A", "B", "C", "D"),
                                         unbiased = TRUE))

## create estimation table:
sae.table<- estTable(est.list = list(op.a, sae.2p.est, sae.3p.est), add.ci=TRUE,
                     sae = TRUE, vartypes = c("variance", "g_variance",  "ext_variance"))

## plot estimation errors:
plot(sae.table)

## plot point estimates and confidence intervals:
#  Hint: --> use ggplot2 functions to modify graphic:
library(ggplot2)
plot(sae.table, yvar = "estimate") +
   ylab("Timber Volume [m3/ha]")



