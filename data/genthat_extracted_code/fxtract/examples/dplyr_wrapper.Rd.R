library(fxtract)


### Name: dplyr_wrapper
### Title: Wrapper for dplyr's summarize
### Aliases: dplyr_wrapper

### ** Examples

# Number of used chrome apps
fun1 = function(data) {
  c(uses_chrome = nrow(
    dplyr::filter(data, RUNNING_TASKS_baseActivity_mPackage == "com.android.chrome"))
  )
}
dplyr_wrapper(data = studentlife_small, group_by = "userId", fun = fun1)

# mean, max, sd of a column
fun2 = function(data) {
  c(mean_sepal_length = mean(data$Sepal.Length),
    max_sepal_length = max(data$Sepal.Length),
    sd_sepal_length = sd(data$Sepal.Length)
  )
}
dplyr_wrapper(data = iris, group_by = "Species", fun = fun2)

# return list
fun3 = function(data) {
  list(mean_sepal_length = mean(data$Sepal.Length),
    max_sepal_length = max(data$Sepal.Length),
    sd_sepal_length = sd(data$Sepal.Length)
  )
}
dplyr_wrapper(data = iris, group_by = "Species", fun = fun3)

# group by two columns
df = data.frame(id = c(rep(1, 10), rep(2, 10)))
df$task = rep(c(rep("task1", 5), rep("task2", 5)), 2)
df$hour = rep(c(rep("hour1", 3), rep("hour2", 2), rep("hour1", 2), rep("hour2", 3)), 2)
df$x = 1:20
fun4 = function(data) c(mean_x = mean(data$x))
dplyr_wrapper(data = df, group_by = c("id", "task"), fun = fun4)




