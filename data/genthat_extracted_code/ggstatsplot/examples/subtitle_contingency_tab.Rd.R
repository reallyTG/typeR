library(ggstatsplot)


### Name: subtitle_contingency_tab
### Title: Making text subtitle for contingency analysis (Pearson's
###   chi-square test for independence for between-subjects design or
###   McNemar's test for within-subjects design)
### Aliases: subtitle_contingency_tab

### ** Examples


# without counts data
subtitle_contingency_tab(
  data = mtcars,
  main = am,
  condition = cyl,
  nboot = 15
)

# with counts data
# in case of no variation, a `NULL` will be returned.
library(jmv)

as.data.frame(HairEyeColor) %>%
  dplyr::filter(.data = ., Sex == "Male") %>%
  subtitle_contingency_tab(
    data = .,
    main = Hair,
    condition = Sex,
    counts = Freq
  )



