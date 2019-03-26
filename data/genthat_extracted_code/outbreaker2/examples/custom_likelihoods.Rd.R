library(outbreaker2)


### Name: custom_likelihoods
### Title: Customise likelihood functions for outbreaker
### Aliases: custom_likelihoods print.custom_likelihoods

### ** Examples


## specify a null model by disabling all likelihood components
f_null <- function(data, param) {
  return(0.0)
}

null_model <- custom_likelihoods(genetic = f_null,
                                timing_sampling = f_null,
                                timing_infections = f_null,
                                reporting = f_null,
                                contact = f_null)

null_config <- list(find_import = FALSE,
                    n_iter = 200,
                    sample_every = 1)

## load data
x <- fake_outbreak
data <- outbreaker_data(dates = x$sample, dna = x$dna, w_dens = x$w)

res_null <- outbreaker(data = data,
                       config = null_config,
                       likelihoods = null_model)

## visualise ancestries to see if all transmission trees have been explored
plot(res_null, type = "alpha")



