library(KFAS)


### Name: rename_states
### Title: Rename the States of SSModel Object
### Aliases: rename_states

### ** Examples

custom_model <- SSModel(1:10 ~ -1 + 
SSMcustom(Z = 1, T = 1, R = 1, Q = 1, P1inf = 1), H = 1) 
custom_model <- rename_states(custom_model, "level")
ll_model <- SSModel(1:10 ~ SSMtrend(1, Q = 1), H = 1)
test_these <- c("y", "Z", "H", "T", "R", "Q", "a1", "P1", "P1inf")
identical(custom_model[test_these], ll_model[test_these])




