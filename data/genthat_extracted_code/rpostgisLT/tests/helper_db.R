# See .travis.yml on how to set up the testing DBs
can_con <- function(x) {
    inherits(x, "PostgreSQLConnection")
}
conn_empty <- NULL
testthat::test_that("check utils", {
    testthat::skip_on_cran()
    testthat::expect_false(can_con(conn_empty))
    }
)
try(conn_empty <- RPostgreSQL::dbConnect(RPostgreSQL::PostgreSQL(),
                                   dbname = "rpglt_empty"))

conn_data <- NULL
testthat::test_that("check utils", {
    testthat::skip_on_cran()
    testthat::expect_false(can_con(conn_data))
})
try(conn_data <- RPostgreSQL::dbConnect(RPostgreSQL::PostgreSQL(),
                                         dbname = "rpglt_data"))