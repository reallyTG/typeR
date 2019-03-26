library(HMB)


### Name: ghmb
### Title: Generalized Hierarchical Model-Based estimation method
### Aliases: ghmb

### ** Examples

pop_U    = sample(nrow(HMB_data), 20000)
pop_Sa   = sample(pop_U, 2500)
pop_S    = sample(pop_U, 300)

y_S      = HMB_data[pop_S, "GSV"]
X_S      = HMB_data[pop_S, c("hMAX", "h80", "CRR", "pVeg")]
X_Sa     = HMB_data[pop_Sa, c("hMAX", "h80", "CRR", "pVeg")]
Z_Sa     = HMB_data[pop_Sa, c("B20", "B30", "B50")]
Z_U      = HMB_data[pop_U, c("B20", "B30", "B50")]

Omega_S  = diag(1, nrow(X_S))
Sigma_Sa = diag(1, nrow(Z_Sa))

ghmb_model = ghmb(
  y_S, X_S, X_Sa, Z_Sa, Z_U, Omega_S, Sigma_Sa)
ghmb_model



