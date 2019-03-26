library(ggstatsplot)


### Name: subtitle_anova_bayes
### Title: Making text subtitle for the between-subject one-way anova
###   designs.
### Aliases: subtitle_anova_bayes

### ** Examples

## Not run: 
##D # with defaults
##D subtitle_anova_bayes(
##D   data = ggplot2::msleep,
##D   x = vore,
##D   y = sleep_rem,
##D   k = 2,
##D   bf.prior = 0.8
##D )
##D 
##D # modifying the defaults
##D subtitle_anova_bayes(
##D   data = ggplot2::msleep,
##D   x = vore,
##D   y = sleep_rem,
##D   effsize.type = "partial_eta",
##D   var.equal = TRUE
##D )
## End(Not run)



