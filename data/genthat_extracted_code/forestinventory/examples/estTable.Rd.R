library(forestinventory)


### Name: estTable
### Title: estTable
### Aliases: estTable

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

## create estimation table with confidence intervals:
sae.table<- estTable(est.list = list(op.a, sae.2p.est, sae.3p.est), add.ci=TRUE,
                     sae = TRUE, vartypes = c("variance", "g_variance",  "ext_variance"))

sae.table.df<- as.data.frame(sae.table)



