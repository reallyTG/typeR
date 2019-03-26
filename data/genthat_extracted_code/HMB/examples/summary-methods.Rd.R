library(HMB)


### Name: summary
### Title: Method summary
### Aliases: summary summary,HMB-method

### ** Examples

pop_U  = sample(nrow(HMB_data), 20000)
pop_Sa = sample(pop_U, 5000)
pop_S  = sample(pop_U, 300)

y_S    = HMB_data[pop_S, "GSV"]
X_S    = HMB_data[pop_S, c("hMAX", "h80", "CRR", "pVeg")]
X_Sa   = HMB_data[pop_Sa, c("hMAX", "h80", "CRR", "pVeg")]
Z_Sa   = HMB_data[pop_Sa, c("B20", "B30", "B50")]
Z_U    = HMB_data[pop_U, c("B20", "B30", "B50")]

S_Sa_map = matrix(pop_S, nrow = nrow(X_S), ncol = nrow(X_Sa))
S_Sa_map = t(apply(S_Sa_map, 1, function(x) {
  return(x == pop_Sa)
})) * 1

hmb_model = hmb(y_S, X_S, X_Sa, Z_Sa, Z_U)
summary(hmb_model)



