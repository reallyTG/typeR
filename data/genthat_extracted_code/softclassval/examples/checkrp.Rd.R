library(softclassval)


### Name: checkrp
### Title: Input checks and reference preparation for performance
###   calculation
### Aliases: checkrp

### ** Examples

ref <- softclassval:::ref
ref

pred <- softclassval:::pred
pred

ref <- checkrp (r = ref, p = pred)
sens (r = ref, p = pred, .checked = TRUE)



