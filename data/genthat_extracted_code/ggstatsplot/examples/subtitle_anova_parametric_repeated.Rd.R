library(ggstatsplot)


### Name: subtitle_anova_parametric_repeated
### Title: Making text subtitle for the within-subject anova designs.
### Aliases: subtitle_anova_parametric_repeated
### Keywords: internal

### ** Examples

## Not run: 
##D # setup
##D set.seed(123)
##D library(ggstatsplot)
##D library(jmv)
##D data("bugs", package = "jmv")
##D 
##D # converting to long format
##D data_bugs <- bugs %>%
##D   dplyr::filter(., !is.na(LDHF) & !is.na(LDLF) & !is.na(HDLF) & !is.na(HDHF)) %>%
##D   tibble::as_tibble(.) %>%
##D   tidyr::gather(., key, value, LDLF:HDHF)
##D 
##D # creating the subtitle
##D ggstatsplot:::subtitle_anova_parametric_repeated(
##D   data = data_bugs,
##D   x = key,
##D   y = value,
##D   id.variable = Subject,
##D   k = 2
##D )
## End(Not run)



