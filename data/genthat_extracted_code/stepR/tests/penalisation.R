# penalisation sqrt
penalisationSqrt <- function(stat, n, len) {
  sqrt(2 * stat) - sqrt(2 * log(exp(1) * n / len))
}

# penalisation log
penalisationLog <- function(stat, n, len) {
  stat - log(exp(1) * n / len)
}