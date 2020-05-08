library(ggplot2)
library(ggthemes)

theme_set(theme_minimal())


is_outlier_min <- function(x, m=1.5) quantile(x, 0.25) - m * IQR(x)

is_outlier_max <- function(x, m=1.5) quantile(x, 0.75) + m * IQR(x)

is_outlier <- function(x, m=1.5) {
  (x < is_outlier_min(x, m)) | (x > is_outlier_max(x, m))
}

read_parallel_run_csv <- function(path) {
  read_csv(path,
    col_types=cols(
      job = col_character(),
      path = col_character(),
      seq = col_double(),
      host = col_character(),
      starttime = col_datetime(format = ""),
      jobruntime = col_character(),
      send = col_double(),
      receive = col_double(),
      exitval = col_double(),
      signal = col_double(),
      command = col_character(),
      stdout = col_character(),
      stdout_error = col_logical(),
      stderr = col_character(),
      stderr_error = col_logical()
    )
  )
}
