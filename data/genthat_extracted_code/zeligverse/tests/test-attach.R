# REQUIRE TEST required Zelig packages load ------------------------------------
test_that("REQUIRE TEST required Zelig packages load", {
    library(zeligverse)

    zelig_pkgs <- c('package:zeligverse', 'package:Zelig', 'package:ZeligEI',
                    'package:ZeligChoice')

    expect_true(all(zelig_pkgs %in% search()))
})
