library(ggstatsplot)


### Name: effsize_t_parametric
### Title: Calculating Cohen's _d_ or Hedge's _g_ (for between-/within- or
###   one sample designs).
### Aliases: effsize_t_parametric
### Keywords: internal

### ** Examples

## Not run: 
##D #---------------- two-sample test ------------------------------------
##D 
##D # creating a smaller dataset
##D msleep_short <- dplyr::filter(
##D   .data = ggplot2::msleep,
##D   vore %in% c("carni", "herbi")
##D )
##D 
##D # with defaults
##D tobj1 <- t.test(
##D   formula = sleep_rem ~ vore,
##D   data = msleep_short
##D )
##D ggstatsplot:::effsize_t_parametric(
##D   formula = sleep_rem ~ vore,
##D   data = msleep_short,
##D   tobject = tobj1
##D )
##D 
##D # changing defaults
##D tobj2 <- t.test(
##D   formula = sleep_rem ~ vore,
##D   data = msleep_short,
##D   mu = 1,
##D   paired = FALSE,
##D   conf.level = .99
##D )
##D ggstatsplot:::effsize_t_parametric(
##D   formula = sleep_rem ~ vore,
##D   data = msleep_short,
##D   mu = 1, # ignored in this case
##D   paired = FALSE,
##D   hedges.correction = TRUE,
##D   conf.level = .99,
##D   noncentral = FALSE,
##D   tobject = tobj2
##D )
##D 
##D #---------------- one-sample test ------------------------------------
##D 
##D tobj3 <- t.test(
##D   x = msleep_short$sleep_rem,
##D   mu = 2,
##D   conf.level = .90
##D )
##D ggstatsplot:::effsize_t_parametric(
##D   formula = ~sleep_rem,
##D   data = msleep_short,
##D   mu = 2,
##D   hedges.correction = TRUE,
##D   conf.level = .90,
##D   noncentral = TRUE,
##D   tobject = tobj3
##D )
## End(Not run)



