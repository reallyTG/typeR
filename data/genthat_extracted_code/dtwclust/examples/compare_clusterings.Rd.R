library(dtwclust)


### Name: compare_clusterings
### Title: Compare different clustering configurations
### Aliases: compare_clusterings

### ** Examples

# Fuzzy preprocessing: calculate autocorrelation up to 50th lag
acf_fun <- function(series, ...) {
    lapply(series, function(x) {
        as.numeric(acf(x, lag.max = 50, plot = FALSE)$acf)
    })
}

# Define overall configuration
cfgs <- compare_clusterings_configs(
    types = c("p", "h", "f", "t"),
    k = 19L:20L,
    controls = list(
        partitional = partitional_control(
            iter.max = 30L,
            nrep = 1L
        ),
        hierarchical = hierarchical_control(
            method = "all"
        ),
        fuzzy = fuzzy_control(
            # notice the vector
            fuzziness = c(2, 2.5),
            iter.max = 30L
        ),
        tadpole = tadpole_control(
            # notice the vectors
            dc = c(1.5, 2),
            window.size = 19L:20L
        )
    ),
    preprocs = pdc_configs(
        type = "preproc",
        # shared
        none = list(),
        zscore = list(center = c(FALSE)),
        # only for fuzzy
        fuzzy = list(
            acf_fun = list()
        ),
        # only for tadpole
        tadpole = list(
            reinterpolate = list(new.length = 205L)
        ),
        # specify which should consider the shared ones
        share.config = c("p", "h")
    ),
    distances = pdc_configs(
        type = "distance",
        sbd = list(),
        fuzzy = list(
            L2 = list()
        ),
        share.config = c("p", "h")
    ),
    centroids = pdc_configs(
        type = "centroid",
        partitional = list(
            pam = list()
        ),
        # special name 'default'
        hierarchical = list(
            default = list()
        ),
        fuzzy = list(
            fcmdd = list()
        ),
        tadpole = list(
            default = list(),
            shape_extraction = list(znorm = TRUE)
        )
    )
)

# Number of configurations is returned as attribute
num_configs <- sapply(cfgs, attr, which = "num.configs")
cat("\nTotal number of configurations without considering optimizations:",
    sum(num_configs),
    "\n\n")

# Define evaluation functions based on CVI: Variation of Information (only crisp partition)
vi_evaluators <- cvi_evaluators("VI", ground.truth = CharTrajLabels)
score_fun <- vi_evaluators$score
pick_fun <- vi_evaluators$pick

# ====================================================================================
# Short run with only fuzzy clustering
# ====================================================================================

comparison_short <- compare_clusterings(CharTraj, types = c("f"), configs = cfgs,
                                        seed = 293L, trace = TRUE,
                                        score.clus = score_fun, pick.clus = pick_fun,
                                        return.objects = TRUE)

## Not run: 
##D # ====================================================================================
##D # Parallel run with all comparisons
##D # ====================================================================================
##D 
##D require(doParallel)
##D registerDoParallel(cl <- makeCluster(detectCores()))
##D 
##D comparison_long <- compare_clusterings(CharTraj, types = c("p", "h", "f", "t"),
##D                                        configs = cfgs,
##D                                        seed = 293L, trace = TRUE,
##D                                        score.clus = score_fun,
##D                                        pick.clus = pick_fun,
##D                                        return.objects = TRUE)
##D 
##D # Using all external CVIs and majority vote
##D external_evaluators <- cvi_evaluators("external", ground.truth = CharTrajLabels)
##D score_external <- external_evaluators$score
##D pick_majority <- external_evaluators$pick
##D 
##D comparison_majority <- compare_clusterings(CharTraj, types = c("p", "h", "f", "t"),
##D                                            configs = cfgs,
##D                                            seed = 84L, trace = TRUE,
##D                                            score.clus = score_external,
##D                                            pick.clus = pick_majority,
##D                                            return.objects = TRUE)
##D 
##D # best results
##D plot(comparison_majority$pick$object)
##D print(comparison_majority$pick$config)
##D 
##D stopCluster(cl); registerDoSEQ()
##D 
##D # ====================================================================================
##D # A run with only partitional clusterings
##D # ====================================================================================
##D 
##D p_cfgs <- compare_clusterings_configs(
##D     types = "p", k = 19L:21L,
##D     controls = list(
##D         partitional = partitional_control(
##D             iter.max = 20L,
##D             nrep = 8L
##D         )
##D     ),
##D     preprocs = pdc_configs(
##D         "preproc",
##D         none = list(),
##D         zscore = list(center = c(FALSE, TRUE))
##D     ),
##D     distances = pdc_configs(
##D         "distance",
##D         sbd = list(),
##D         dtw_basic = list(window.size = 19L:20L,
##D                          norm = c("L1", "L2")),
##D         gak = list(window.size = 19L:20L,
##D                    sigma = 100)
##D     ),
##D     centroids = pdc_configs(
##D         "centroid",
##D         partitional = list(
##D             pam = list(),
##D             shape = list()
##D         )
##D     )
##D )
##D 
##D # Remove redundant (shape centroid always uses zscore preprocessing)
##D id_redundant <- p_cfgs$partitional$preproc == "none" &
##D     p_cfgs$partitional$centroid == "shape"
##D p_cfgs$partitional <- p_cfgs$partitional[!id_redundant, ]
##D 
##D # LONG! 30 minutes or so, sequentially
##D comparison_partitional <- compare_clusterings(CharTraj, types = "p",
##D                                               configs = p_cfgs,
##D                                               seed = 32903L, trace = TRUE,
##D                                               score.clus = score_fun,
##D                                               pick.clus = pick_fun,
##D                                               shuffle.configs = TRUE,
##D                                               return.objects = TRUE)
## End(Not run)



