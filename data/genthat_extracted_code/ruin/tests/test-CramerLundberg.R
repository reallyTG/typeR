context("CramerLundberg")

skip("Tests take too much time to simulate.")

# ruin_probability()
#-------------------------------------------------------------------------------

# exact ruin probabilities from paper [1]

exact_probabilities <- data.frame(
  time_horizon = c(
    rep(100, 10),
    rep(1000, 15) # ,
    # rep(10000, 20)
  ),
  initial_capital = c(
    rep(0, 5), rep(100, 5),
    rep(0, 5), rep(100, 5), rep(1000, 5) # ,
    # rep(0, 5), rep(100, 5), rep(1000, 5), rep(10000, 5)
  ),

  premium_rate = rep(
    c(0.9, 0.95, 1, 1.05, 1.1),
    times = 5
    # times = 9
  ),

  probability = c(
    0.97908, 0.96398, 0.94360, 0.91852, 0.88997,
    0.00000, 0.00000, 0.00000, 0.00000, 0.00000,
    0.99976, 0.99695, 0.98210, 0.94939, 0.90882,
    0.57207, 0.18715, 0.02749, 0.00186, 0.00007,
    0.00000, 0.00000, 0.00000, 0.00000, 0.00000 #,
    # 1.00000, 0.99997, 0.99433, 0.95235, 0.90906,
    # 1.00000, 0.99933, 0.47622, 0.00814, 0.00010,
    # 0.52380, 0.00031, 0.00000, 0.00000, 0.00000,
    # 0.00000, 0.00000, 0.00000, 0.00000, 0.00000
  )

)

for(i in 1:nrow(exact_probabilities)) {
  model <- CramerLundberg(
    initial_capital = exact_probabilities[i, "initial_capital"],
    premium_rate = exact_probabilities[i, "premium_rate"],
    claim_poisson_arrival_rate = 1,
    claim_size_generator = rexp,
    claim_size_parameters = list(rate = 1)
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

# exact ruin probabilities from paper [2]

exact_probabilities <- data.frame(
  time_horizon = c(rep(10, 10), rep(100, 10)),
  initial_capital = rep(c(rep(0, 5), rep(10, 5)), 2),
  premium_rate = rep(c(0, 0.1, 0.9, 1, 1.1), 4),
  probability = c(
    0.999999, 0.999962, 0.858597, 0.822716, 0.785428,
    0.479780, 0.401569, 0.055613, 0.042251, 0.031984,
    0.999995, 0.999989, 0.979087, 0.943611, 0.889980,
    0.999641, 0.999910, 0.671573, 0.447682, 0.260392
  )
)

for(i in 1:nrow(exact_probabilities)) {

  model <- CramerLundberg(
    initial_capital = exact_probabilities[i, "initial_capital"],
    premium_rate = exact_probabilities[i, "premium_rate"],
    claim_poisson_arrival_rate = 1,
    claim_size_generator = rexp,
    claim_size_parameters = list(rate = 1)
  )

  rp <- ruin_probability(model = model,
                         time_horizon = exact_probabilities[i, "time_horizon"],
                         simulation_number = 10000)

  test_that(
    paste0("initial_capital: ", exact_probabilities[i, "initial_capital"],
           ", premium_rate: ", exact_probabilities[i, "premium_rate"],
           ", time_horizon: ", exact_probabilities[i, "time_horizon"],
           ". A simulated probability is close to the exact one."),
    skip_on_cran(),
    skip_on_travis(),
    expect_true(
      abs(rp$ruin_probability["estimate"] -
            exact_probabilities[i, "probability"]) < 0.025
    )
  )

}

#-------------------------------------------------------------------------------

# References:
# [1] Thorin O., Wikstad N., 1973, Numerical evaluation of ruin probabilities
#     for a finite period, Astin Bulletin.
#
# [2] Breuer L., Badescu A.L., 2011, A generalised Gerber–Shiu measure for
#     Markov-additive risk processes with phase-type claims and capital
#     injections, Scandinavian Actuarial Journal.
