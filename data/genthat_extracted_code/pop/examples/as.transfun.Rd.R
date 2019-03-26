library(pop)


### Name: as.transfun
### Title: create a transition function
### Aliases: as.transfun

### ** Examples

# a very simple (and unnecessary, see ?p) transfun
fun <- function(landscape) param$prob
prob <- as.transfun(fun, param = c(prob = 0.3), type = 'probability')

# a density-dependent probability
dd_fun <- function (landscape) {
    adult_density <- population(landscape, 'adult') / area(landscape)
    param$p * exp(- adult_density/param$range)
}

dd_prob <- as.transfun(dd_fun,
                       param = list(p = 0.8,
                                    range = 10),
                       type = 'probability')




