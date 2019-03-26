library(ggstatsplot)


### Name: subtitle_mann_nonparametric
### Title: Making text subtitle for the Mann-Whitney _U_-test
###   (between-subjects designs).
### Aliases: subtitle_mann_nonparametric subtitle_t_nonparametric

### ** Examples

## Not run: 
##D set.seed(123)
##D 
##D # -------------- between-subjects design ------------------------
##D # simple function call
##D ggstatsplot::subtitle_mann_nonparametric(
##D   data = sleep,
##D   x = group,
##D   y = extra
##D )
##D 
##D # creating a smaller dataset
##D msleep_short <- dplyr::filter(
##D   .data = ggplot2::msleep,
##D   vore %in% c("carni", "herbi")
##D )
##D 
##D # modifying few things
##D ggstatsplot::subtitle_mann_nonparametric(
##D   data = msleep_short,
##D   x = vore,
##D   y = sleep_rem,
##D   nboot = 200,
##D   conf.level = 0.99,
##D   conf.type = "bca"
##D )
##D 
##D # The order of the grouping factor matters when computing *V*
##D # Changing default alphabeical order manually
##D msleep_short$vore <- factor(msleep_short$vore,
##D   levels = c("herbi", "carni")
##D )
##D 
##D # note the change in the reported *V* value but the identical
##D # value for *p* and the reversed effect size
##D ggstatsplot::subtitle_mann_nonparametric(
##D   data = msleep_short,
##D   x = vore,
##D   y = sleep_rem
##D )
##D 
##D # -------------- within-subjects design ------------------------
##D # using dataset included in the package
##D ggstatsplot::subtitle_mann_nonparametric(
##D   data = VR_dilemma,
##D   x = modality,
##D   y = score,
##D   paired = TRUE,
##D   conf.level = 0.90,
##D   conf.type = "perc",
##D   nboot = 200,
##D   k = 5
##D )
## End(Not run)



