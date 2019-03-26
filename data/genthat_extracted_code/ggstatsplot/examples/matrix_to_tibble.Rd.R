library(ggstatsplot)


### Name: matrix_to_tibble
### Title: Convert a matrix to a tibble dataframe.
### Aliases: matrix_to_tibble
### Keywords: internal

### ** Examples

set.seed(123)
cor_df <- cor(purrr::keep(iris, is.numeric))
ggstatsplot:::matrix_to_tibble(cor_df)



