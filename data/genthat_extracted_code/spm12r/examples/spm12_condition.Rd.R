library(spm12r)


### Name: spm12_condition
### Title: Build Conditions for SPM12 first level model
### Aliases: spm12_condition spm12_condition_list

### ** Examples

res = spm12_condition(
name = "condition1", 
onset = c(0, 2, 4, 6, 8),
duration = rep(1, 5) )
print(res)
L = list(
cond1 = list(onset = c(0, 2, 4, 6, 8), duration = rep(1, 5)), 
cond2 = list(onset = c(0, 2, 4, 6, 8) + 1, duration = rep(1, 5))
)
res = spm12_condition_list(L)
print(res) 



