library(phonTools)


### Name: imputeformants
### Title: Impute Missing Formant Values
### Aliases: imputeformants

### ** Examples

data (h95)

## Select F2 values from the tenth speaker in H95 data
## set the first 5 values to "missing"
ffs = h95$f2
ffs[h95$speaker == 10][1:5] = 0
speaker = h95$speaker
vowel = h95$vowel

## impute these missing values
imputedf2 = imputeformants (ffs, speaker, vowel)

## resulting in a very close approximation of the original values
plot (imputedf2[h95$speaker == 10], h95$f2[h95$speaker == 10])
abline (0, 1, col = 2)



