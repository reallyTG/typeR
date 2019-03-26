library(ggstatsplot)


### Name: bf_caption_maker
### Title: Prepare caption with bayes factor in favor of null
### Aliases: bf_caption_maker

### ** Examples


set.seed(123)

# dataframe containing results
bf_results <-
  bf_extractor(BayesFactor::correlationBF(
    x = iris$Sepal.Length,
    y = iris$Petal.Length
  )) %>%
  dplyr::mutate(.data = ., bf.prior = 0.707)

# creating caption
ggstatsplot::bf_caption_maker(
  bf.df = bf_results,
  k = 3,
  caption = "Note: Iris dataset"
)



