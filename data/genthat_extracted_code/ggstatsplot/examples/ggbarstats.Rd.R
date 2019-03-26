library(ggstatsplot)


### Name: ggbarstats
### Title: Bar (column) charts with statistical tests
### Aliases: ggbarstats

### ** Examples


# for reproducibility
set.seed(123)

# simple function call with the defaults (with condition)
ggstatsplot::ggbarstats(
  data = datasets::mtcars,
  main = vs,
  condition = cyl,
  bf.message = TRUE,
  nboot = 10,
  labels.legend = c("0 = V-shaped", "1 = straight"),
  legend.title = "Engine"
)
## Not run: 
##D # simple function call with the defaults (with count data)
##D library(jmv)
##D 
##D ggstatsplot::ggbarstats(
##D   data = as.data.frame(HairEyeColor),
##D   main = Eye,
##D   condition = Hair,
##D   counts = Freq
##D )
## End(Not run)



