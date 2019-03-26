library(ggstatsplot)


### Name: grouped_ggbarstats
### Title: Grouped bar (column) charts with statistical tests
### Aliases: grouped_ggbarstats

### ** Examples


## Not run: 
##D # with condition and with count data
##D library(jmv)
##D 
##D ggstatsplot::grouped_ggbarstats(
##D   data = as.data.frame(HairEyeColor),
##D   main = Hair,
##D   condition = Eye,
##D   counts = Freq,
##D   grouping.var = Sex
##D )
##D 
##D # the following will take slightly more amount of time
##D # for reproducibility
##D set.seed(123)
##D 
##D # let's create a smaller dataframe
##D diamonds_short <- ggplot2::diamonds %>%
##D   dplyr::filter(.data = ., cut %in% c("Very Good", "Ideal")) %>%
##D   dplyr::filter(.data = ., clarity %in% c("SI1", "SI2", "VS1", "VS2")) %>%
##D   dplyr::sample_frac(tbl = ., size = 0.05)
##D 
##D # plot
##D ggstatsplot::grouped_ggbarstats(
##D   data = diamonds_short,
##D   main = color,
##D   condition = clarity,
##D   grouping.var = cut,
##D   bf.message = TRUE,
##D   sampling.plan = "poisson",
##D   title.prefix = "Quality",
##D   data.label = "both",
##D   messages = FALSE,
##D   perc.k = 1,
##D   nrow = 2
##D )
## End(Not run)



