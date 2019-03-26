library(weibulltools)


### Name: mixture_em_cpp
### Title: EM-Algorithm using Newton-Raphson Method
### Aliases: mixture_em_cpp

### ** Examples

# Data is taken from given reference:
hours <- c(2, 28, 67, 119, 179, 236, 282, 317, 348, 387, 3, 31, 69, 135,
          191, 241, 284, 318, 348, 392, 5, 31, 76, 144, 203, 257, 286,
          320, 350, 412, 8, 52, 78, 157, 211, 261, 298, 327, 360, 446,
          13, 53, 104, 160, 221, 264, 303, 328, 369, 21, 64, 113, 168,
          226, 278, 314, 328, 377)
state <- c(1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1,
         1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0,
         1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1,
         0, 1, 1, 1, 1, 1, 1)
post_dirichlet <- LearnBayes::rdirichlet(n = length(hours),
                                         par = rep(.1, 2))
mix_mod_em <- mixture_em_cpp(x = hours,
                             event = state,
                             post = post_dirichlet,
                             distribution = "weibull",
                             k = 2,
                             method = "EM",
                             n_iter = 150)




