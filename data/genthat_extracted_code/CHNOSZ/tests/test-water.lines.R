# testing revised water.lines 2017-06-04
context("water.lines")

# change to TRUE to show plots (for additional testing)
plot.it <- FALSE
# change to FALSE to make base plots (for additional testing)
limit.water <- TRUE

# function to count the number of species on a diagram (not including NA fields)
nspecies <- function(a) length(na.omit(unique(as.numeric(diagram(a, limit.water=limit.water, plot.it=plot.it, balance=1)$predominant))))

res <- 25

test_that("water.lines() masks H2 and O2 fields on diagrams with pH as x-axis", {
  if(plot.it) par(mfrow=c(3, 6))
  Ts <- c(25, 100, 25)
  logaH2O <- c(0, 0, -5)
  for(i in 1:3) {
    T <- Ts[i]
    basis(c("H2O", "H+", "e-"), c(logaH2O[i], -7, -7))
    species(c("H2O", "O2", "H2"), c("liq", "gas", "gas"))
    # Eh-pH
    n1 <- nspecies(affinity(pH=c(-2, 16, res), Eh=c(-1, 1.5, res), T=T))
    # pe-pH
    n2 <- nspecies(affinity(pH=c(-2, 16, res), pe=c(-20, 25, res), T=T))
    # logfO2-pH
    swap.basis("e-", "oxygen")
    n3 <- nspecies(affinity(pH=c(-2, 16, res), O2=c(-90, 10, res), T=T))
    # logaO2-pH
    swap.basis("oxygen", "O2")
    n4 <- nspecies(affinity(pH=c(-2, 16, res), O2=c(-90, 10, res), T=T))
    # logfH2-pH
    swap.basis("O2", "hydrogen")
    n5 <- nspecies(affinity(pH=c(-2, 16, res), H2=c(-50, 10, res), T=T))
    # logaH2-pH
    swap.basis("hydrogen", "H2")
    n6 <- nspecies(affinity(pH=c(-2, 16, res), H2=c(-50, 10, res), T=T))
    expect_equal(c(n1, n2, n3, n4, n5, n6), c(1, 1, 1, 1, 1, 1))
  }
})

if(plot.it) par(mfrow=c(3, 6))
basis(c("H2O", "H+", "e-"), c(0, -7, -7))
species(c("H2O", "O2", "H2"), c("liq", "gas", "gas"))
test_that("water.lines() masks H2 and O2 fields on diagrams with T as x-axis", {
  n1 <- nspecies(affinity(T=c(0, 200, res), Eh=c(-1, 1.5, res)))  # Eh-T
  n2 <- nspecies(affinity(T=c(0, 200, res), pe=c(-20, 25, res)))  # pe-T
  swap.basis("e-", "oxygen"); n3 <- nspecies(affinity(T=c(0, 200, res), O2=c(-90, 10, res)))  # logfO2-T
  swap.basis("oxygen", "O2"); n4 <- nspecies(affinity(T=c(0, 200, res), O2=c(-90, 10, res)))  # logaO2-T
  swap.basis("O2", "hydrogen"); n5 <- nspecies(affinity(T=c(0, 200, res), H2=c(-50, 10, res)))  # logfH2-T
  swap.basis("hydrogen", "H2"); n6 <- nspecies(affinity(T=c(0, 200, res), H2=c(-50, 10, res)))  # logaH2-T
  expect_equal(c(n1, n2, n3, n4, n5, n6), c(1, 1, 1, 1, 1, 1))
})
test_that("water.lines() masks H2 and O2 fields on diagrams with P as x-axis", {
  swap.basis("H2", "e-")
  n1 <- nspecies(affinity(P=c(1, 5000, res), Eh=c(-1, 1.5, res)))  # Eh-P
  n2 <- nspecies(affinity(P=c(1, 5000, res), pe=c(-20, 25, res)))  # pe-P
  swap.basis("e-", "oxygen"); n3 <- nspecies(affinity(P=c(1, 5000, res), O2=c(-90, 10, res)))  # logfO2-P
  swap.basis("oxygen", "O2"); n4 <- nspecies(affinity(P=c(1, 5000, res), O2=c(-90, 10, res)))  # logaO2-P
  swap.basis("O2", "hydrogen"); n5 <- nspecies(affinity(P=c(1, 5000, res), H2=c(-50, 10, res)))  # logfH2-P
  swap.basis("hydrogen", "H2"); n6 <- nspecies(affinity(P=c(1, 5000, res), H2=c(-50, 10, res)))  # logaH2-P
  expect_equal(c(n1, n2, n3, n4, n5, n6), c(1, 1, 1, 1, 1, 1))
})
test_that("water.lines() masks H2 and O2 fields on diagrams with T as y-axis", {
  swap.basis("H2", "e-")
  n1 <- nspecies(affinity(Eh=c(-1, 1.5, res), T=c(0, 200, res)))  # T-Eh
  n2 <- nspecies(affinity(pe=c(-20, 25, res), T=c(0, 200, res)))  # T-pe
  swap.basis("e-", "oxygen"); n3 <- nspecies(affinity(O2=c(-90, 10, res), T=c(0, 200, res)))  # T-logfO2
  swap.basis("oxygen", "O2"); n4 <- nspecies(affinity(O2=c(-90, 10, res), T=c(0, 200, res)))  # T-logaO2
  swap.basis("O2", "hydrogen"); n5 <- nspecies(affinity(H2=c(-50, 10, res), T=c(0, 200, res)))  # T-logfH2
  swap.basis("hydrogen", "H2"); n6 <- nspecies(affinity(H2=c(-50, 10, res), T=c(0, 200, res)))  # T-logaH2
  expect_equal(c(n1, n2, n3, n4, n5, n6), c(1, 1, 1, 1, 1, 1))
})
