library(HMB)


### Name: show
### Title: Method show
### Aliases: show show,HMB-method show,SummaryHMB-method

### ** Examples

pop_U  = sample(nrow(HMB_data), 20000)
pop_Sa = sample(pop_U, 5000)
pop_S  = sample(pop_U, 300)

y_S    = HMB_data[pop_S, "GSV"]
X_S    = HMB_data[pop_S, c("hMAX", "h80", "CRR", "pVeg")]
X_Sa   = HMB_data[pop_Sa, c("hMAX", "h80", "CRR", "pVeg")]
Z_Sa   = HMB_data[pop_Sa, c("B20", "B30", "B50")]
Z_U    = HMB_data[pop_U, c("B20", "B30", "B50")]

hmb_model = hmb(y_S, X_S, X_Sa, Z_Sa, Z_U)
show(hmb_model)
pop_U  = sample(nrow(HMB_data), 20000)
pop_Sa = sample(pop_U, 5000)
pop_S  = sample(pop_U, 300)

y_S    = HMB_data[pop_S, "GSV"]
X_S    = HMB_data[pop_S, c("hMAX", "h80", "CRR", "pVeg")]
X_Sa   = HMB_data[pop_Sa, c("hMAX", "h80", "CRR", "pVeg")]
Z_Sa   = HMB_data[pop_Sa, c("B20", "B30", "B50")]
Z_U    = HMB_data[pop_U, c("B20", "B30", "B50")]

hmb_model = hmb(y_S, X_S, X_Sa, Z_Sa, Z_U)
show(summary(hmb_model))



