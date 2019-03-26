library(HMB)


### Name: gtsmb
### Title: Generalized Two-Staged Model-Based estmation
### Aliases: gtsmb

### ** Examples

pop_U   = sample(nrow(HMB_data), 20000)
pop_Sa  = sample(pop_U, 500)
pop_S   = sample(pop_U, 100)

y_S     = HMB_data[pop_S, "GSV"]
X_S     = HMB_data[pop_S, c("hMAX", "h80", "CRR")]
X_Sa    = HMB_data[pop_Sa, c("hMAX", "h80", "CRR")]
Z_Sa    = HMB_data[pop_Sa, c("B20", "B30", "B50")]
Z_U     = HMB_data[pop_U, c("B20", "B30", "B50")]

Omega_S = diag(1, nrow(X_S))
Phis_Sa = array(0, c(nrow(X_Sa), nrow(X_Sa), ncol(X_Sa) * (ncol(X_Sa) + 1) / 2))
Phis_Sa[, , 1] = diag(1, nrow(X_Sa)) # Phi(1,1)
Phis_Sa[, , 2] = diag(1, nrow(X_Sa)) # Phi(2,1)
Phis_Sa[, , 3] = diag(1, nrow(X_Sa)) # Phi(2,2)
Phis_Sa[, , 4] = diag(1, nrow(X_Sa)) # Phi(3,1)
Phis_Sa[, , 5] = diag(1, nrow(X_Sa)) # Phi(3,2)
Phis_Sa[, , 6] = diag(1, nrow(X_Sa)) # Phi(3,3)

gtsmb_model = gtsmb(y_S, X_S, X_Sa, Z_Sa, Z_U, Omega_S, Phis_Sa)
gtsmb_model



