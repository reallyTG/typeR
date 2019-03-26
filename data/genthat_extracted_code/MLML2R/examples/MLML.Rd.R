library(MLML2R)


### Name: MLML
### Title: MLE (maximum likelihood estimates) of 5-mC and 5-hmC levels.
### Aliases: MLML

### ** Examples

# load the example datasets from BS, oxBS and TAB methods
data(C_BS_sim)
data(C_OxBS_sim)
data(T_BS_sim)
data(T_OxBS_sim)
data(C_TAB_sim)
data(T_TAB_sim)

# obtain MLE via EM-algorithm for BS+oxBS:
results_em <- MLML(T.matrix = C_BS_sim , U.matrix = T_BS_sim,
L.matrix = T_OxBS_sim, M.matrix = C_OxBS_sim,iterative=TRUE)

# obtain constrained exact MLE for BS+oxBS:
results_exact <- MLML(T.matrix = C_BS_sim , U.matrix = T_BS_sim,
L.matrix = T_OxBS_sim, M.matrix = C_OxBS_sim)

# obtain MLE via EM-algorithm for BS+TAB:
results_em <- MLML(T.matrix = C_BS_sim , U.matrix = T_BS_sim,
G.matrix = T_TAB_sim, H.matrix = C_TAB_sim,iterative=TRUE)

# obtain constrained exact MLE for BS+TAB:
results_exact <- MLML(T.matrix = C_BS_sim , U.matrix = T_BS_sim,
G.matrix = T_TAB_sim, H.matrix = C_TAB_sim)

# obtain MLE via EM-algorithm for oxBS+TAB:
results_em <- MLML(L.matrix = T_OxBS_sim, M.matrix = C_OxBS_sim,
G.matrix = T_TAB_sim, H.matrix = C_TAB_sim,iterative=TRUE)

# obtain constrained exact MLE for oxBS+TAB:
results_exact <- MLML(L.matrix = T_OxBS_sim, M.matrix = C_OxBS_sim,
G.matrix = T_TAB_sim, H.matrix = C_TAB_sim)

# obtain MLE via EM-algorithm for BS+oxBS+TAB:
results_em <- MLML(T.matrix = C_BS_sim , U.matrix = T_BS_sim,
L.matrix = T_OxBS_sim, M.matrix = C_OxBS_sim,
G.matrix = T_TAB_sim, H.matrix = C_TAB_sim,iterative=TRUE)

#' # obtain MLE via Lagrange multiplier for BS+oxBS+TAB:
results_exact <- MLML(T.matrix = C_BS_sim , U.matrix = T_BS_sim,
L.matrix = T_OxBS_sim, M.matrix = C_OxBS_sim,
G.matrix = T_TAB_sim, H.matrix = C_TAB_sim)


# Example of datasets with zero counts and missing values:

C_BS_sim[1,1] <- 0
C_OxBS_sim[1,1] <- 0
C_TAB_sim[1,1] <- 0
T_BS_sim[1,1] <- 0
T_OxBS_sim[1,1] <- 0
T_TAB_sim[1,1] <- 0

C_BS_sim[2,2] <- NA
C_OxBS_sim[2,2] <- NA
C_TAB_sim[2,2] <- NA
T_BS_sim[2,2] <- NA
T_OxBS_sim[2,2] <- NA
T_TAB_sim[2,2] <- NA






