library(neurobase)


### Name: slice_colour_df
### Title: Slice a Image Color Data.frame
### Aliases: slice_colour_df

### ** Examples

img = nifti(array(rnorm(10^3), dim = rep(10, 3)))
df = img_colour_df(img)
sliced = slice_colour_df(df, c(5, 5, 4))



