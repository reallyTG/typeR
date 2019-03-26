library(mkin)


### Name: mkinpredict
### Title: Produce predictions from a kinetic model using specific
###   parameters
### Aliases: mkinpredict
### Keywords: manip

### ** Examples

  SFO <- mkinmod(degradinol = list(type = "SFO"))
  # Compare solution types
  mkinpredict(SFO, c(k_degradinol_sink = 0.3), c(degradinol = 100), 0:20,
	      solution_type = "analytical")
  mkinpredict(SFO, c(k_degradinol_sink = 0.3), c(degradinol = 100), 0:20,
	      solution_type = "deSolve")
  mkinpredict(SFO, c(k_degradinol_sink = 0.3), c(degradinol = 100), 0:20,
	      solution_type = "deSolve", use_compiled = FALSE)
  mkinpredict(SFO, c(k_degradinol_sink = 0.3), c(degradinol = 100), 0:20,
	      solution_type = "eigen")


  # Compare integration methods to analytical solution
  mkinpredict(SFO, c(k_degradinol_sink = 0.3), c(degradinol = 100), 0:20,
	      solution_type = "analytical")[21,]
  mkinpredict(SFO, c(k_degradinol_sink = 0.3), c(degradinol = 100), 0:20,
	      method = "lsoda")[21,]
  mkinpredict(SFO, c(k_degradinol_sink = 0.3), c(degradinol = 100), 0:20,
	      method = "ode45")[21,]
  mkinpredict(SFO, c(k_degradinol_sink = 0.3), c(degradinol = 100), 0:20,
	      method = "rk4")[21,]
 # rk4 is not as precise here

  # The number of output times used to make a lot of difference until the
  # default for atol was adjusted
  mkinpredict(SFO, c(k_degradinol_sink = 0.3), c(degradinol = 100),
	      seq(0, 20, by = 0.1))[201,]
  mkinpredict(SFO, c(k_degradinol_sink = 0.3), c(degradinol = 100),
	      seq(0, 20, by = 0.01))[2001,]

  # Check compiled model versions - they are faster than the eigenvalue based solutions!
  SFO_SFO = mkinmod(parent = list(type = "SFO", to = "m1"),
                    m1 = list(type = "SFO"))
  system.time(
    print(mkinpredict(SFO_SFO, c(k_parent_m1 = 0.05, k_parent_sink = 0.1, k_m1_sink = 0.01),
                c(parent = 100, m1 = 0), seq(0, 20, by = 0.1),
                solution_type = "eigen")[201,]))
  system.time(
    print(mkinpredict(SFO_SFO, c(k_parent_m1 = 0.05, k_parent_sink = 0.1, k_m1_sink = 0.01),
                c(parent = 100, m1 = 0), seq(0, 20, by = 0.1),
                solution_type = "deSolve")[201,]))
  system.time(
    print(mkinpredict(SFO_SFO, c(k_parent_m1 = 0.05, k_parent_sink = 0.1, k_m1_sink = 0.01),
                c(parent = 100, m1 = 0), seq(0, 20, by = 0.1),
                solution_type = "deSolve", use_compiled = FALSE)[201,]))



