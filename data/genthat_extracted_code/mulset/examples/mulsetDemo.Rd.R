library(mulset)


### Name: mulsetDemo
### Title: Demo data set from mulset package. This data is used in this
###   package examples. It consist of 4x4 feature matrix + additional dummy
###   columns that can be used for testing.
### Aliases: mulsetDemo
### Keywords: datasets

### ** Examples

data(mulsetDemo)
print(head(mulsetDemo))
resamples <- mulset(mulsetDemo, exclude = c("outcome", "age", "gender"))




