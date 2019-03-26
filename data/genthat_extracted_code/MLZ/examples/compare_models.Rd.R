library(MLZ)


### Name: compare_models
### Title: Model selection
### Aliases: compare_models

### ** Examples

## Not run: 
##D data(Goosefish)
##D goose <- ML(Goosefish, ncp = 0)
##D goose1 <- ML(Goosefish, ncp = 1)
##D goose2 <- ML(Goosefish, ncp = 2, grid.search = TRUE, figure = FALSE)
##D 
##D compare_models(list(goose, goose1, goose2))
##D 
##D data(PRSnapper)
##D ssm <- MLmulti(PRSnapper, ncp = 1, model = "SSM")
##D msm1 <- MLmulti(PRSnapper, ncp = 1, model = "MSM1")
##D msm2 <- MLmulti(PRSnapper, ncp = 1, model = "MSM2")
##D msm3 <- MLmulti(PRSnapper, ncp = 1, model = "MSM3")
##D 
##D compare_models(list(ssm, msm1, msm2, msm3))
## End(Not run)



