context("rpostgisLT: projected")

test_that("test CRS on ibexraw", {
    testthat::skip_on_cran()
    expect_true(ltraj2pgtraj(
        conn_empty,
        ltraj = ibexraw_srs,
        note = "test CRS on ibexraw",
        overwrite = TRUE
    ))
    expect_message(
        ibexraw_re <-
            pgtraj2ltraj(conn_empty, schema = 'traj', pgtraj = 'ibexraw_srs'),
        "successfully")
    expect_equal(ibexraw_srs, ibexraw_re)
})

test_that("test CRS on puechcirc", {
    testthat::skip_on_cran()
    expect_true(
        ltraj2pgtraj(
            conn_empty,
            ltraj = puechcirc_srs,
            note = "test CRS on puechcirc",
            overwrite = TRUE
        )
    )
    expect_message(
        puechcirc_re <-
            pgtraj2ltraj(conn_empty, schema = 'traj', pgtraj = 'puechcirc_srs'),
        "successfully"
    )
    expect_equal(puechcirc_srs, puechcirc_re)
})

test_that("test CRS on albatross", {
    testthat::skip_on_cran()
    expect_true(
        ltraj2pgtraj(
            conn_empty,
            ltraj = albatross_srs,
            note = "test CRS on albatross",
            overwrite = TRUE
        )
    )
    expect_message(
        albatross_re <-
            pgtraj2ltraj(conn_empty, schema = 'traj', pgtraj = 'albatross_srs'),
        "successfully"
    )
    expect_equal(albatross_srs, albatross_re)
})

test_that("test CRS on porpoise", {
    testthat::skip_on_cran()
    expect_true(ltraj2pgtraj(
        conn_empty,
        ltraj = porpoise_srs,
        note = "test CRS on porpoise",
        overwrite = TRUE
    ))
    expect_message(
        porpoise_re <-
            pgtraj2ltraj(conn_empty, schema = 'traj', pgtraj = 'porpoise_srs'),
        "successfully"
    )
    expect_equal(porpoise_srs, porpoise_re)
})

test_that("pgtrajDrop full clean with default schema", {
    testthat::skip_on_cran()
    expect_true(pgtrajDrop(conn_empty))
})

test_that("porpoise type I arbitrary crs", {
    testthat::skip_on_cran()
    expect_true(ltraj2pgtraj(conn_empty,
                             ltraj = porpoise_I_srs,
                             schema = "type_I",
                             note = "arbitrary CRS"))
    expect_message(
        porpoise_I_re <-
            pgtraj2ltraj(conn_empty, schema = "type_I", pgtraj = "porpoise_I_srs"),
        "successfully"
    )
    expect_equal(porpoise_I_srs, porpoise_I_re)
})

test_that("albatross type I arbitrary crs", {
    testthat::skip_on_cran()
    expect_true(ltraj2pgtraj(conn_empty,
                 ltraj = albatross_I_srs,
                 schema = "type_I",
                 note = "arbitrary CRS"))
    expect_message(
        albatross_I_re <-
            pgtraj2ltraj(conn_empty, schema = "type_I", pgtraj = "albatross_I_srs"),
        "successfully"
    )
    expect_equal(albatross_I_srs, albatross_I_re)
})

test_that("ibexraw type I arbitrary crs", {
    testthat::skip_on_cran()
    expect_true(ltraj2pgtraj(conn_empty,
                 ltraj = ibexraw_I_srs,
                 schema = "type_I",
                 note = "arbitrary CRS"))
    expect_message(
        ibexraw_I_re <-
            pgtraj2ltraj(conn_empty, schema = "type_I", pgtraj = "ibexraw_I_srs"),
        "successfully"
    )
    expect_equal(ibexraw_I_srs, ibexraw_I_re)
})

