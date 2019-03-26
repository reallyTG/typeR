library(comperank)


### Name: iterative
### Title: Iterative rating method
### Aliases: iterative rate_iterative rank_iterative add_iterative_ratings

### ** Examples

test_rate_fun <- function(rating1, score1, rating2, score2) {
  c(rating1, rating2) + ((score1 >= score2) * 2 - 1) * c(1, -1)
}
set.seed(1002)
cr_data <- data.frame(
  game = rep(1:10, each = 2),
  player = rep(1:5, times = 4),
  score = runif(20)
)
cr_data$player[c(6, 8)] <- NA

# Different settings of add_iterative_ratings
add_iterative_ratings(cr_data, test_rate_fun)

add_iterative_ratings(cr_data, test_rate_fun, initial_ratings = 10)

add_iterative_ratings(
  cr_data, test_rate_fun,
  initial_ratings = c("1" = 1, "2" = 2, "3" = 3, "4" = 4, "5" = 5)
)

add_iterative_ratings(
  cr_data, test_rate_fun,
  initial_ratings = data.frame(1:5, 0:4)
)

# Ratings and ranking at the end of competition results.
rate_iterative(cr_data, test_rate_fun)

rank_iterative(cr_data, test_rate_fun, type = "desc")

rank_iterative(cr_data, test_rate_fun, type = "desc", keep_rating = TRUE)




