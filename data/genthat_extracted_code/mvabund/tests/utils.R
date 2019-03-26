gen_gamma <- function(n, shape, rates) {
  sapply(rates, function(rate) rgamma(n, shape, rate))
}
gen_pois <- function(n, m, how_many = 5) {
  replicate(how_many, rpois(n, m))
}
