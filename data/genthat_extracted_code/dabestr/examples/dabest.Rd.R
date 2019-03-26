library(dabestr)


### Name: dabest
### Title: Differences between Groups with Bootstrap Confidence Intervals
### Aliases: dabest

### ** Examples

# Performing unpaired (two independent groups) analysis.
unpaired_mean_diff <- dabest(iris, Species, Petal.Width,
                             idx = c("setosa", "versicolor"),
                             paired = FALSE)

# Display the results in a user-friendly format.
unpaired_mean_diff

# Produce an estimation plot.
plot(unpaired_mean_diff)


# Performing paired analysis.
# First, we munge the `iris` dataset so we can perform a within-subject
# comparison of sepal length vs. sepal width.

new.iris     <- iris
new.iris$ID  <- 1: length(new.iris)
setosa.only  <-
  new.iris %>%
  tidyr::gather(key = Metric, value = Value, -ID, -Species) %>%
  dplyr::filter(Species %in% c("setosa"))

paired_mean_diff          <- dabest(
                              setosa.only, Metric, Value,
                              idx = c("Sepal.Length", "Sepal.Width"),
                              paired = TRUE, id.col = ID
                              )

## No test: 
# Computing the median difference.
unpaired_median_diff      <- dabest(
                              iris, Species, Petal.Width,
                              idx = c("setosa", "versicolor", "virginica"),
                              paired = FALSE,
                              func = median
                              )


# Producing a 90% CI instead of 95%.
unpaired_mean_diff_90_ci  <- dabest(
                              iris, Species, Petal.Width,
                              idx = c("setosa", "versicolor", "virginica"),
                              paired = FALSE,
                              ci = 0.90
                              )


# Using pipes to munge your data and then passing to `dabest`.
# First, we generate some synthetic data.
set.seed(12345)
N        <- 70
c         <- rnorm(N, mean = 50, sd = 20)
t1        <- rnorm(N, mean = 200, sd = 20)
t2        <- rnorm(N, mean = 100, sd = 70)
long.data <- tibble::tibble(Control = c, Test1 = t1, Test2 = t2)

# Munge the data using `gather`, then pass it directly to `dabest`

meandiff <- long.data %>%
              tidyr::gather(key = Group, value = Measurement) %>%
              dabest(x = Group, y = Measurement,
                     idx = c("Control", "Test1", "Test2"),
                     paired = FALSE)
## End(No test)





