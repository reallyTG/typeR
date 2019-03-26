context("rpostgisLT: infolocs")

test_that("example of an object with an attribute infolocs", {
    testthat::skip_on_cran()
    ## Create an object of class "ltraj"
    cap <-
        adehabitatLT::as.ltraj(
            xy = capreochiz[, c("x", "y")],
            date = capreochiz$date,
            id = "Roe.Deer",
            typeII = TRUE,
            infolocs = capreochiz[, 4:8]
        )
    ## split it
    suppressWarnings(cap <- adehabitatLT::cutltraj(cap, "dist > 100"))

    expect_true(ltraj2pgtraj(conn_empty, cap, infolocs = TRUE))
    expect_message(cap2 <- pgtraj2ltraj(conn_empty, "cap"),
                   "successfully")
    expect_equal(cap, cap2)
    
    try(pgtrajDrop(conn_empty, "cap", full_clean = TRUE))
})

## The test below only works on Linux (?osx)
# test_that("infolocs with additional column types tests", {
#     skip_if_not(can_con(conn_empty), "could not connect to postgis database")
#     
#     cap_test <- capreochiz
#     ## Messing with timezone: timez
#     cap_test$timez <- as.POSIXct(cap_test$date)
#     attr(cap_test$timez, "tzone") <- "America/Chicago"
#     ## Messing with data class (and time zones!): posixlt
#     cap_test$posixlt <- as.POSIXlt(cap_test$date)
#     ## Factor with NAs: facNA
#     lev <- levels(cap_test$Status)
#     cap_test$facNA <-
#         factor(
#             cap_test$Status,
#             levels = lev,
#             labels =
#                 ifelse(lev == " 3DF  ", "<NA>", lev)
#         )
#     ## Ordered factor (and empty level!): facOrd
#     cap_test$facOrd <-
#         factor(
#             cap_test$Status,
#             levels = c(" Aqu  ", " 2DDi
#                    ", " 2D   ", " 3DDif", " 3DF  "),
#             labels = c("unknown", "bad", "OK",
#                        "good", "<NA>"),
#             ordered = TRUE
#         )
#     ## Build the ltraj
#     cap <-
#         adehabitatLT::as.ltraj(
#             xy = cap_test[, c("x", "y")],
#             date = cap_test$date,
#             id = "Roe.Deer",
#             typeII = TRUE,
#             infolocs = cap_test[, 3:ncol(cap_test)]
#         )
#     # Note that I keep "date" in
#     # infolocs as a reference; but
#     # that also makes two date
#     # fields! (ld converts the
#     # second one to 'date.1')
#     
#     expect_true(ltraj2pgtraj(conn_empty,
#                  cap,
#                  infolocs = TRUE))
#     expect_message(cap2 <- pgtraj2ltraj(conn_empty, pgtraj = "cap"),
#                    "successfully")
#     expect_equal(cap, cap2)
#     
#     try(pgtrajDrop(conn_empty, "cap", full_clean = TRUE))
# })
