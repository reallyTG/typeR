library(tibbletime)


### Name: rollify
### Title: Create a rolling version of any function
### Aliases: rollify

### ** Examples


# Rolling mean --------------------------------------------------------------

data(FB)

# Turn the normal mean function into a rolling mean with a 5 row window
mean_roll_5 <- rollify(mean, window = 5)

dplyr::mutate(FB,
       normal_mean  = mean(adjusted),
       rolling_mean = mean_roll_5(adjusted))

# There's nothing stopping you from combining multiple rolling functions with
# different window sizes in the same mutate call
mean_roll_10 <- rollify(mean, window = 10)

dplyr::mutate(FB,
       rolling_mean_5  = mean_roll_5(adjusted),
       rolling_mean_10 = mean_roll_10(adjusted))

# Functions with multiple args and optional args ----------------------------

# With 2 args, use the purrr syntax of ~ and .x, .y
# Rolling correlation example
cor_roll <- rollify(~cor(.x, .y), window = 5)

dplyr::mutate(FB, running_cor = cor_roll(adjusted, open))

# With >2 args, create an anonymous function with >2 args or use
# the purrr convention of ..1, ..2, ..3 to refer to the arguments
avg_of_avgs <- rollify(function(x, y, z) {
                         (mean(x) + mean(y) + mean(z)) / 3
                       },
                       window = 10)

# Or
avg_of_avgs <- rollify(~(mean(..1) + mean(..2) + mean(..3)) / 3,
                       window = 10)

dplyr::mutate(FB, avg_of_avgs = avg_of_avgs(open, high, low))

# Optional arguments MUST be passed at the creation of the rolling function
# Only data arguments that are "rolled over" are allowed when calling the
# rolling version of the function
FB$adjusted[1] <- NA

roll_mean_na_rm <- rollify(~mean(.x, na.rm = TRUE), window = 5)

dplyr::mutate(FB, roll_mean = roll_mean_na_rm(adjusted))

# Returning multiple values -------------------------------------------------

data(FB)

# If the function returns >1 value, set the `unlist = FALSE` argument
# Running 5 number summary
summary_roll <- rollify(summary, window = 5, unlist = FALSE)

FB_summarised <- dplyr::mutate(FB, summary_roll = summary_roll(adjusted))
FB_summarised$summary_roll[[5]]

# dplyr::bind_rows() is often helpful in these cases to get
# meaningful output

summary_roll <- rollify(~dplyr::bind_rows(summary(.)), window = 5, unlist = FALSE)
FB_summarised <- dplyr::mutate(FB, summary_roll = summary_roll(adjusted))
FB_summarised %>%
  dplyr::filter(!is.na(summary_roll)) %>%
  tidyr::unnest(summary_roll)

# Rolling regressions -------------------------------------------------------

# Extending an example from R 4 Data Science on "Many Models".
# For each country in the gapminder data, calculate a linear regression
# every 5 periods of lifeExp ~ year
library(gapminder)

# Rolling regressions are easy to implement
lm_roll <- rollify(~lm(.x ~ .y), window = 5, unlist = FALSE)

gapminder %>%
  dplyr::group_by(country) %>%
  dplyr::mutate(rolling_lm = lm_roll(lifeExp, year))

# Rolling with groups -------------------------------------------------------

# One of the most powerful things about this is that it works with
# groups since `mutate` is being used
data(FANG)
FANG <- FANG %>%
  dplyr::group_by(symbol)

mean_roll_3 <- rollify(mean, window = 3)

FANG %>%
  dplyr::mutate(mean_roll = mean_roll_3(adjusted)) %>%
  dplyr::slice(1:5)




