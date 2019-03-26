context("spup")

# ----------------------------------------------------------------------------------
# dummy test to start writing tests
test_that("equality holds", {
    expect_equal(sin(pi / 4), 1 / sqrt(2))
    expect_warning(sqrt(-1))
})

# ----------------------------------------------------------------------------------
test_that("warning emitted when acf0 outside (0,1) interval gives warning", {
	expect_warning(
	  crm <- makeCRM(acf0 = -0.8, range = 300, model = "Exp"),
		"For standardized residuals acf0 argument should be between 0 and 1."
	)
})
# ----------------------------------------------------------------------------------
test_that("error returned when correlation matrix eigenvalues < 0 in defineMUM()", {
  a <- matrix(c(1,-0.7,0.2,0.7,1,0.5,0.2,0.5,1), nrow = 3, ncol = 3)
  expect_error(stopifnot(min(eigen(a)$values) > 0))
})
# ----------------------------------------------------------------------------------
test_that("distribution sampling works", {
  set.seed(1234567)
  a <- distribution_sampling(5,"beta",c(0.5,0.6,2))
  expect_output(str(a), " num [1:5] 0.686 0.977 0.934 0.828 0.867", fixed = TRUE)
})
# ----------------------------------------------------------------------------------
test_that("in joint genSample() translating multiple correlograms to variograms works", {
  skip_on_cran()
  # load data
  data(OC, OC_sd, TN, TN_sd)
  # define marginal UMs
  OC_crm <- makeCRM(acf0 = 0.6, range = 1000, model = "Sph")
  OC_UM <- defineUM(TRUE, distribution = "norm", distr_param = c(OC, OC_sd),
                    crm = OC_crm, id = "OC")
  TN_crm <- makeCRM(acf0 = 0.4, range = 1000, model = "Sph")
  TN_UM <- defineUM(TRUE, distribution = "norm", distr_param = c(TN, TN_sd),
                    crm = TN_crm, id = "TN")
  UMobject <- defineMUM(list(OC_UM,TN_UM), matrix(c(1,0.7,0.7,1),2,2))
  n_vars <- length(UMobject[[1]])
  vgms <- list()
  ids <- c()
  nuggets <- c()
  psills  <- c()
  for (i in 1:n_vars) {
    vgms[[i]]    <- crm2vgm(UMobject[[1]][[i]]$crm)
    ids[i] <- UMobject[[1]][[i]]$id
    nuggets[i]   <- vgms[[i]]$psill[1]
    psills[i]    <- vgms[[i]]$psill[2]  
  }
  expect_is(vgms[[1]], "variogramModel")
  expect_output(print(ids), '[1] "OC" "TN"', fixed = TRUE)
  expect_equal(nuggets, c(0.4, 0.6))
  expect_equal(psills, c(0.6, 0.4))
})
# ----------------------------------------------------------------------------------
test_that("propagate returns a list of all model runs", {
  skip_on_cran()
  # load data
  data(OC, OC_sd, TN, TN_sd)
  model <- function(OC, TN) OC/TN
  # define marginal UMs
  OC_crm <- makeCRM(acf0 = 0.6, range = 1000, model = "Sph")
  OC_UM <- defineUM(TRUE, distribution = "norm", distr_param = c(OC, OC_sd),
                    crm = OC_crm, id = "OC")
  TN_crm <- makeCRM(acf0 = 0.4, range = 1000, model = "Sph")
  TN_UM <- defineUM(TRUE, distribution = "norm", distr_param = c(TN, TN_sd),
                    crm = TN_crm, id = "TN")
  # define joint UM
  mySpatialMUM <- defineMUM(list(OC_UM, TN_UM), matrix(c(1,0.7,0.7,1), nrow=2, ncol=2))
  # sample
  sampl <- genSample(mySpatialMUM, n = 3, "ugs", nmax = 24)
  out <- propagate(realizations = sampl, model = model, n = 3)
  expect_is(out, "list")
})
# -----------------------------------------------------------------------------------
test_that("rendering works", {
  # render character string
  my_template <- "Hello {{name}}!"
  a <- my_template %>%
        render(name = "World")
  expect_match(a, "Hello World!")
})
# -----------------------------------------------------------------------------------

# # this should pass but R has problem with double quotation marks?
# test_that("makecrm() is deprecated", {
#   expect_warning(
#     crm <- makecrm(acf0 = 0.8, range = 300, model = "Exp"),
#     "'makecrm' is deprecated.\nUse 'makeCRM' instead.\nSee help("Deprecated")")
# })


