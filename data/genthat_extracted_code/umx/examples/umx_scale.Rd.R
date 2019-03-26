library(umx)


### Name: umx_scale
### Title: Scale data columns, skipping non-scalable columns
### Aliases: umx_scale

### ** Examples

data(twinData) 
df = umx_scale(twinData, varsToScale = c("wt1", "wt2"))
df = umx_scale(twinData,  attr= TRUE)
plot(wt1 ~ wt2, data = df)



