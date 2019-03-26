library(forestinventory)


### Name: threephase
### Title: threephase
### Aliases: threephase

### ** Examples


## load datasets:
data(grisons)
data(zberg)


## define regression models for simple and cluster sampling:
formula.s0 <- tvol ~ mean # reduced model:
formula.s1 <- tvol ~ mean + stddev + max + q75 # full model
formula.clust.s0 <- basal ~ stade
formula.clust.s1 <- basal ~ stade + couver + melange


# ------------------------------------------------#
# ----------- GLOBAL ESTIMATION ------------------#

#----
## 1) -- Design-based estimation with non-exhaustive auxiliary information
#----

# 1.1) non-cluster-sampling (see eqns. [11], [14] and [16] in Mandallaz 2014):
summary(threephase(formula.s0, formula.s1, data = grisons,
                   phase_id = list(phase.col = "phase_id_3p", s1.id=1, terrgrid.id = 2)))


# 1.2) cluster-sampling (see eqns. [49] and [50] in Mandallaz 2013):
summary(threephase(formula.clust.s0, formula.clust.s1, data = zberg,
                   phase_id = list(phase.col="phase_id_3p", s1.id = 1, terrgrid.id = 2),
                   cluster = "cluster"))


# 1.3) example for boundary weight adjustment (non-cluster example):
summary(threephase(formula.s0, formula.s1, data = grisons,
                   phase_id = list(phase.col="phase_id_3p", s1.id = 1, terrgrid.id = 2),
                   boundary_weights = "boundary_weights"))

#----
## 2) -- Design-based estimation with exhaustive auxiliary information
#----

# 2.1) non-cluster-sampling (see eqns. [7], [9] and [10] in Mandallaz 2014):
summary(threephase(formula.s0, formula.s1, data = grisons,
                   phase_id = list(phase.col = "phase_id_3p", s1.id = 1, terrgrid.id = 2),
                   exhaustive = c(1,11.39)))


# 2.2) cluster-sampling:
summary(threephase(formula.clust.s0, formula.clust.s1, data = zberg,
                   phase_id = list(phase.col = "phase_id_3p", s1.id = 1, terrgrid.id = 2),
                   cluster = "cluster", exhaustive = c(1, 0.10, 0.7, 0.10)))


# ----------------------------------------------------#
# ----------- SMALL AREA ESTIMATION ------------------#

#----
## 1) --  Design-based estimation with non-exhaustive auxiliary information
#----

# 1.1) Mandallaz's extended pseudo small area estimator:
summary(threephase(formula.s0,
                   formula.s1,
                   data = grisons,
                   phase_id = list(phase.col = "phase_id_3p", s1.id = 1, terrgrid.id = 2),
                   small_area=list(sa.col = "smallarea", areas = c("A", "B", "C", "D"),
                                   unbiased = TRUE)))

summary(threephase(formula.clust.s0,
                   formula.clust.s1,
                   data = zberg,
                   phase_id = list(phase.col = "phase_id_3p", s1.id = 1, terrgrid.id = 2),
                   cluster = "cluster",
                   small_area = list(sa.col = "ismallold", areas = c("1"), unbiased = TRUE)))


# 1.2) pseudo small area estimator:
summary(threephase(formula.s0,
                   formula.s1,
                   data = grisons,
                   phase_id = list(phase.col = "phase_id_3p", s1.id = 1, terrgrid.id = 2),
                   small_area = list(sa.col = "smallarea", areas = c("A", "B", "C", "D"),
                                   unbiased = TRUE),
                   psmall = TRUE))

summary(threephase(formula.clust.s0,
                   formula.clust.s1,
                   data=zberg,
                   phase_id=list(phase.col="phase_id_3p", s1.id=1, terrgrid.id=2),
                   cluster="cluster",
                   small_area=list(sa.col="ismallold", areas=c("1"), unbiased=TRUE),
                   psmall = TRUE))


# 1.3) pseudosynthetic small area estimator:
summary(threephase(formula.s0  = tvol ~ mean,
                   formula.s1 = tvol ~ mean + stddev + max + q75,
                   data = grisons,
                   phase_id = list(phase.col = "phase_id_3p", s1.id = 1, terrgrid.id = 2),
                   small_area = list(sa.col = "smallarea", areas = c("A", "B", "C", "D"),
                                   unbiased = FALSE)))

summary(threephase(formula.clust.s0,
                   formula.clust.s1,
                   data = zberg,
                   phase_id = list(phase.col = "phase_id_3p", s1.id = 1, terrgrid.id = 2),
                   cluster = "cluster",
                   small_area = list(sa.col = "ismallold", areas = c("1"), unbiased = FALSE)))


#----
## 2) --  Design-based estimation with exhaustive auxiliary information
#----

# true auxiliary mean for variable "mean" taken from Mandallaz et al. (2013):
truemeans.G <- data.frame(Intercept = rep(1, 4),
                         mean = c(12.85, 12.21, 9.33, 10.45))
rownames(truemeans.G) <- c("A", "B", "C", "D")

# true auxiliary means taken from Mandallaz (1991):
truemeans.G.clust <- data.frame(Intercept = 1, stade400 = 0.175, stade500 = 0.429,
                               stade600 = 0.321)
rownames(truemeans.G.clust) <- c("1")


# 2.1) Mandallaz's extended small area estimator:
summary(threephase(formula.s0,
                   formula.s1,
                   data = grisons,
                   phase_id = list(phase.col = "phase_id_3p", s1.id = 1, terrgrid.id = 2),
                   small_area = list(sa.col = "smallarea", areas = c("A", "B", "C", "D"),
                                unbiased = TRUE),
                   exhaustive = truemeans.G))

summary(threephase(formula.clust.s0,
                   formula.clust.s1,
                   data = zberg,
                   phase_id = list(phase.col = "phase_id_3p", s1.id = 1, terrgrid.id = 2),
                   cluster = "cluster",
                   small_area = list(sa.col = "ismallold", areas = c("1"), unbiased = TRUE),
                   exhaustive = truemeans.G.clust))


# 2.2) small area estimator:
summary(threephase(formula.s0,
                   formula.s1,
                   data = grisons,
                   phase_id = list(phase.col = "phase_id_3p", s1.id = 1, terrgrid.id = 2),
                   small_area = list(sa.col = "smallarea", areas = c("A", "B", "C", "D"),
                                   unbiased = TRUE),
                   exhaustive = truemeans.G,
                   psmall = TRUE))

summary(threephase(formula.clust.s0,
                   formula.clust.s1,
                   data = zberg,
                   phase_id = list(phase.col = "phase_id_3p", s1.id = 1, terrgrid.id = 2),
                   cluster = "cluster",
                   small_area = list(sa.col = "ismallold", areas = c("1"), unbiased = TRUE),
                   exhaustive = truemeans.G.clust,
                   psmall = TRUE))


# 2.3) synthetic small area estimator:
summary(threephase(formula.s0,
                   formula.s1,
                   data = grisons,
                   phase_id = list(phase.col="phase_id_3p", s1.id = 1, terrgrid.id = 2),
                   small_area = list(sa.col = "smallarea", areas = c("A", "B", "C", "D"),
                                   unbiased = FALSE),
                   exhaustive = truemeans.G))

summary(threephase(formula.clust.s0,
                   formula.clust.s1,
                   data = zberg,
                   phase_id = list(phase.col = "phase_id_3p", s1.id = 1, terrgrid.id = 2),
                   cluster = "cluster",
                   small_area = list(sa.col = "ismallold", areas = c("1"), unbiased = FALSE),
                   exhaustive = truemeans.G.clust))




