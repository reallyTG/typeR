# Test data-generating functions

eqnfile <- system.file("MPTmodels/2htm.eqn", package="TreeBUGS")
model <- "# 2HTM
Target    Hit    Do
Target    Hit    (1-Do)*g
Target    Miss   (1-Do)*(1-g)
Lure      FA     (1-Dn)*g
Lure      CR     (1-Dn)*(1-g)
Lure      CR     Dn
"

n <- 1e7
par <- c(Do=.6, Dn=.4, g=.55)
# undebug(genMPT)


test_that('genData generates expected frequencies for simple models', {

  exp <- c((1-par["Dn"])*par["g"],  # FA
           par["Do"] + (1-par["Do"])*par["g"])  # Hit
  names(exp) <- NULL

  # EQN file
  d <- genMPT(par, c(Lure=n, Target=n), eqnfile)
  expect_equal(d[2:3]/n,  exp, tolerance=.01)

  # string model
  d <- genMPT(par, c(Lure=n, Target=n), model)
  expect_equal(d[2:3]/n,  exp, tolerance=.01)

  # naming errors expected:
  expect_warning(genMPT(par, c(n, n), model))
  expect_warning(genMPT(c(.1,.4,.2), c(Lure=n, Target=n), model))

  # errors due to misspecifiation:
  expect_error(genMPT(c(.1,.4), c(Lure=n, Target=n), model, warning=FALSE))
  expect_error(genMPT(c(.1,.4,.4), c(Lure=n), model, warning=FALSE))
})


test_that('genData generates expected frequencies for constrained models', {

  e2 <- c((1-par["Dn"])*.5,  # FA
          par["Dn"] + (1-par["Dn"])*.5)  # Hit
  names(e2) <- NULL
  d <- genMPT(par["Dn"], c(Lure=n, Target=n),
              eqnfile, restrictions = list("g=.5", "Dn=Do"))
  expect_equal(d[2:3]/n,  e2, tolerance=.05)

  # naming errors expected:
  expect_warning(genMPT(c(.1,.4), c(Lure=n, Target=n),
                        model, restrictions = list("g=.5")))

  # errors due to misspecifiation:
  expect_error(genMPT(c(.1), c(Lure=n, Target=n), model,
                      restrictions = list("Dn=Do"), warning=FALSE))
  expect_error(genMPT(c(.1,.2), c(Lure=n, Target=n), model,
                      restrictions = list("Dn=sdsa"), warning=FALSE))
  expect_error(suppressWarnings(genMPT(c(.1,.2), c(Lure=n, Target=n), model,
                      restrictions = list("Dn=1.3"), warning=FALSE)))
  expect_error(suppressWarnings(genMPT(c(.1,.2), c(Lure=n, Target=n), model,
                                       restrictions = list("Dn=-1"), warning=FALSE)))
  expect_error(genMPT(c(.1), c(Lure=n), model, warning=FALSE))
  expect_error(genMPT(c(.1,.2,.4), c(Lure=n), model,
                      restrictions = list("g=.5"), warning=FALSE))
})


test_that("genTraitMPT generates proper data", {

  N <- 100
  mean <- c(Dn=.3, Do=.6)
  sigma <- c(Dn=.2,Do=.5)
  rho <- matrix(c(1,.4,.4,1),2,
                dimnames=list(c("Dn","Do"), c("Dn","Do")))
  Sigma <- rho* (sigma %*% t(sigma))
  gen <- genTraitMPT(N = N, numItems = c(Target=1000, Lure=1000),
                     eqnfile = model, restrictions = list("g=.5"),
                     mean=mean, sigma=sigma, rho=rho)

  expect_equal(cov(gen$parameters$thetaLatent),
               Sigma, tolerance=.2)
  expect_equal(colMeans(gen$parameters$theta), mean, tolerance=.2)


  # est <- simpleMPT(model, gen$data[,], restrictions=list("g=.5"),
  #                  n.iter = 1500, n.burnin = 800, n.thin=2)
  # expect_equal(cov(qnorm(t(est$summary$individParameters[,,"Mean"]))),
  #              Sigma, tolerance=.1)
  # expect_equal(rowMeans(est$summary$individParameters[,,"Mean"]),
  #              mean, tolerance=.1)
})


test_that("genBetaMPT generates proper data", {

  N <- 100
  mean <- c(Dn=.5)
  sd <- c(Dn=.15)
  gen <- genBetaMPT(N = N, numItems = c(Target=1000, Lure=1000),
                     eqnfile = model, restrictions = list("g=.5", "Dn=Do"),
                     mean=mean, sd=sd)
  expect_equal(c(Dn=sd(gen$parameters$theta)), sd, tolerance=.2)
  expect_equal(colMeans(gen$parameters$theta), mean, tolerance=.2)

  # est <- simpleMPT(model, gen$data[,], restrictions=list("g=.5","Dn=Do"),
  #                  n.iter = 1500, n.burnin = 800, n.thin=2)
  # expect_equal(c(Dn=sd(est$summary$individParameters[,,"Mean"])),
  #              sd, tolerance=.1)
  # expect_equal(rowMeans(est$summary$individParameters[,,"Mean",drop=FALSE]),
  #              mean, tolerance=.1)
})
