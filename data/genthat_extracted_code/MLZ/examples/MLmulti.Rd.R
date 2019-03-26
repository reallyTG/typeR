library(MLZ)


### Name: MLmulti
### Title: Multispecies mean length mortality estimator
### Aliases: MLmulti

### ** Examples

## Not run: 
##D data(PRSnapper)
##D res_eq <- MLmulti(PRSnapper, ncp = 0, start = list(Z = matrix(0.5, nrow = 1, ncol = 3)))
##D res_SSM <- MLmulti(PRSnapper, ncp = 1, model = "SSM")
##D 
##D MSM1.start.Z <- matrix(0.5, nrow = 2, ncol = 3)
##D MSM1.start.yearZ <- 1990
##D start.list <- list(Z = MSM1.start.Z, yearZ = MSM1.start.yearZ)
##D res_MSM1 <- MLmulti(PRSnapper, ncp = 1, model = "MSM1", start = start.list, grid.search = FALSE)
##D 
##D res_MSM2 <- MLmulti(PRSnapper, ncp = 1, model = "MSM2")
##D 
##D st.Z1 <- rep(0.5, 3)
##D st.yearZ <- 1990
##D st.delta <- 1
##D start.list <- list(Z1 = st.Z1, yearZ = st.yearZ, delta = st.delta)
##D resMSM3 <- MLmulti(PRSnapper, ncp = 1, model = "MSM3", start = start.list)
## End(Not run)



