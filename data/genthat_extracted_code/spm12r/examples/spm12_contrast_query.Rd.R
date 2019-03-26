library(spm12r)


### Name: spm12_contrast_query
### Title: Build contrasts query for SPM12 results
### Aliases: spm12_contrast_query spm12_contrast_query_list

### ** Examples

res = spm12_contrast_query(name = "condition1", weights = 1)
print(res)
contrasts = list(
list(name = "All Contrasts",
       weights = Inf
       ),
list(name = "RightHand",
weights = 2) 
)
res = spm12_contrast_query_list(contrasts)
print(res)



