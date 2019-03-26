context("rpostgisLT: asPgtraj")

test_that("asPgtraj handles missing tables", {
    testthat::skip_on_cran()
    expect_error(asPgtraj(
        conn_data,
        schema = "traj_db_t1",
        relocations_table = c("example_data", "relocations_plus"),
        pgtrajs = "id",
        animals = "animal",
        bursts = "burst",
        relocations = "geom",
        timestamps = "time",
        rid = "gid",
        tzone = "America/Chicago",
        #clauses = "where id = 'continental'",
        info_cols = c("info_day", "dummy", "NOT_HERE"),
        #columns not found are ignored
        info_table = c("my-imaginary", "table"),
        info_rids = "gid"
    ), "Couldn't find the table my-imaginary.table in the database.",
    info = "missing info_table")
    
    expect_error(asPgtraj(
        conn_data,
        schema = "traj_db_t1",
        relocations_table = c("my-imaginary", "table"),
        pgtrajs = "id",
        animals = "animal",
        bursts = "burst",
        relocations = "geom",
        timestamps = "time",
        rid = "gid",
        tzone = "America/Chicago",
        #clauses = "where id = 'continental'",
        info_cols = c("info_day", "dummy", "NOT_HERE"),
        #columns not found are ignored
        info_table = c("public", "infoloc_test"),
        info_rids = "gid"
    ), "Couldn't find the table my-imaginary.table in the database.",
    info = "missing relocations table")
    
    expect_error(asPgtraj(
        conn_data,
        schema = "traj_db_t1",
        relocations_table = c("example_data", "relocations_plus"),
        pgtrajs = "id",
        animals = "animal",
        bursts = "burst",
        relocations = "non-existent-geom",
        timestamps = "time",
        rid = "gid",
        tzone = "America/Chicago",
        #clauses = "where id = 'continental'",
        info_cols = c("info_day", "dummy", "NOT_HERE"),
        #columns not found are ignored
        info_table = c("public", "infoloc_test"),
        info_rids = "gid"
    ), "The field non-existent-geom is not present in the table relocations_plus",
    info = "missing geom column in relocations_table")
    
})
