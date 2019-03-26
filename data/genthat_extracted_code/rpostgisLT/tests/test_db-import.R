context("rpostgisLT: db-import")

test_that("import from db with infolocs", {
    
    testthat::skip_on_cran()
    expect_true(asPgtraj(
        conn_data,
        schema = "traj_db_t1",
        relocations_table = c("example_data", "relocations_plus"),
        pgtrajs = "id",
        animals = "animal",
        bursts = "burstname_cont",
        relocations = "geom",
        timestamps = "time",
        rids = "gid",
        clauses = "where id = 'continental'",
        info_cols = c("info_day", "dummy", "step_id") #step_id gets changed to avoid conflict
    ))
    
    try(pgtrajDrop(conn_data, schema = "traj_db_t1", pgtraj = "continental",
                   full_clean = TRUE))
})

test_that("import from db with infolocs in other table", {
    
    testthat::skip_on_cran()
    expect_true(
        asPgtraj(
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
            info_table = c("public", "infoloc_test"),
            info_rids = "gid"
        )
    )
    
    try(
        for(pg in c("large", "continental", "large2", "medium", "small")) {
            pgtrajDrop(conn_data, schema = "traj_db_t1",
                       pgtraj = pg, full_clean = TRUE)
        }
    )
})

test_that("ltraj equality when transfer: db -> R-> db -> R", {
    
    testthat::skip_on_cran()
    expect_true(
        asPgtraj(
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
            info_table = c("public","infoloc_test"),
            info_rids = "gid"
        )
    )
    
    expect_message(continental <- pgtraj2ltraj(conn_data, "continental" , "traj_db_t1"),
                   "successfully")
    expect_message(large <- pgtraj2ltraj(conn_data, "large" , "traj_db_t1"),
                    "successfully")
    expect_message(medium <- pgtraj2ltraj(conn_data, "medium" , "traj_db_t1"),
                    "successfully")
    expect_message(small <- pgtraj2ltraj(conn_data, "small" , "traj_db_t1"),
                   "successfully")
    expect_true(ltraj2pgtraj(conn_data,
                 continental,
                 "traj_db_t1",
                 overwrite = TRUE,
                 infolocs = TRUE))
    expect_true(ltraj2pgtraj(conn_data,
                 large,
                 "traj_db_t1",
                 overwrite = TRUE,
                 infolocs = TRUE))
    expect_true(ltraj2pgtraj(conn_data,
                 medium,
                 "traj_db_t1",
                 overwrite = TRUE,
                 infolocs = TRUE))
    expect_true(ltraj2pgtraj(conn_data,
                 small,
                 "traj_db_t1",
                 overwrite = TRUE,
                 infolocs = TRUE))
    expect_message(continental2 <- pgtraj2ltraj(conn_data,  "continental" , "traj_db_t1"),
                   "successfully")
    expect_message(large2 <- pgtraj2ltraj(conn_data, "large" , "traj_db_t1"),
                   "successfully")
    expect_message(medium2 <- pgtraj2ltraj(conn_data, "medium" , "traj_db_t1"),
                   "successfully")
    expect_message(small2 <- pgtraj2ltraj(conn_data, "small" , "traj_db_t1"),
                   "successfully")
    expect_true(all.equal(continental, continental2))
    expect_true(all.equal(large, large2))
    expect_true(all.equal(medium, medium2))
    expect_true(all.equal(small, small2))
    
    try(
        for(pg in c("large", "continental", "large2", "medium", "small")) {
            pgtrajDrop(conn_data, schema = "traj_db_t1",
                       pgtraj = pg, full_clean = TRUE)
        }
    )
})

test_that("import from db typeI", {
    testthat::skip_on_cran()
    expect_true(
        asPgtraj(
            conn_data,
            schema = "traj_db_t2",
            relocations_table = c("example_data", "reloc_t1"),
            pgtrajs = "type_1",
            animals = "bunny",
            relocations = "geom",
            rid = "gid"
        )
    )
    
    try(pgtrajDrop(conn_data, schema = "traj_db_t2",
                   pgtraj = "type_1", full_clean = TRUE))
})

test_that("import from db a mix of Type I and Type II in the same schema", {
    testthat::skip_on_cran()
    expect_true(
        asPgtraj(
            conn_data,
            schema = "traj_db_t2",
            relocations_table = c("example_data", "reloc_t1"),
            pgtrajs = "type_1",
            animals = "bunny",
            relocations = "geom",
            rid = "gid"
        )
    )
    expect_true(
        asPgtraj(
            conn_data,
            schema = "traj_db_t2",
            relocations_table = c("example_data", "relocations_plus"),
            pgtrajs = "id",
            animals = "animal",
            bursts = "burst",
            relocations = c("x", "y"),
            clauses = "where id = 'medium'",
            timestamps = "time",
            rid = "gid",
            srid = 4326
        )
    )
    
    try(
        for(pg in c("medium", "type_1")) {
            pgtrajDrop(conn_data, schema = "traj_db_t2",
                       pgtraj = pg, full_clean = TRUE)
        }
    )
})

test_that("ltraj typeI equality when transfer: db -> R-> db -> R", {
    testthat::skip_on_cran()
    expect_true(
        asPgtraj(
            conn_data,
            schema = "traj_db_t2",
            relocations_table = c("example_data", "reloc_t1"),
            pgtrajs = "type_1",
            animals = "bunny",
            relocations = "geom",
            rid = "gid"
        )
    )
    expect_message(type_1 <- pgtraj2ltraj(conn_data, "type_1", "traj_db_t2"),
                   "successfully")
    expect_true(ltraj2pgtraj(conn_data, type_1, "traj_db_t2", overwrite = TRUE))
    expect_true(ltraj2pgtraj(conn_data,
                 ltraj = type_1,
                 schema = "traj_db_t2",
                 pgtraj = "type_1_re"))
    expect_message(type_1_2 <- pgtraj2ltraj(conn_data, "type_1", "traj_db_t2"),
                   "successfully")
    expect_true(all.equal(type_1, type_1_2))
    
    try(
        for(pg in c("type_1_re", "type_1")) {
            pgtrajDrop(conn_data, schema = "traj_db_t2",
                       pgtraj = pg, full_clean = TRUE)
        }
    )
})

test_that("relocations are provided as X,Y coordinates", {
    testthat::skip_on_cran()
    expect_true(
        asPgtraj(
            conn_data,
            schema = "traj_t2",
            relocations_table = c("example_data", "relocations_plus"),
            pgtrajs = "id",
            animals = "animal",
            bursts = "burst",
            relocations = c("x", "y"),
            clauses = "where id = 'medium'",
            timestamps = "time",
            rid = "gid",
            srid = 4326,
            note = "note"
        )
    )
    expect_message(medium <- pgtraj2ltraj(conn_data, "medium", "traj_t2"),
                   "successfully")
    
    try(pgtrajDrop(conn_data, schema = "traj_t2", pgtraj = "medium", full_clean = TRUE))
})

test_that("variables provided manually", {
    testthat::skip_on_cran()
    expect_true(
        asPgtraj(
            conn_data,
            schema = "traj_t3",
            relocations_table = c("example_data", "reloc_medium"),
            pgtrajs = "medium",
            animals = "sea turtle",
            relocations = "geom",
            timestamps = "time",
            rid = "gid"
        )
    )
    expect_message(medium <- pgtraj2ltraj(conn_data, "medium", "traj_t3"),
                   "successfully")
    
    try(pgtrajDrop(conn_data, schema = "traj_t3", pgtraj = "medium", full_clean = TRUE))
})
