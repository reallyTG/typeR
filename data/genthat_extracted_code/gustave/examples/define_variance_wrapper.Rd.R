library(gustave)


### Name: define_variance_wrapper
### Title: Define a variance estimation wrapper
### Aliases: define_variance_wrapper

### ** Examples

### Example from the Labour force survey (LFS)

# The (simulated) Labour force survey (LFS) has the following characteristics:
# - first sampling stage: balanced sampling of 4 areas (each corresponding to 
#   about 120 dwellings) on first-order probability of inclusion (proportional to 
#   the number of dwellings in the area) and total annual income in the area.
# - second sampling stage: in each sampled area, simple random sampling of 20 
#   dwellings
# - neither non-response nor calibration

# As this is a multi-stage sampling design with balanced sampling at the first
# stage, the qvar function does not apply. A variance wrapper can nonetheless
# be defined using the core define_variance_wrapper function.

# Step 1 : Definition of the variance function and the corresponding technical data

# In this context, the variance estimation function specific to the LFS 
# survey can be defined as follows:

var_lfs <- function(y, ind, dwel, area){
  
  variance <- list()
  
  # Variance associated with the sampling of the dwellings
  y <- sum_by(y, ind$id_dwel)
  variance[["dwel"]] <- var_srs(
    y = y, pik = dwel$pik_dwel, strata = dwel$id_area, 
    w = (1 / dwel$pik_area^2 - dwel$q_area)
  )
  
  # Variance associated with the sampling of the areas
  y <- sum_by(y = y, by = dwel$id_area, w = 1 / dwel$pik_dwel) 
  variance[["area"]] <- varDT(y = y, precalc = area)
  
  Reduce(`+`, variance)
  
}

# where y is the matrix of variables of interest and ind, dwel and area the technical data:

technical_data_lfs <- list()

# Technical data at the area level
# The varDT function allows for the pre-calculation of 
# most of the methodological quantities needed.
technical_data_lfs$area <- varDT(
  y = NULL, 
  pik = lfs_samp_area$pik_area, 
  x = as.matrix(lfs_samp_area[c("pik_area", "income")]),
  id = lfs_samp_area$id_area
)

# Technical data at the dwelling level
# In order to implement Rao (1975) formula for two-stage samples,
# we associate each dwelling with the diagonal term corresponding 
# to its area in the first-stage variance estimator: 
lfs_samp_dwel$q_area <- with(technical_data_lfs$area, setNames(diago, id))[lfs_samp_dwel$id_area]
technical_data_lfs$dwel <- lfs_samp_dwel[c("id_dwel", "pik_dwel", "id_area", "pik_area", "q_area")]

# Technical data at the individual level
technical_data_lfs$ind <- lfs_samp_ind[c("id_ind", "id_dwel", "sampling_weight")]

# Test of the variance function var_lfs
y <- matrix(as.numeric(lfs_samp_ind$unemp), ncol = 1, dimnames = list(lfs_samp_ind$id_ind))
with(technical_data_lfs, var_lfs(y = y, ind = ind, dwel = dwel, area = area))


# Step 2 : Definition of the variance wrapper

# Call of define_variance_wrapper
precision_lfs <- define_variance_wrapper(
  variance_function = var_lfs,
  technical_data = technical_data_lfs, 
  reference_id = technical_data_lfs$ind$id_ind,
  reference_weight = technical_data_lfs$ind$sampling_weight,
  default_id = "id_ind"
)

# Test
precision_lfs(lfs_samp_ind, unemp)

# The variance wrapper precision_lfs has the same features
# as variance wrappers produced by the qvar function (see
# qvar examples for more details).




