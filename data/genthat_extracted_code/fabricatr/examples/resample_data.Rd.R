library(fabricatr)


### Name: resample_data
### Title: Resample data, including hierarchical data
### Aliases: resample_data

### ** Examples


# Resample a dataset of size N without any hierarchy
baseline_survey <- fabricate(N = 50, Y_pre = rnorm(N))
bootstrapped_data <- resample_data(baseline_survey)

# Specify a fixed number of observations to return
baseline_survey <- fabricate(N = 50, Y_pre = rnorm(N))
bootstrapped_data <- resample_data(baseline_survey, N = 100)

# Resample by a single level of a hierarchical dataset (e.g. resampling
# clusters of observations): N specifies a number of clusters to return

clustered_survey <- fabricate(
  clusters = add_level(N=25),
  cities = add_level(N=round(runif(25, 1, 5)),
                     population=runif(n = N, min=50000, max=1000000))
)

cluster_resample <- resample_data(clustered_survey, N = 5, ID_labels = "clusters")

# Alternatively, pass the level to resample as a name:
cluster_resample_2 <- resample_data(clustered_survey, N=c(clusters = 5))

# Resample a hierarchical dataset on multiple levels
my_data <-
fabricate(
  cities = add_level(N = 20, elevation = runif(n = N, min = 1000, max = 2000)),
  citizens = add_level(N = 30, age = runif(n = N, min = 18, max = 85))
)

# Specify the levels you wish to resample:
my_data_2 <- resample_data(my_data, N = c(3, 5),
                           ID_labels = c("cities", "citizens"))

# To resample every unit at a given level, use the ALL constant
# This example will resample 10 citizens at each of the cities:

passthrough_resample_data <- resample_data(my_data, N = c(cities=ALL, citizens=10))

# To ensure a column with unique labels (for example, to calculate block-level
# statistics irrespective of sample choices), use the unique_labels=TRUE
# argument -- this will produce new columns with unique labels.

unique_resample <- resample_data(my_data, N = c(cities=5), unique_labels = TRUE)




