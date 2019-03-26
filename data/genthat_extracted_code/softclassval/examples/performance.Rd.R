library(softclassval)


### Name: confusion
### Title: Performance calculation for soft classification
### Aliases: confmat confusion npv ppv sens spec

### ** Examples


ref <- softclassval:::ref
ref

pred <- softclassval:::pred
pred

## Single elements or diagonal of confusion matrix
confusion (r = ref, p = pred)

## complete confusion matrix
cm <- confmat (r = softclassval:::ref, p = pred) [1,,]
cm

## Sensitivity-Specificity matrix:
cm / rowSums (cm)

## Matrix with predictive values:
cm / rep (colSums (cm), each = nrow (cm))

## sensitivities
sens (r = ref, p = pred)

## specificities
spec (r = ref, p = pred)

## predictive values
ppv (r = ref, p = pred)
npv (r = ref, p = pred)



