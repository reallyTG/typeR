library(tidyLPA)


### Name: plot_profiles
### Title: Plot variable means and variances by profile
### Aliases: plot_profiles

### ** Examples

m3 <- estimate_profiles(iris,
    Sepal.Length, Sepal.Width, Petal.Length, Petal.Width,
    n_profiles = 3)
plot_profiles(m3)

m3 <- estimate_profiles(iris,
    Sepal.Length, Sepal.Width, Petal.Length, Petal.Width,
    n_profiles = 3, to_return = "mclust")
plot_profiles(m3, plot_what = "mclust")



