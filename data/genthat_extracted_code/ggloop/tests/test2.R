# All "dots" should have the exact same xy's. Run test to determine if xy's are
# all the same among "dots".

library(ggloop)
library(ggplot2)
context("List names")

# xydot -----------------------------------------------------------------

test_that("Test xydot.TF names", {


  xydot.TF <- ggloop(mtcars,
                     aes_loop(x = c(mpg:cyl, 5:6, qsec, 8, factor(cyl), mpg/wt),
                              y = c(mpg:cyl, 5:6, qsec, 8, factor(cyl), mpg/wt),
                              color = c(am:carb, 1:2, qsec, 3,
                                        factor(cyl), mpg/wt)),
                     remap_xy = TRUE,
                     remap_dots = FALSE,
                     gg_obs = TRUE
  )

  # Check first that object is what it should be: a list and ggplot objects.
  expect_identical(is.list(xydot.TF), TRUE)
  vapply(xydot.TF, function(x) {
    expect_identical(all(vapply(x, is.ggplot, logical(1))), TRUE)
  }, logical(1))

  # Check that the names are correct. If names are correct, mappings are assumed
  # to be correct.

  # First `...` names.
  xydot.TF.dotnames <- c("color.factor(cyl)", "color.mpg/wt", "color.am",
                         "color.gear", "color.carb", "color.mpg", "color.cyl",
                         "color.qsec", "color.disp")
  Map(expect_match, names(xydot.TF), xydot.TF.dotnames, fixed = TRUE)

  # Then `x` and `y`` names.
  xydot.TF.xynames <- c("x.mpg_y.cyl", "x.mpg_y.drat", "x.mpg_y.wt",
                        "x.mpg_y.qsec", "x.mpg_y.vs", "x.mpg_y.factor(cyl)",
                        "x.mpg_y.mpg/wt", "x.cyl_y.drat", "x.cyl_y.wt",
                        "x.cyl_y.qsec", "x.cyl_y.vs", "x.cyl_y.factor(cyl)",
                        "x.cyl_y.mpg/wt", "x.drat_y.wt", "x.drat_y.qsec",
                        "x.drat_y.vs", "x.drat_y.factor(cyl)",
                        "x.drat_y.mpg/wt", "x.wt_y.qsec", "x.wt_y.vs",
                        "x.wt_y.factor(cyl)", "x.wt_y.mpg/wt", "x.qsec_y.vs",
                        "x.qsec_y.factor(cyl)", "x.qsec_y.mpg/wt",
                        "x.vs_y.factor(cyl)", "x.vs_y.mpg/wt",
                        "x.factor(cyl)_y.mpg/wt")
  lapply(xydot.TF, function(x) {
    Map(expect_match, names(x), xydot.TF.xynames, fixed = TRUE)
    })
})


test_that("Test xydot.TT names", {


  xydot.TT <- ggloop(mtcars,
                     aes_loop(x = c(mpg:cyl, 5:6, qsec, 8, factor(cyl), mpg/wt),
                              y = c(mpg:cyl, 5:6, qsec, 8, factor(cyl), mpg/wt),
                              color = c(am:carb, 1:2, qsec, 3,
                                        factor(cyl), mpg/wt)),
                     remap_xy = TRUE,
                     remap_dots = TRUE,
                     gg_obs = TRUE)

  # Check first that object is what it should be: a list and ggplot objects.
  expect_identical(is.list(xydot.TT), TRUE)
  vapply(xydot.TT, function(x) {
    expect_identical(all(vapply(x, is.ggplot, logical(1))), TRUE)
  }, logical(1))

  # Check that the names are correct. If names are correct, mappings are assumed
  # to be correct.

  # First `...` names.
  xydot.TT.dotnames <- c("color.factor(cyl)", "color.mpg/wt", "color.am",
                         "color.gear", "color.carb", "color.mpg", "color.cyl",
                         "color.qsec", "color.disp")
  Map(expect_match, names(xydot.TT), xydot.TT.dotnames, fixed = TRUE)

  # Then `x` and `y`` names.
  xydot.TT.xynames <- c("x.mpg_y.cyl", "x.mpg_y.drat", "x.mpg_y.wt",
                        "x.mpg_y.qsec", "x.mpg_y.vs", "x.mpg_y.factor(cyl)",
                        "x.mpg_y.mpg/wt", "x.cyl_y.drat", "x.cyl_y.wt",
                        "x.cyl_y.qsec", "x.cyl_y.vs", "x.cyl_y.factor(cyl)",
                        "x.cyl_y.mpg/wt", "x.drat_y.wt", "x.drat_y.qsec",
                        "x.drat_y.vs", "x.drat_y.factor(cyl)",
                        "x.drat_y.mpg/wt", "x.wt_y.qsec", "x.wt_y.vs",
                        "x.wt_y.factor(cyl)", "x.wt_y.mpg/wt", "x.qsec_y.vs",
                        "x.qsec_y.factor(cyl)", "x.qsec_y.mpg/wt",
                        "x.vs_y.factor(cyl)", "x.vs_y.mpg/wt",
                        "x.factor(cyl)_y.mpg/wt")
  lapply(xydot.TT, function(x) {
    Map(expect_match, names(x), xydot.TT.xynames, fixed = TRUE)
    })
})


test_that("Teest xydot.FF names", {


  xydot.FF <- ggloop(mtcars,
                     aes_loop(x = c(mpg:cyl, 5:6, qsec, 8, factor(cyl), mpg/wt),
                              y = c(factor(gear) + factor(cyl), mpg:cyl),
                              color = c(am:carb, 1:2, qsec, 3,
                                        factor(cyl), mpg/wt)),
                     remap_xy = FALSE,
                     remap_dots = FALSE,
                     gg_obs = TRUE)

  # Check first that object is what it should be: a list and ggplot objects.
  expect_identical(is.list(xydot.FF), TRUE)
  vapply(xydot.FF, function(x) {
    expect_identical(all(vapply(x, is.ggplot, logical(1))), TRUE)
  }, logical(1))

  # Check that the names are correct. If names are correct, mappings are assumed
  # to be correct.

  # First `...` names.
  xydot.FF.dotnames <- c("color.factor(cyl)", "color.mpg/wt", "color.am",
                         "color.gear", "color.carb", "color.mpg", "color.cyl",
                         "color.qsec", "color.disp")
  Map(expect_match, names(xydot.FF), xydot.FF.dotnames, fixed = TRUE)

  # Then `x` and `y`` names.
  xydot.FF.xynames <- c("x.mpg_y.factor(gear) + factor(cyl)", "x.cyl_y.mpg",
                        "x.drat_y.cyl", "x.wt_y.factor(gear) + factor(cyl)",
                        "x.qsec_y.mpg", "x.vs_y.cyl",
                        "x.factor(cyl)_y.factor(gear) + factor(cyl)",
                        "x.mpg/wt_y.mpg")
  lapply(xydot.FF, function(x) {
    Map(expect_match, names(x), xydot.FF.xynames, fixed = TRUE)
    })
  })


test_that("Test xydot.FT names", {


  xydot.FT <- ggloop(mtcars,
                     aes_loop(x = mpg:disp,
                              y = mpg:hp,
                              color = am:carb),
                     remap_xy = FALSE,
                     remap_dots = TRUE,
                     gg_obs = TRUE)

  # Check first that object is what it should be: a list and ggplot objects.
  expect_identical(is.list(xydot.FT), TRUE)
  vapply(xydot.FT, function(x) {
    expect_identical(all(vapply(x, is.ggplot, logical(1))), TRUE)
  }, logical(1))

  # Check that the names are correct. If names are correct, mappings are assumed
  # to be correct.

  # First `...` names.
  xydot.FT.dotnames <- c("color.am", "color.gear", "color.carb")
  Map(expect_match, names(xydot.FT), xydot.FT.dotnames, fixed = TRUE)

  # Then `x` and `y`` names.
  xydot.FT.xynames <- c("x.mpg_y.mpg", "x.cyl_y.cyl", "x.disp_y.disp",
                        "x.mpg_y.hp")
  lapply(xydot.FT, function(x) {
    Map(expect_match, names(x), xydot.FT.xynames, fixed = TRUE)
    })
})


test_that("Test xydot.NAT names", {


  xydot.NAT <- ggloop(mtcars,
                      aes_loop(x = mpg:hp,
                               y = mpg:cyl,
                               color = am:carb),
                      remap_xy = NA,
                      remap_dots = TRUE,
                      gg_obs = TRUE)

  # Check first that object is what it should be: a list and ggplot objects.
  expect_identical(is.list(xydot.NAT), TRUE)
  vapply(xydot.NAT, function(x) {
    expect_identical(all(vapply(x, is.ggplot, logical(1))), TRUE)
  }, logical(1))

  # Check that the names are correct. If names are correct, mappings are assumed
  # to be correct.

  # First `...` names.
  xydot.NAT.dotnames <- c("color.am", "color.gear", "color.carb")
  Map(expect_match, names(xydot.NAT), xydot.NAT.dotnames)

  # Then `x` and `y`` names.
  xydot.NAT.xynames <- c("x.mpg_y.mpg", "x.cyl_y.cyl", "x.disp", "x.hp" )
  lapply(xydot.NAT, function(x) Map(expect_match, names(x), xydot.NAT.xynames))
})


test_that("Test xydot.NAF names", {


  xydot.NAF <- ggloop(mtcars,
                      aes_loop(x = mpg:disp,
                               y = mpg:hp,
                               color = am:carb),
                      remap_xy = NA,
                      remap_dots = FALSE,
                      gg_obs = TRUE)

  # Check first that object is what it should be: a list and ggplot objects.
  expect_identical(is.list(xydot.NAF), TRUE)
  vapply(xydot.NAF, function(x) {
    expect_identical(all(vapply(x, is.ggplot, logical(1))), TRUE)
  }, logical(1))

  # Check that the names are correct. If names are correct, mappings are assumed
  # to be correct.

  # First `...` names.
  xydot.NAF.dotnames <- c("color.am", "color.gear", "color.carb")
  Map(expect_match, names(xydot.NAF), xydot.NAF.dotnames)

  # Then `x` and `y`` names.
  xydot.NAF.xynames <- c( "x.mpg_y.mpg", "x.cyl_y.cyl", "x.disp_y.disp", "y.hp")
  lapply(xydot.NAF, function(x) Map(expect_match, names(x), xydot.NAF.xynames))
})


# xydots ----------------------------------------------------------------

test_that("Test xydots.TF names", {


  xydots.TF <- ggloop(mtcars,
                      aes_loop(x = mpg:hp,
                               y = mpg:hp,
                               color = am:carb,
                               size = vs:am),
                      remap_xy = TRUE,
                      remap_dots = FALSE)

  # Check first that object is what it should be: a list and ggplot objects.
  expect_identical(is.list(xydots.TF), TRUE)
  vapply(xydots.TF, function(x) {
    expect_identical(all(vapply(x, is.ggplot, logical(1))), TRUE)
  }, logical(1))

  # Check that the names are correct. If names are correct, mappings are assumed
  # to be correct.

  # First `...` names.
  xydots.TF.dotnames <- c("color.am_size.vs", "color.gear_size.am",
                          "color.carb")
  Map(expect_match, names(xydots.TF), xydots.TF.dotnames)

  # Then `x` and `y`` names.
  xydots.TF.xynames <- c("x.mpg_y.cyl", "x.mpg_y.disp", "x.mpg_y.hp",
                         "x.cyl_y.disp", "x.cyl_y.hp", "x.disp_y.hp")
  lapply(xydots.TF, function(x) Map(expect_match, names(x), xydots.TF.xynames))
})


test_that("Test xydots.TT names", {


  xydots.TT <- ggloop(mtcars,
                      aes_loop(x = mpg:hp,
                               y = mpg:hp,
                               color = am:carb,
                               size = vs:am),
                      remap_xy = TRUE,
                      remap_dots = TRUE)

  # Check first that object is what it should be: a list and ggplot objects.
  expect_identical(is.list(xydots.TT), TRUE)
  vapply(xydots.TT, function(x) {
    expect_identical(all(vapply(x, is.ggplot, logical(1))), TRUE)
  }, logical(1))

  # Check that the names are correct. If names are correct, mappings are assumed
  # to be correct.

  # First `...` names.
  xydots.TT.dotnames <- c("color.am_size.vs", "color.am_size.am",
                          "color.gear_size.vs", "color.gear_size.am",
                          "color.carb_size.vs", "color.carb_size.am")
  Map(expect_match, names(xydots.TT), xydots.TT.dotnames)

  # Then `x` and `y`` names.
  xydots.TT.xynames <- c("x.mpg_y.cyl", "x.mpg_y.disp", "x.mpg_y.hp",
                         "x.cyl_y.disp", "x.cyl_y.hp", "x.disp_y.hp")
  lapply(xydots.TT, function(x) Map(expect_match, names(x), xydots.TT.xynames))
})

test_that("Test xydots.FF names", {


  xydots.FF <- ggloop(mtcars,
                      aes_loop(x = mpg:hp,
                               y = mpg:hp,
                               color = am:carb,
                               size = vs:am),
                      remap_xy = FALSE,
                      remap_dots = FALSE)

  # Check first that object is what it should be: a list and ggplot objects.
  expect_identical(is.list(xydots.FF), TRUE)
  vapply(xydots.FF, function(x) {
    expect_identical(all(vapply(x, is.ggplot, logical(1))), TRUE)
  }, logical(1))

  # Check that the names are correct. If names are correct, mappings are assumed
  # to be correct.

  # First `...` names.
  xydots.FF.dotnames <- c("color.am_size.vs", "color.gear_size.am",
                          "color.carb")
  Map(expect_match, names(xydots.FF), xydots.FF.dotnames)

  # Then `x` and `y`` names.
  xydots.FF.xynames <- c("x.mpg_y.mpg", "x.cyl_y.cyl", "x.disp_y.disp",
                         "x.hp_y.hp")
  lapply(xydots.FF, function(x) Map(expect_match, names(x), xydots.FF.xynames))
})

test_that("Test xydots.FT names", {


  xydots.FT <- ggloop(mtcars,
                      aes_loop(x = mpg:hp,
                               y = mpg:hp,
                               color = am:carb,
                               size = vs:am),
                      remap_xy = FALSE,
                      remap_dots = TRUE)

  # Check first that object is what it should be: a list and ggplot objects.
  expect_identical(is.list(xydots.FT), TRUE)
  vapply(xydots.FT, function(x) {
    expect_identical(all(vapply(x, is.ggplot, logical(1))), TRUE)
  }, logical(1))

  # Check that the names are correct. If names are correct, mappings are assumed
  # to be correct.

  # First `...` names.
  xydots.FT.dotnames <- c("color.am_size.vs", "color.am_size.am",
                          "color.gear_size.vs", "color.gear_size.am",
                          "color.carb_size.vs", "color.carb_size.am")
  Map(expect_match, names(xydots.FT), xydots.FT.dotnames)

  # Then `x` and `y`` names.
  xydots.FT.xynames <- c("x.mpg_y.mpg", "x.cyl_y.cyl", "x.disp_y.disp",
                         "x.hp_y.hp")
  lapply(xydots.FT, function(x) Map(expect_match, names(x), xydots.FT.xynames))
})

test_that("Test xydots.NAT names", {


  xydots.NAT <- ggloop(mtcars,
                       aes_loop(x = mpg:hp,
                                y = mpg:hp,
                                color = am:carb,
                                size = vs:am),
                       remap_xy = NA,
                       remap_dots = TRUE)

  # Check first that object is what it should be: a list and ggplot objects.
  expect_identical(is.list(xydots.NAT), TRUE)
  vapply(xydots.NAT, function(x) {
    expect_identical(all(vapply(x, is.ggplot, logical(1))), TRUE)
  }, logical(1))

  # Check that the names are correct. If names are correct, mappings are assumed
  # to be correct.

  # First `...` names.
  xydots.NAT.dotnames <- c("color.am_size.vs", "color.am_size.am",
                           "color.gear_size.vs", "color.gear_size.am",
                           "color.carb_size.vs", "color.carb_size.am")
  Map(expect_match, names(xydots.NAT), xydots.NAT.dotnames)

  # Then `x` and `y`` names.
  xydots.NAT.xynames <- c("x.mpg_y.mpg", "x.cyl_y.cyl", "x.disp_y.disp",
                         "x.hp_y.hp")
  lapply(xydots.NAT, function(x) Map(expect_match, names(x), xydots.NAT.xynames))
})


test_that("Test xydots.NAF names", {


  xydots.NAF <- ggloop(mtcars,
                       aes_loop(x = mpg:hp,
                                y = mpg:hp,
                                color = am:carb,
                                size = vs:am),
                       remap_xy = NA,
                       remap_dots = FALSE)

  # Check first that object is what it should be: a list and ggplot objects.
  expect_identical(is.list(xydots.NAF), TRUE)
  vapply(xydots.NAF, function(x) {
    expect_identical(all(vapply(x, is.ggplot, logical(1))), TRUE)
  }, logical(1))

  # Check that the names are correct. If names are correct, mappings are assumed
  # to be correct.

  # First `...` names.
  xydots.NAF.dotnames <- c("color.am_size.vs", "color.gear_size.am",
                           "color.carb")
  Map(expect_match, names(xydots.NAF), xydots.NAF.dotnames)

  # Then `x` and `y`` names.
  xydots.NAF.xynames <- c("x.mpg_y.mpg", "x.cyl_y.cyl", "x.disp_y.disp",
                          "x.hp_y.hp")
  lapply(xydots.NAF, function(x) Map(expect_match, names(x), xydots.NAF.xynames))
})


# xy ---------------------------------------------------------------------

test_that("Test xy.TF names", {


  xy.TF <- ggloop(mtcars,
                  aes_loop(x = mpg,
                           y = cyl:hp),
                  remap_xy = TRUE,
                  remap_dots = FALSE)

  # Check first that object is what it should be: a list and ggplot objects.
  expect_identical(is.list(xy.TF), TRUE)
  expect_identical(all(vapply(xy.TF, is.ggplot, logical(1))), TRUE)

  # Check that the names are correct. If names are correct, mappings are assumed
  # to be correct.

  # Only `x` and `y`` names.
  xy.TF.xynames <- c("x.mpg_y.cyl", "x.mpg_y.disp", "x.mpg_y.hp")
  Map(expect_match, names(xy.TF), xy.TF.xynames)
})


test_that("Test xy.TT names", {


  xy.TT <- ggloop(mtcars,
                  aes_loop(x = mpg,
                           y = cyl:hp),
                  remap_xy = TRUE,
                  remap_dots = TRUE)

  # Check first that object is what it should be: a list and ggplot objects.
  expect_identical(is.list(xy.TT), TRUE)
  expect_identical(all(vapply(xy.TT, is.ggplot, logical(1))), TRUE)

  # Check that the names are correct. If names are correct, mappings are assumed
  # to be correct.

  # Only `x` and `y`` names.
  xy.TT.xynames <- c("x.mpg_y.cyl", "x.mpg_y.disp", "x.mpg_y.hp")
  Map(expect_match, names(xy.TT), xy.TT.xynames)
})


test_that("Test xy.FF names", {


  xy.FF <- ggloop(mtcars,
                  aes_loop(x = mpg,
                           y = cyl:hp),
                  remap_xy = FALSE,
                  remap_dots = FALSE)

  # Check first that object is what it should be: a list and ggplot objects.
  expect_identical(is.list(xy.FF), TRUE)
  expect_identical(all(vapply(xy.FF, is.ggplot, logical(1))), TRUE)

  # Check that the names are correct. If names are correct, mappings are assumed
  # to be correct.

  # Only `x` and `y`` names.
  xy.FF.xynames <- c("x.mpg_y.cyl", "x.mpg_y.disp", "x.mpg_y.hp")
  Map(expect_match, names(xy.FF), xy.FF.xynames)
})


test_that("Test xy.FT names", {


  xy.FT <- ggloop(mtcars,
                  aes_loop(x = mpg,
                           y = cyl:hp),
                  remap_xy = FALSE,
                  remap_dots = TRUE)

  # Check first that object is what it should be: a list and ggplot objects.
  expect_identical(is.list(xy.FT), TRUE)
  expect_identical(all(vapply(xy.FT, is.ggplot, logical(1))), TRUE)

  # Check that the names are correct. If names are correct, mappings are assumed
  # to be correct.

  # Only `x` and `y`` names.
  xy.FT.xynames <- c("x.mpg_y.cyl", "x.mpg_y.disp", "x.mpg_y.hp")
  Map(expect_match, names(xy.FT), xy.FT.xynames)
})


test_that("Test xy.NAT names", {


  xy.NAT <- ggloop(mtcars,
                   aes_loop(x = mpg,
                            y = cyl:hp),
                   remap_xy = NA,
                   remap_dots = TRUE)

  # Check first that object is what it should be: a list and ggplot objects.
  expect_identical(is.list(xy.NAT), TRUE)
  expect_identical(all(vapply(xy.NAT, is.ggplot, logical(1))), TRUE)

  # Check that the names are correct. If names are correct, mappings are assumed
  # to be correct.

  # Only `x` and `y`` names.
  xy.NAT.xynames <- c("x.mpg_y.cyl", "y.disp", "y.hp")
  Map(expect_match, names(xy.NAT), xy.NAT.xynames)
})


test_that("Test xy.NAF names", {


  xy.NAF <- ggloop(mtcars,
                   aes_loop(x = mpg,
                            y = cyl:hp),
                   remap_xy = NA,
                   remap_dots = FALSE)

  # Check first that object is what it should be: a list and ggplot objects.
  expect_identical(is.list(xy.NAF), TRUE)
  expect_identical(all(vapply(xy.NAF, is.ggplot, logical(1))), TRUE)

  # Check that the names are correct. If names are correct, mappings are assumed
  # to be correct.

  # Only `x` and `y`` names.
  xy.NAF.xynames <- c("x.mpg_y.cyl", "y.disp", "y.hp")
  Map(expect_match, names(xy.NAF), xy.NAF.xynames)
})
