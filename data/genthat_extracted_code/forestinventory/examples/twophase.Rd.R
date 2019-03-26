library(forestinventory)


### Name: twophase
### Title: twophase
### Aliases: twophase

### ** Examples


## load datasets:
data(grisons)
data(zberg)

# ------------------------------------------------#
# ----------- GLOBAL ESTIMATION ------------------#

#----
## 1) -- Design-based estimation with non-exhaustive auxiliary information
#----

# 1.1) non-cluster-sampling:
summary(twophase(formula = tvol ~mean + stddev + max + q75,
                 data = grisons,
                 phase_id = list(phase.col = "phase_id_2p", terrgrid.id = 2)))

# 1.2) cluster-sampling (see eqns. [57] and [58] in Mandallaz, Hill, Massey 2016):
summary(twophase(formula = basal ~ stade + couver + melange,
                data = zberg,
                phase_id = list(phase.col = "phase_id_2p", terrgrid.id = 2),
                cluster = "cluster"))

# 1.3) example for boundary weight adjustment (non-cluster example):
summary(twophase(formula=tvol ~ mean + stddev + max + q75,
                 data=grisons,
                 phase_id=list(phase.col = "phase_id_2p", terrgrid.id = 2),
                 boundary_weights = "boundary_weights"))

#----
## 2) -- Design-based estimation with exhaustive auxiliary information
#----

# establish order for vector of true auxiliary means:
colnames(lm(formula = tvol ~ mean + stddev + max + q75, data = grisons, x = TRUE)$x)
true.means <- c(1, 11.39, 8.84, 32.68, 18.03)

# 2.1) non-cluster-sampling:
summary(twophase(formula = tvol ~ mean + stddev + max + q75,
                 data = grisons,
                 phase_id = list(phase.col = "phase_id_2p", terrgrid.id = 2),
                 exhaustive = true.means))

# 2.2) cluster-sampling:
summary(twophase(formula = stem ~ stade + couver + melange,
                 data = zberg,
                 phase_id = list(phase.col = "phase_id_2p", terrgrid.id = 2),
                 cluster = "cluster",
                 exhaustive = c(1, 0.10, 0.7, 0.10, 0.6, 0.8)))


# ----------------------------------------------------#
# ----------- SMALL AREA ESTIMATION ------------------#

#----
## 1) -- Design-based estimation with non-exhaustive auxiliary information
#----

# 1.1) Mandallaz's extended pseudo small area estimator (see eqns. [35] and [36] in Mandallaz 2013):
summary(twophase(formula = tvol ~ mean + stddev + max + q75, data = grisons,
                 phase_id = list(phase.col = "phase_id_2p", terrgrid.id = 2),
                 small_area = list(sa.col = "smallarea", areas = c("A", "B","C", "D"),
                                   unbiased = TRUE)))

summary(twophase(formula = basal ~ stade + couver + melange, data=zberg,
                 phase_id = list(phase.col = "phase_id_2p", terrgrid.id = 2),
                 cluster = "cluster",
                 small_area = list(sa.col = "ismallg23", areas = c("2", "3"),
                                   unbiased = TRUE)))


# 1.2) pseudo small area estimator (see eqns. [25] and [26] in Mandallaz 2013):
summary(twophase(formula = tvol ~ mean + stddev + max + q75, data = grisons,
                 phase_id = list(phase.col = "phase_id_2p", terrgrid.id = 2),
                 small_area = list(sa.col = "smallarea", areas = c("A", "B"),
                                   unbiased = TRUE),
                 psmall = TRUE))

summary(twophase(formula = basal ~ stade + couver + melange, data=zberg,
                 phase_id = list(phase.col = "phase_id_2p", terrgrid.id = 2),
                 cluster = "cluster",
                 small_area = list(sa.col = "ismallg23", areas = c("2", "3"),
                                   unbiased = TRUE),
                 psmall = TRUE))


# 1.3) pseudosynthetic small area estimator (see eqns. [35] and [36] in Mandallaz 2013):
summary(twophase(formula = tvol ~ mean + stddev + max + q75, data=grisons,
                 phase_id = list(phase.col = "phase_id_2p", terrgrid.id = 2),
                 small_area = list(sa.col = "smallarea", areas = c("B", "A"),
                                   unbiased = FALSE)))

summary(twophase(formula = basal ~ stade + couver + melange, data=zberg,
                 phase_id = list(phase.col = "phase_id_2p", terrgrid.id = 2),
                 cluster = "cluster",
                 small_area = list(sa.col = "ismallg23", areas = c("2", "3"),
                                   unbiased = FALSE)))


#----
## 2) -- Design-based estimation with exhaustive auxiliary information
#----

# establish order for vector of true auxiliary means:
colnames(lm(formula = tvol ~ mean + stddev + max + q75, data = grisons, x = TRUE)$x)
colnames(lm(formula = basal ~ stade + couver + melange, data = zberg, x = TRUE)$x)

# true auxiliary means taken from Mandallaz et al. (2013):
truemeans.G <- data.frame(Intercept = rep(1, 4),
                         mean = c(12.85, 12.21, 9.33, 10.45),
                         stddev = c(9.31, 9.47, 7.90, 8.36),
                         max = c(34.92, 35.36, 28.81, 30.22),
                         q75 = c(19.77, 19.16, 15.40, 16.91))
rownames(truemeans.G) <- c("A", "B", "C", "D")

# true auxiliary means taken from Mandallaz (1991):
truemeans.G.clust <- data.frame(Intercept = 1,
                               stade400 = 0.175,
                               stade500 = 0.429,
                               stade600 = 0.321,
                               couver2 = 0.791,
                               melange2 = 0.809)
rownames(truemeans.G.clust) <- c("1")


# 2.1) Mandallaz's extended small area estimator (see eqns. [31] and [33] in Mandallaz 2013):
summary(twophase(formula = tvol ~ mean + stddev + max + q75, data = grisons,
                 phase_id = list(phase.col = "phase_id_2p", terrgrid.id = 2),
                 small_area = list(sa.col ="smallarea", areas = c("A", "B"),
                                   unbiased = TRUE),
                 exhaustive = truemeans.G))

summary(twophase(formula = basal ~ stade + couver + melange, data=zberg,
                 phase_id = list(phase.col = "phase_id_2p", terrgrid.id = 2),
                 cluster = "cluster",
                 small_area = list(sa.col = "ismallold", areas = c("1"),
                                   unbiased = TRUE),
                 exhaustive = truemeans.G.clust))


# 2.2) small area estimator (see eqns. [20] and [21] in Mandallaz 2013):
summary(twophase(formula = tvol ~ mean + stddev + max + q75, data = grisons,
                 phase_id = list(phase.col = "phase_id_2p", terrgrid.id = 2),
                 small_area = list(sa.col = "smallarea", areas = c("A"),
                                   unbiased = TRUE),
                 exhaustive = truemeans.G, psmall = TRUE))

summary(twophase(formula = basal ~ stade + couver + melange, data = zberg,
                 phase_id = list(phase.col = "phase_id_2p", terrgrid.id = 2),
                 cluster = "cluster",
                 small_area = list(sa.col ="ismallold", areas = c("1"),
                                   unbiased = TRUE),
                 psmall = TRUE,
                 exhaustive = truemeans.G.clust))


# 2.3) synthetic small area estimator (see eqns. [18] and [19] in Mandallaz 2013):
summary(twophase(formula=tvol ~ mean + stddev + max + q75, data=grisons,
                 phase_id=list(phase.col = "phase_id_2p", terrgrid.id = 2),
                 small_area=list(sa.col = "smallarea", areas = c("A", "B"),
                                 unbiased = FALSE),
                 exhaustive = truemeans.G))

summary(twophase(formula = basal ~ stade + couver + melange, data = zberg,
                 phase_id = list(phase.col = "phase_id_2p", terrgrid.id = 2),
                 cluster = "cluster",
                 small_area = list(sa.col = "ismallold", areas = c("1"),
                                   unbiased = FALSE),
                 exhaustive = truemeans.G.clust))




