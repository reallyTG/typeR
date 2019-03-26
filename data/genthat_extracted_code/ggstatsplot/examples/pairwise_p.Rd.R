library(ggstatsplot)


### Name: pairwise_p
### Title: Pairwise comparison tests
### Aliases: pairwise_p

### ** Examples


# time consuming, so not run on `CRAN` machines
## Not run: 
##D # show all columns in a tibble
##D options(tibble.width = Inf)
##D 
##D # for reproducibility
##D set.seed(123)
##D 
##D #------------------- between-subjects design ----------------------------
##D 
##D # parametric
##D # if `var.equal = TRUE`, then Student's *t*-test will be run
##D ggstatsplot::pairwise_p(
##D   data = ggplot2::msleep,
##D   x = vore,
##D   y = brainwt,
##D   type = "p",
##D   var.equal = TRUE,
##D   paired = FALSE,
##D   p.adjust.method = "bonferroni"
##D )
##D 
##D # if `var.equal = FALSE`, then Games-Howell test will be run
##D ggstatsplot::pairwise_p(
##D   data = ggplot2::msleep,
##D   x = vore,
##D   y = brainwt,
##D   type = "p",
##D   var.equal = FALSE,
##D   paired = FALSE,
##D   p.adjust.method = "bonferroni"
##D )
##D 
##D # non-parametric
##D ggstatsplot::pairwise_p(
##D   data = ggplot2::msleep,
##D   x = vore,
##D   y = brainwt,
##D   type = "np",
##D   paired = FALSE,
##D   p.adjust.method = "none"
##D )
##D 
##D # robust
##D ggstatsplot::pairwise_p(
##D   data = ggplot2::msleep,
##D   x = vore,
##D   y = brainwt,
##D   type = "r",
##D   paired = FALSE,
##D   p.adjust.method = "fdr"
##D )
## End(Not run)
#------------------- within-subjects design ----------------------------

set.seed(123)
library(jmv)
data("bugs", package = "jmv")

# converting to long format
bugs_long <- bugs %>%
  tibble::as_tibble(.) %>%
  tidyr::gather(., key, value, LDLF:HDHF)

# parametric
ggstatsplot::pairwise_p(
  data = bugs_long,
  x = key,
  y = value,
  type = "p",
  paired = TRUE,
  p.adjust.method = "BH"
)

# non-parametric
ggstatsplot::pairwise_p(
  data = bugs_long,
  x = key,
  y = value,
  type = "np",
  paired = TRUE,
  p.adjust.method = "BY"
)

# robust
ggstatsplot::pairwise_p(
  data = bugs_long,
  x = key,
  y = value,
  type = "r",
  paired = TRUE,
  p.adjust.method = "hommel"
)



