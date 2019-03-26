context("rpostgisLT: getStepWindow")

schema <- "ibex_traj_materialized_bursts"
pgtraj <- "ibex_int_space"
view <- "step_geometry_shiny_ibex_int_space"
# attr(ibex_int_space, "proj4string") <- CRS("+init=epsg:3395")
# ltraj2pgtraj(conn_data, ibex_int_space, schema = "ibex_traj_materialized_bursts",
#              infolocs = TRUE, overwrite = TRUE)
# createShinyStepsView(conn_data, schema, pgtraj)
# createShinyBurstsView(conn_data, schema)

test_that("getStepWindow time ranges", {
    testthat::skip_on_cran()
    i <- lubridate::period(2, units = "days")
    expect_silent(
        s <-
            getStepWindow(
                conn_data,
                schema,
                view = view,
                time = "2003-06-01 CEST",
                i,
                step_mode = FALSE,
                info_cols = NULL,
                tstamp_start = as.POSIXct("2003-06-01 CEST"),
                tstamp_last = as.POSIXct("2003-06-14 14:25:39 CEST")
            )
    )
    expect_equal(length(sf::st_geometry(s)), 4)
    expect_warning(
        s_out <-
            getStepWindow(
                conn_data,
                schema,
                view = view,
                time = "2003-05-15 CEST",
                i,
                step_mode = FALSE,
                info_cols = NULL,
                tstamp_start = as.POSIXct("2003-06-01 CEST"),
                tstamp_last = as.POSIXct("2003-06-14 14:25:39 CEST")
            ),
        "Didn't find any steps at"
    )
    expect_warning(
        s_out2 <-
            getStepWindow(
                conn_data,
                schema,
                view = view,
                time = "2003-06-15 CEST",
                i,
                step_mode = FALSE,
                info_cols = NULL,
                tstamp_start = as.POSIXct("2003-06-01 CEST"),
                tstamp_last = as.POSIXct("2003-06-14 14:25:39 CEST")
            ),
        "Didn't find any steps at"
    )
    expect_silent(
        s_out3 <-
            getStepWindow(
                conn_data,
                schema,
                view = view,
                time = "2003-06-14 14:25:39 CEST",
                i,
                step_mode = FALSE,
                info_cols = NULL,
                tstamp_start = as.POSIXct("2003-06-01 CEST"),
                tstamp_last = as.POSIXct("2003-06-14 14:25:39 CEST")
            )
    )
    expect_equal(length(sf::st_geometry(s_out)), 0)
    expect_equal(length(sf::st_geometry(s_out2)), 0)
    expect_equal(length(sf::st_geometry(s_out3)), 1)
})

# test_that("getStepWindow time input", {
#     skip_if_not(can_con(conn_data), "could not connect to postgis database")
#     
#     i <- lubridate::period(2, units = "days")
#     expect_error(
#         s_out <-
#             getStepWindow(
#                 conn_data,
#                 schema,
#                 view = view,
#                 time = NULL,
#                 i,
#                 step_mode = FALSE,
#                 info_cols = NULL,
#                 tstamp_start = as.POSIXct("2003-06-01 CEST"),
#                 tstamp_last = as.POSIXct("2003-06-14 14:25:39 CEST")
#             )
#     )
#     expect_error(
#         s_out2 <-
#             getStepWindow(
#                 conn_data,
#                 schema,
#                 view = view,
#                 time = "",
#                 i,
#                 step_mode = FALSE,
#                 info_cols = NULL,
#                 tstamp_start = as.POSIXct("2003-06-01 CEST"),
#                 tstamp_last = as.POSIXct("2003-06-14 14:25:39 CEST")
#             )
#     )
#     expect_error(
#         s_out3 <-
#             getStepWindow(
#                 conn_data,
#                 schema,
#                 view = view,
#                 time = NA,
#                 i,
#                 step_mode = FALSE,
#                 info_cols = NULL,
#                 tstamp_start = as.POSIXct("2003-06-01 CEST"),
#                 tstamp_last = as.POSIXct("2003-06-14 14:25:39 CEST")
#             )
#     )
# })

test_that("getStepWindow step_mode and info_cols input", {
    testthat::skip_on_cran()
    i <- lubridate::period(2, units = "days")
    expect_silent(s_out <- getStepWindow(
        conn_data,
        schema,
        view = view,
        time = "2003-06-02 CEST",
        interval = i,
        step_mode = TRUE,
        info_cols = "pkey ,",
        tstamp_start = as.POSIXct("2003-06-01 CEST"),
        tstamp_last = as.POSIXct("2003-06-14 14:25:39 CEST")
    ))
    expect_equal(length(s_out), 13)
    expect_silent(s_out2 <- getStepWindow(
        conn_data,
        schema,
        view = view,
        time = "2003-06-02 CEST",
        interval = i,
        step_mode = FALSE,
        info_cols = "pkey ,",
        tstamp_start = as.POSIXct("2003-06-01 CEST"),
        tstamp_last = as.POSIXct("2003-06-14 14:25:39 CEST")
    ))
    expect_equal(length(s_out2), 3)
})

test_that("getStepWindow interval", {
    testthat::skip_on_cran()
    expect_warning(s_out <- getStepWindow(
        conn_data,
        schema,
        view = view,
        time = "2003-06-14 13:57:35 UTC",
        interval = lubridate::period(1),
        step_mode = FALSE,
        info_cols = NULL,
        tstamp_start = as.POSIXct("2003-06-01 CEST"),
        tstamp_last = as.POSIXct("2003-06-14 14:25:39 CEST")
    ), "Didn't find any steps at")
    expect_equal(length(sf::st_geometry(s_out)), 0)
    expect_warning(
        s_out4 <-
            getStepWindow(
                conn_data,
                schema,
                view = view,
                time = "2003-06-02 CEST",
                interval = lubridate::period(0, units = "seconds"),
                step_mode = FALSE,
                info_cols = NULL,
                tstamp_start = as.POSIXct("2003-06-01 CEST"),
                tstamp_last = as.POSIXct("2003-06-14 14:25:39 CEST")
            ), "Didn't find any steps at"
    )
    expect_silent(
        s_out4 <-
            getStepWindow(
                conn_data,
                schema,
                view = view,
                time = "2003-06-02 CEST",
                interval = lubridate::period(c(2, 57, 17.8380000591278),
                                             c("hour", "minute", "second")),
                step_mode = FALSE,
                info_cols = NULL,
                tstamp_start = as.POSIXct("2003-06-01 CEST"),
                tstamp_last = as.POSIXct("2003-06-14 14:25:39 CEST")
            )
    )
})

rm(schema, pgtraj, view)