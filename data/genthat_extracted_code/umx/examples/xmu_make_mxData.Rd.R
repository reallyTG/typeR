library(umx)


### Name: xmu_make_mxData
### Title: Upgrade a dataframe to an mxData type.
### Aliases: xmu_make_mxData

### ** Examples

manVars = c("mpg", "cyl", "disp")
tmp = xmu_make_mxData(data= mtcars, type = "Auto")
tmp = xmu_make_mxData(data= mtcars, type = "Auto", manifests = manVars)
tmp = xmu_make_mxData(data= mtcars, type = "WLS" , manifests = manVars, verbose= TRUE)

# missing data WLS example
tmp = mtcars; tmp[1, "mpg"] = NA # add NA
tmp = xmu_make_mxData(data= tmp, type = "WLS", manifests = manVars, verbose= TRUE)
tmp = xmu_make_mxData(data= mtcars, type = "cov")
tmp = xmu_make_mxData(data= mtcars, type = "cor")
# pass string through
xmu_make_mxData(data= c("a", "b", "c"), type = "Auto")




