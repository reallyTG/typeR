library(umx)


### Name: umx_set_cores
### Title: umx_set_cores
### Aliases: umx_set_cores

### ** Examples

library(umx)
manifests = c("mpg", "disp", "gear")
m1 <- mxModel("ind", type = "RAM",
	manifestVars = manifests,
	mxPath(from = manifests, arrows = 2),
	mxPath(from = "one", to = manifests),
	mxData(mtcars[, manifests], type = "raw")
)
umx_set_cores() # print current value
oldCores <- umx_set_cores(silent = TRUE)  # store existing value
umx_set_cores(parallel::detectCores()) # set to max
umx_set_cores(-1); umx_set_cores() # set to max
m1 = umx_set_cores(1, m1)  # set m1 useage to 1 core
umx_set_cores(model = m1)  # show new value for m1
umx_set_cores(oldCores)    # reinstate old global value



