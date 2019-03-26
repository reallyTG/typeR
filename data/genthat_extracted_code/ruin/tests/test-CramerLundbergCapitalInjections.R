context("CramerLundberg")

skip("Tests take too much time to simulate.")

# ruin_probability()
#-------------------------------------------------------------------------------

# exact ruin probabilities from paper [1]

exact_probabilities <- data.frame(
  time_horizon = c(rep(10, 10), rep(100, 10)),
  initial_capital = rep(c(rep(0, 5), rep(10, 5)), 2),
  premium_rate = rep(c(0, 0.1, 0.9, 1, 1.1), 4),
  probability = c(0.872239, 0.846041, 0.605712, 0.578405, 0.552538,
                  0.086230, 0.067593, 0.008527, 0.006604, 0.008142,
                  0.960050, 0.930334, 0.616260, 0.585779, 0.557662,
                  0.581408, 0.423523, 0.013280, 0.009308, 0.006685)
)

for(i in 1:nrow(exact_probabilities)) {

  model <- CramerLundbergCapitalInjections(
    initial_capital = exact_probabilities[i, "initial_capital"],
    premium_rate = exact_probabilities[i, "premium_rate"],
    claim_poisson_arrival_rate = 1,
    claim_size_generator = rexp,
    claim_size_parameters = list(rate = 1),
    capital_injection_poisson_rate = 1,
    capital_injection_size_generator = rexp,
    capital_injection_size_parameters = list(rate = 1)
  )

  rp <- ruin_probability(model = model,
                         time_horizon = exact_probabilities[i, "time_horizon"],
                         simulation_number = 10000)

  test_that(
    paste0("initial_capital: ", exact_probabilities[i, "initial_capital"],
           ", premium_rate: ", exact_probabilities[i, "premium_rate"],
           ", time_horizon: ", exact_probabilities[i, "time_horizon"],
           ". A simulated probability is close to the exact one."),
    expect_true(
      abs(rp$ruin_probability["estimate"] -
            exact_probabilities[i, "probability"]) < 0.025
    )
  )

}

# References:
# [1] Breuer L., Badescu A.L., 2011, A generalised Gerber–Shiu measure for
#     Markov-additive risk processes with phase-type claims and capital
#     injections, Scandinavian Actuarial Journal.
