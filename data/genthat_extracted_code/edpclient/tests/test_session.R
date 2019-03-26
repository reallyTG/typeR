test_that("basic edp_session operations work", {
  skip_on_cran()
  expect_true(is.edp_session(SESS))
  print(SESS)
})

test_that("we can work with population models", {
  skip_on_cran()
  # Check that we can create an edp_population_model for yaxcatpeople and fetch
  # its column names and schema.
  pm <- popmod(SESS, YAXCATPEOPLE_PMID)
  expect_true(is.popmod(pm))
  expect_equal(as.character(pm), YAXCATPEOPLE_PMID)
  expect_true("FUELHEAT" %in% names(pm))
  s <- schema(pm)
  h <- s[s$name == "FUELHEAT", ]
  expect_equal(h$display_name, "Home heating fuel")
  expect_equal(h$stat_type, "categorical")
  expect_equal(h$nvalues, 6)
})

test_that("model and population schemas are the same", {
  skip_on_cran()
  pm <- popmod(SESS, YAXCATPEOPLE_PMID)
  pop_schema <- schema(population(SESS, pm$parent_id))
  pm_schema <- schema(pm)
  expect_equal(pop_schema, pm_schema)
})

test_that("we can select from yaxcatpeople", {
  skip_on_cran()
  pm <- popmod(SESS, YAXCATPEOPLE_PMID)
  # Check that we can select from a population model.
  d <- select(pm, target = c("FUELHEAT"))
  expect_s3_class(d$FUELHEAT, "factor")
  expect_equal(display_name(d$FUELHEAT), "Home heating fuel")
  expect_equal(stat_type(d$FUELHEAT), "categorical")
  # Check that the result is the same if we select from the parent population.
  parent_pop <- population(SESS, pm$parent_id)
  d_pop <- select(parent_pop, target = c("FUELHEAT"))
  expect_equal(d, d_pop)
  # Check that we can select a subset of rows.
  d <- select(pm, "FUELHEAT", where = list(CARPOOL = "1"))
  expect_equal(dim(d), c(359, 1))
  # Check that we detect bad column names in `target` and `where`.
  expect_error(select(pm, "does not exist"),
               "Not all target columns are in population")
  expect_error(select(pm, "FUELHEAT", where = list(`does not exist` = 0)),
               "Not all where columns are in population")
  # Check that we can select all 271 columns, including unmodeled ones.
  d <- select(pm)
  expect_equal(dim(d), c(1000, 271))
  # Check that an unmodeled column is stored as a character vector.
  expect_is(d$NSUBFAM, "character")
  # Check that not all values are present.
  expect_true(anyNA(d$NSUBFAM))
  # Check that identifying columns are set on selected data frame.
  expect_equal(identifying_columns(d), c("SERIAL", "CNTRY"))
})

test_that("we can simulate from yaxcatpeople", {
  skip_on_cran()
  pm <- popmod(SESS, YAXCATPEOPLE_PMID)
  # Check that we can simulate from a population model.
  d <- simulate(pm, target = "FUELHEAT", nsim = 10)
  expect_equal(names(d), "FUELHEAT")
  expect_s3_class(d$FUELHEAT, "factor")
  expect_length(d$FUELHEAT, 10)
  # Check `columns` alias for `target`.
  d <- simulate(pm, columns = "FUELHEAT", nsim = 10)
  expect_equal(names(d), "FUELHEAT")
  # Check that we can simulate all 246 modeled columns.
  d <- simulate(pm, nsim = 1)
  expect_equal(dim(d), c(1, 246))
  # Check that we can simulate conditionally.
  d <- simulate(pm, target = "FUELHEAT", given = data.frame(CARPOOL = "1"),
                nsim = 10)
  expect_equal(nrow(d), 10)
})

test_that("we can simulate by model", {
  # Draw five values of FUELHEAT from each of the ten models.
  skip_on_cran()
  pm <- popmod(SESS, YAXCATPEOPLE_PMID)
  d <- simulate(pm, target = "FUELHEAT", nsim = 5, by_model = TRUE)
  expect_equal(names(d), c("FUELHEAT", "model"))
  expect_equal(nrow(d), 5 * 10)
  expect_equal(levels(d$model), as.character(1:10))
})

test_that("simulate and joint_probability are consistent", {
  skip_on_cran()
  pm <- popmod(SESS, YAXCATPEOPLE_PMID)
  d <- simulate(pm, target = "FUELHEAT", nsim = 10000, seed = 17)
  p <- joint_probability(pm, target = data.frame(FUELHEAT = c("3", "4")))
  simulated_p <- c(mean(d$FUELHEAT == "3"), mean(d$FUELHEAT == "4"))
  expect_equal(p, simulated_p, tolerance = 3e-2)

  lp <- joint_probability(pm, target = data.frame(FUELHEAT = c("3", "4")),
                          log = TRUE)
  expect_equal(lp, log(p), tolerance = 1e-10)
})

test_that("we can compute column association on yaxcatpeople", {
  skip_on_cran()
  pm <- popmod(SESS, YAXCATPEOPLE_PMID)
  # Check that we can compute R-squared.
  r2 <- col_assoc(pm, c("VETSTAT", "VETSTATD"), statistic = "R squared")
  # Check that two related columns have high R-squared.
  r2v <- r2["VETSTAT", "VETSTATD"]
  expect_lt(0.3, r2v)
  expect_lt(r2v, 1.0)
  # Check that the R-squared matrix is symmetric.
  expect_equal(r2, t(r2))
})

test_that("conditional R^2 is reasonable", {
  skip_on_cran()
  pm <- popmod(SESS, YAXCATPEOPLE_PMID)
  # Check that an indicator for race being white is informative about an
  # indicator for race being black, but after conditioning on RACE=1 (white),
  # it is much less so.
  r2_uncond <- col_assoc(pm, c("RACWHT", "RACBLK"), statistic = "R squared",
                         seed = 17)
  r2_cond <- col_assoc(pm, c("RACWHT", "RACBLK"), given = list(RACE = "1"),
                       statistic = "R squared", seed = 17)
  expect_gt(r2_uncond["RACWHT", "RACBLK"], 2 * r2_cond["RACWHT", "RACBLK"])
})

test_that("predictions work as expected", {
  skip_on_cran()
  pm <- popmod(SESS, YAXCATPEOPLE_PMID)
  inferred <- predict(pm, target = c("VETSTAT", "VETSTATD"),
                      rowids = seq(1, 20))
  selected <- select(pm, target = c("VETSTAT", "VETSTATD"), rowids = seq(1, 20))
  expect_equal(dim(inferred), c(20, 2))
  # Make sure we inferred a missing value.
  expect_true(is.na(selected["3", "VETSTAT"]))
  expect_true(is.na(selected["3", "VETSTATD"]))
  expect_equal(as.character(inferred["3", "VETSTAT"]), "1")
  expect_equal(as.character(inferred["3", "VETSTATD"]), "11")
  # Make sure all values are inferred, and the inferred values match the
  # observed ones when they exist.
  expect_true(all(!is.na(inferred)))
  expect_true(all(is.na(selected) | (selected == inferred)))

  # Now try inferring present values.
  inferred <- predict(pm, target = c("VETSTAT", "VETSTATD"),
                      rowids = seq(1, 20), infer_present = TRUE)
  expect_equal(dim(inferred), c(20, 2))
  # Check that we inferred values like we did without `infer_present`.
  expect_equal(as.character(inferred["3", "VETSTAT"]), "1")
  expect_equal(as.character(inferred["3", "VETSTATD"]), "11")
  # Check that not all inferred values match the observed values.
  expect_true(all(!is.na(inferred)))
  expect_false(all(selected == inferred))

  # Test infer all
  inferred <- predict(pm, target = c("VETSTAT", "VETSTATD"))
  expect_equal(dim(inferred), c(1000, 2))
})

(function() {

  pop <- NULL
  pm <- NULL

  x <- rep(c(-1, 2, 17), times = 10)
  y <- ordered(rep(c("A", "B", "A"), times = 10))

  test_that("populations and models can be created", {
    skip_on_cran()
    # Create a population with two columns and three rows.
    d <- data.frame(x = x, y = y)
    name <- sprintf("test_session_%d", round(runif(1, 0, 1000000)))
    pop <<- create_population(SESS, d, name)
    # Check that the population can be fetched by id.
    pop2 <- population(SESS, as.character(pop))
    expect_equal(pop2$name, name)
    # Build a population model.
    pm <<- build_popmod(pop, seed = 17)
    expect_equal(pm$parent_id, as.character(pop))
  })

  test_that("we can select from ordered categorical columns", {
    skip_on_cran()
    d <- select(pm, target = "y")
    # Ignore attributes like `stat_type`.
    expect_equivalent(y, d$y)
  })

  test_that("we can query for probability-zero events", {
    skip_on_cran()
    lp <- joint_probability(pm, target = data.frame(x = 1e+90), log = TRUE)
    expect_equal(-Inf, lp)
  })

  test_that("we can query for conditional probabilities", {
    skip_on_cran()
    p <- joint_probability(pm, target = data.frame(y = c("A", "A")),
                            given = data.frame(x = c(1.0, 20.0)))
    expect_length(p, 2)
    # When `x` is large, `y` is always "A" in the data, but not when `x` is
    # small.
    expect_lt(p[1], p[2])
    expect_lt(p[2], 1.0)
  })

  test_that("visibility can be queried and changed", {
    skip_on_cran()
    # Test that the population has default visibility.
    locked_down_viz <- list(owner = SESS$username, public = FALSE,
                            reader_domains = character(0),
                            readers = character(0))
    expect_equal(locked_down_viz, visibility(pop))
    expect_equal(locked_down_viz, visibility(pm))
    # Add readers to the population and a population model.
    add_reader(pop, "test1@empirical.com")
    add_reader(pm, "test2@empirical.com")
    add_reader(pop, reader_domain = "test.empirical.com")
    # Check that the population is visible to everyone added, including by way
    # of the population model.
    visible_viz <- list(
        owner = SESS$username, public = FALSE,
        reader_domains = "test.empirical.com",
        readers = c("test1@empirical.com", "test2@empirical.com"))
    expect_equal(visible_viz, visibility(pop))
    expect_equal(visible_viz, visibility(pm))
  })

  test_that("the population can be deleted", {
    skip_on_cran()
    delete_population(pop)
    expect_error(population(SESS, as.character(pop)), "HTTP status 404")
  })

})()
