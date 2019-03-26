library(umx)


### Name: umx_make_MR_data
### Title: Simulate Mendelian Randomization data
### Aliases: umx_make_MR_data

### ** Examples

df = umx_make_MR_data(10000)
str(df)
## Not run: 
##D m1 = umxTwoStage(Y ~ X, ~qtl, data = df)
##D plot(m1)
## End(Not run)



