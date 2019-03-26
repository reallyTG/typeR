library(umx)


### Name: umx_scale_wide_twin_data
### Title: umx_scale_wide_twin_data
### Aliases: umx_scale_wide_twin_data

### ** Examples

data(twinData) 
df = umx_scale_wide_twin_data(data = twinData, varsToScale = c("ht", "wt"), sep = "" )
plot(wt1 ~ wt2, data = df)



