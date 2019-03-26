library(ggstatsplot)


### Name: subtitle_anova_robust
### Title: Making text subtitle for the robust ANOVA (between-subjects
###   designs).
### Aliases: subtitle_anova_robust

### ** Examples


# examples not executed due to time constraints
## Not run: 
##D # for reproducibility
##D set.seed(123)
##D 
##D # going with the defaults
##D subtitle_anova_robust(
##D   data = ggplot2::midwest,
##D   x = state,
##D   y = percbelowpoverty,
##D   nboot = 10
##D )
##D 
##D # changing defaults
##D subtitle_anova_robust(
##D   data = ggplot2::midwest,
##D   x = state,
##D   y = percollege,
##D   tr = 0.2,
##D   nboot = 10
##D )
## End(Not run)



