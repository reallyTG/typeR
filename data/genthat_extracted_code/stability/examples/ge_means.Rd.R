library(stability)


### Name: ge_means
### Title: Genotype by Environment Interaction Means and Ranks
### Aliases: ge_means ge_means.default

### ** Examples


data(ge_data)

Yield.ge_means <-
          ge_means(
                .data  = ge_data
               , .y    = Yield
               , .gen  = Gen
               , .env  = Env
               )

Yield.ge_means$ge_means
Yield.ge_means$ge_ranks
Yield.ge_means$g_means
Yield.ge_means$e_means





