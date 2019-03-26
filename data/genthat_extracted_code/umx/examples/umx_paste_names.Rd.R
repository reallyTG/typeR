library(umx)


### Name: umx_paste_names
### Title: Concatenate base variable names with suffixes to create
###   wide-format variable names (i.e twin-format)
### Aliases: umx_paste_names tvars

### ** Examples

# two styles doing the same thing: first is more general
umx_paste_names("bmi", suffixes = c("_T1", "_T2"))
umx_paste_names("bmi", sep = "_T", suffixes = 1:2)
varNames = umx_paste_names(c("N", "E", "O", "A", "C"), "_T", 1:2)
umx_paste_names(c("IQ", "C"), cov = c("age"), sep = "_T", suffixes = 1:2)
umx_paste_names(c("IQ", "C"), cov = c("age"), sep = "_T", prefix= "mean_")
# For quick-typing, tvars is an alias for umx_paste_names
tvars(c("IQ", "C"), cov = c("age"), sep = "_T", prefix= "mean_")



