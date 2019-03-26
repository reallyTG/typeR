library(forestinventory)


### Name: onephase
### Title: onephase
### Aliases: onephase

### ** Examples

# ----------- non-cluster sampling------------------#

## load grisons dataset:
data(grisons)

## 1) calculate onephase-estimation for entire dataset:
op <- onephase(formula = tvol~1 ,data = grisons,
              phase_id =list(phase.col = "phase_id_2p",terrgrid.id = 2))
summary(op)
confint(op)

## 2) calculate onephase-estimation for given domains (areas) in dataset:
op.a <- onephase(formula = tvol~1,
                 data = grisons,
                 phase_id = list(phase.col = "phase_id_2p", terrgrid.id = 2),
                 area = list(sa.col = "smallarea", areas = c("A", "B")))
summary(op.a)
confint(op.a)

# ----------- cluster sampling ------------------#

## load zurichberg dataset:
data(zberg)

## 1) calculate onephase-estimation for entire dataset:
op.clust <- onephase(formula = basal~1, data = zberg,
                     phase_id = list(phase.col = "phase_id_2p",terrgrid.id = 2),
                     cluster = "cluster")
summary(op.clust)
confint(op.clust)

## 2) calculate onephase-estimation for given areas in dataset:
op.clust.a <- onephase(formula = basal~1,
                       data = zberg,
                       phase_id = list(phase.col = "phase_id_2p", terrgrid.id = 2),
                       cluster = "cluster",
                       area = list(sa.col = "ismallg23", areas = c("2", "3")))
summary(op.clust.a)
confint(op.clust.a)



