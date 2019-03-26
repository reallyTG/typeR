context("rpostgisLT: minimal")

# source_test_helpers(path = "tests/testthat", env = test_env())

test_that("minimal ltraj transfer is equal and identical", {
    testthat::skip_on_cran()
    ib_min <- dl(ld(ibexraw[1])[1:10,]) # note that step parameters are recomputed on purpose
    expect_true(ltraj2pgtraj(conn_empty,
                 ltraj = ib_min,
                 schema = "traj_min",
                 pgtraj = "ib_min"))
    expect_message(ib_min_re <- pgtraj2ltraj(conn_empty, schema = "traj_min", pgtraj = "ib_min"),
                   "Ltraj successfully created from ib_min.")
    expect_equal(ib_min, ib_min_re)
    expect_false(identical(ib_min, ib_min_re))
    expect_true(pgtrajDrop(conn_empty, "ib_min", "traj_min"))
})

test_that("overwrite with null proj4string", {
    testthat::skip_on_cran()
    ib_min <- dl(ld(ibexraw[1])[1:10, ])
    expect_true(ltraj2pgtraj(
        conn_empty,
        ltraj = ib_min,
        schema = "traj_min",
        pgtraj = "ib_min"
    ))
    
    attr(ib_min, "proj4string") <- NULL
    expect_true(
        ltraj2pgtraj(
            conn_empty,
            ltraj = ib_min,
            schema = "traj_min",
            pgtraj = "ib_min",
            overwrite = TRUE
        )
    )
    
    expect_true(pgtrajDrop(conn_empty, "ib_min", "traj_min"))
})

test_that("transfer with projection", {
    testthat::skip_on_cran()
    ib_min_srs <- dl(ld(ibexraw[2])[1:10, ], proj4string = srs)
    # note that step parameters are recomputed on purpose
    expect_true(ltraj2pgtraj(
        conn_empty,
        ltraj = ib_min_srs,
        schema = "traj_min",
        pgtraj = "ib_min_3395"
    ))
    expect_message(
        ib_min_srs_re <-
            pgtraj2ltraj(conn_empty, schema = "traj_min", pgtraj = "ib_min_3395"),
        "Ltraj successfully created from ib_min_3395."
    )
    expect_equal(ib_min_srs, ib_min_srs_re)
    expect_true(pgtrajDrop(conn_empty, "ib_min_3395", "traj_min"))
})

test_that("ibexraw is not regular", {
    testthat::skip_on_cran()
    expect_false(is.regular(ibexraw))
})

test_that("pgtraj and schema defaults", {
    testthat::skip_on_cran()
    expect_message(ltraj2pgtraj(conn_empty, ibex, overwrite = TRUE),
                   "('ibex')|('traj')", fixed = FALSE)
    
    expect_message(ibexTest <- pgtraj2ltraj(conn_empty, pgtraj = "ibex"),
                   "ibex")
    expect_equal(ibex, ibexTest)
    expect_true(pgtrajDrop(conn_empty, "ibex", "traj"))
})
