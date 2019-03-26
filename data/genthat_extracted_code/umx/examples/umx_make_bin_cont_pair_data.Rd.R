library(umx)


### Name: umx_make_bin_cont_pair_data
### Title: Make pairs of bin & continuous columns to represent censored
###   data
### Aliases: umx_make_bin_cont_pair_data

### ** Examples

df = umx_make_bin_cont_pair_data(mtcars, vars = c("mpg"))
str(df)
df[order(df$mpg), c(1,12)]
# Introduce a floor effect
tmp = mtcars; tmp$mpg[tmp$mpg<=15]=15
tmp$mpg_T1 = tmp$mpg_T2 = tmp$mpg
df = umx_make_bin_cont_pair_data(tmp, vars = c("mpg"), suffixes = c("_T1", "_T2"))
df[order(df$mpg), 12:15]



