library(SIRE)


### Name: causal.decompose
### Title: Estimation and decomposition of simultaneous equation model
### Aliases: causal.decompose

### ** Examples

data("macroIT")
eq.system = list(
               eq1 = C ~  CP  + I + CP_1,
               eq2 = I ~ K + CP_1,
               eq3 = WP ~ I + GDP + GDP_1,
               eq4 = GDP ~ C + I + GDP_1,
               eq5 = CP ~ WP + T,
               eq6 = K ~ I + K_1)

instruments = ~ T + CP_1 + GDP_1 + K_1

causal.decompose(data = macroIT,
               eq.system = eq.system,
               resid.est = "noDfCor",
               instruments = instruments,
               p.adj = TRUE,
               alpha = 0.05)



