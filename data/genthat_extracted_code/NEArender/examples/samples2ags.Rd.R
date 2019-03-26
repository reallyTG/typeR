library(NEArender)


### Name: samples2ags
### Title: Create AGS from a raw data matrix.
### Aliases: samples2ags

### ** Examples

data("fantom5.43samples", package="NEArender")
ags.list <- samples2ags(fantom5.43samples, cutoff.q = 0.01, method="significant")



