library(enrichwith)


### Name: create_enrichwith_skeleton
### Title: Create a enrichwith skeleton
### Aliases: create_enrichwith_skeleton

### ** Examples

## Not run: 
##D # Set the directory where the skeleton is placed
##D my_path <- "~/Downloads"
##D # This is the call that created the enrichment skeleton for glms
##D # that ships with the package
##D create_enrichwith_skeleton(class = "glm",
##D       option = c("auxiliary functions", "score vector",
##D        "mle of dispersion", "expected information",
##D        "observed information", "first-order bias"),
##D       description = c("various likelihood-based quantities
##D         (gradient of the log-likelihood, expected and observed
##D         information matrix and first term in the expansion of
##D         the bias of the mle) and a simulate method as functions
##D         of the model parameters",
##D        "gradient of the log-likelihood at the mle",
##D        "mle of the dispersion parameter",
##D        "expected information matrix evaluated at the mle",
##D        "observed information matrix evaluated at the mle",
##D        "first term in the expansion of the bias of the mle
##D         at the mle"),
##D       component = list("auxiliary_functions", "score_mle",
##D                        "dispersion_mle",
##D                        "expected_information_mle",
##D                        "observed_information_mle",
##D                        "bias_mle"),
##D       path = my_path,
##D       attempt_rename = FALSE)
##D 
## End(Not run)



