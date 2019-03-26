library(psychmeta)


### Name: reshape_wide2long
### Title: Reshape database from wide format to long format
### Aliases: reshape_wide2long

### ** Examples

n_params = c(mean = 150, sd = 20)
rho_params <- list(c(.1, .3, .5),
                   c(mean = .3, sd = .05),
                   rbind(value = c(.1, .3, .5), weight = c(1, 2, 1)))
rel_params = list(c(.7, .8, .9),
                  c(mean = .8, sd = .05),
                  rbind(value = c(.7, .8, .9), weight = c(1, 2, 1)))
sr_params = c(list(1, 1, c(.5, .7)))
sr_composite_params = list(1, c(.5, .6, .7))
wt_params = list(list(c(1, 2, 3),
                      c(mean = 2, sd = .25),
                      rbind(value = c(1, 2, 3), weight = c(1, 2, 1))),
                 list(c(1, 2, 3),
                      c(mean = 2, sd = .25),
                      rbind(value = c(1, 2, 3), weight = c(1, 2, 1))))

## Simulate with wide format
data <- simulate_r_database(k = 10, n_params = n_params, rho_params = rho_params,
                          rel_params = rel_params, sr_params = sr_params,
                          sr_composite_params = sr_composite_params, wt_params = wt_params,
                          var_names = c("X", "Y", "Z"), format = "wide")$statistics

## Define values to abstract from the data object
common_vars <- "sample_id"
es_design <- matrix(NA, 3, 3)
var_names <- c("X", "Y", "Z")
es_design[lower.tri(es_design)] <- c("rxyi_X_Y", "rxyi_X_Z", "rxyi_Y_Z")
rownames(es_design) <- colnames(es_design) <- var_names
n_design <- "ni"
other_design <- cbind(rxxi = paste0("parallel_rxxi_", var_names),
                      ux_local = paste0("ux_local_", var_names),
                      ux_external = paste0("ux_external_", var_names))
rownames(other_design) <- var_names

## Reshape the data to "long" format
reshape_wide2long(data = data, common_vars = common_vars, es_design = es_design,
                           n_design = n_design, other_design = other_design)



