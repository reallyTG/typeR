library(spm12r)


### Name: spm12_contrast
### Title: Build contrasts for SPM12 first level model
### Aliases: spm12_contrast spm12_contrast_list

### ** Examples

res = spm12_contrast(name = "condition1", weights = c(
1, rep(0, 8)))
print(res)
contrasts = list(
list(name = "LeftHand",
       weights = c(1, rep(0, 7)),
replicate = "none",
type = "T" ),
list(name = "RightHand",
weights = c(0, 1, rep(0, 6)),
replicate = "none",
type = "T"), 
list(name = "AllEffects",
weights = rbind(
c(1, rep(0, 7)),
         c(0, 1, rep(0, 6))
       ),
replicate = "none",
type = "F")   
)
res = spm12_contrast_list(contrasts)
print(res)



