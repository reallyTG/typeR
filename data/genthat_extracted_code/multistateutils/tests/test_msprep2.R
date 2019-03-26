library(testthat)

context("msprep2")

long_fn <- tempfile()
entry_fn <- tempfile()
covars_fn <- tempfile()
censors_fn <- tempfile()

setup({
    library(mstate)
    library(flexsurv)

    data(ebmt3)
    tmat <- mstate::trans.illdeath(c('transplant', 'pr', 'rfs'))
    long <- mstate::msprep(time=c(NA, 'prtime', 'rfstime'), 
                       status=c(NA, 'prstat', 'rfsstat'), 
                       data=ebmt3, 
                       trans=tmat, 
                       keep=c('age', 'dissub'))
    
    # Form long version of ebmt3, i.e. each row with new entry
    pr_entry <- ebmt3[ebmt3$prstat == 1, c('id', 'prtime')]
    pr_entry$time <- pr_entry$prtime
    pr_entry$state <- 'pr'
    pr_entry <- pr_entry[, c('id', 'time', 'state')]
    
    rfs_entry <- ebmt3[ebmt3$rfsstat == 1, c('id', 'rfstime')]
    rfs_entry$time <- rfs_entry$rfstime
    rfs_entry$state <- 'rfs'
    rfs_entry <- rfs_entry[, c('id', 'time', 'state')]
    
    entry <- rbind(pr_entry, rfs_entry)
    entry <- entry[, c('id', 'state', 'time')]
    entry <- entry[order(entry$id, entry$time), ]
    
    # Also need separate columns for covars and censor time
    covars <- ebmt3[, c('id', 'age', 'dissub')]
    censor_time <- ebmt3
    censor_time$censor_time <- ifelse(censor_time$prstat == 0, censor_time$prtime,
                                      ifelse(censor_time$rfsstat == 0, censor_time$rfstime, NA))
    censor_time <- censor_time[, c('id', 'censor_time')]

    saveRDS(entry, entry_fn)
    saveRDS(covars, covars_fn)
    saveRDS(censor_time, censors_fn)
    saveRDS(long, long_fn)

})

teardown({
    unlink(entry_fn)
    unlink(covars_fn)
    unlink(censors_fn)
    unlink(long_fn)
})

test_that("msprep2 produces same output on ebmt3 as msprep", {
    entry <- readRDS(entry_fn)
    censor_time <- readRDS(censors_fn)
    covars <- readRDS(covars_fn)
    long <- readRDS(long_fn)
    tmat <- mstate::trans.illdeath(c('transplant', 'pr', 'rfs'))
    
    full <- msprep2(entry, tmat, censors = censor_time, covars=covars)
    
    expect_equal(dim(full), dim(long))
    
    # Each column has exact same values
    expect_equal(all(sapply(colnames(full), function(x) {
        all(full[[x]] == long[[x]])
    })), TRUE)
})

test_that("msprep2 idcolumn works", {
    entry <- readRDS(entry_fn)
    censor_time <- readRDS(censors_fn)
    covars <- readRDS(covars_fn)
    long <- readRDS(long_fn)
    tmat <- mstate::trans.illdeath(c('transplant', 'pr', 'rfs'))
    
    entry2 <- entry 
    censor2 <- censor_time 
    covars2 <- covars 
    
    entry2$patid <- entry$id
    censor2$patid <- censor2$id
    covars2$patid <- covars2$id
    
    entry2 <- entry2[, setdiff(colnames(entry2), 'id')]
    censor2 <- censor2[, setdiff(colnames(censor2), 'id')]
    covars2 <- covars2[, setdiff(colnames(covars2), 'id')]
    
    full <- msprep2(entry2, tmat, censors = censor2, covars=covars2, idcol='patid')
    
    expect_equal(dim(full), dim(long))
    
    # Each column has exact same values
    expect_equal(all(sapply(colnames(full), function(x) {
        all(full[[x]] == long[[x]])
    })), TRUE)
})

test_that("msprep2 entry guards work", {
    entry <- readRDS(entry_fn)
    censor_time <- readRDS(censors_fn)
    covars <- readRDS(covars_fn)
    long <- readRDS(long_fn)
    tmat <- mstate::trans.illdeath(c('transplant', 'pr', 'rfs'))
    
    
    # Test with duplicate times
    entry2 <- entry
    entry2[3, 'time'] <- 35
    expect_error(msprep2(entry2, tmat, censors = censor_time, covars=covars),
                 "Error: each id in entry must have unique state entry times.")
    
    entry3 <- entry
    entry3$t <- entry3$time
    entry3 <- entry3[, setdiff(colnames(entry3), 'time')]
    
    expect_error(msprep2(entry3, tmat, censors = censor_time, covars=covars),
                 "Error: column 'time' not found in entry.")
    
    entry4 <- entry
    entry4$stat <- entry4$state
    entry4 <- entry4[, setdiff(colnames(entry4), 'state')]
    expect_error(msprep2(entry4, tmat, censors = censor_time, covars=covars),
                 "Error: column 'state' not found in entry.")
    
    entry5 <- entry
    entry5$patid <- entry5$id
    entry5 <- entry5[, setdiff(colnames(entry5), 'id')]
    expect_error(msprep2(entry5, tmat, censors = censor_time, covars=covars),
                 "Error: id field 'id' not found in entry.")
    expect_error(msprep2(entry, tmat, censors = censor_time, covars=covars, idcol='patid'),
                 "Error: id field 'patid' not found in entry.")
})

test_that("msprep2 covars guards work", {
    entry <- readRDS(entry_fn)
    censor_time <- readRDS(censors_fn)
    covars <- readRDS(covars_fn)
    long <- readRDS(long_fn)
    tmat <- mstate::trans.illdeath(c('transplant', 'pr', 'rfs'))
    
    # Test without idcol
    expect_error(msprep2(entry, tmat, censors = censor_time,
                         covars=data.frame(age=50:59)),
                 "Error: id field 'id' not found in covars.")
    expect_error(msprep2(entry, tmat, censors = censor_time,
                         covars=data.frame(patid=1:10, age=50:59)),
                 "Error: id field 'id' not found in covars.")
    
    # Test that works even when don't have covariate info for everyone
    full <- msprep2(entry, tmat, censors = censor_time, 
                    covars=data.frame(id=1:10, age=50:59))
    expect_equal(ncol(full), 9)
    expect_equal(nrow(full) >= nrow(ebmt3), TRUE)
    
    output_age <- full$age[full$id %in% seq(10)]
    output_noage <- full$age[!full$id %in% seq(10)]
    
    expect_equal(all(!is.na(output_age)), TRUE)
    expect_equal(all(is.na(output_noage)), TRUE)
})
    
test_that("msprep2 start_time guards work", {
    entry <- readRDS(entry_fn)
    censor_time <- readRDS(censors_fn)
    covars <- readRDS(covars_fn)
    long <- readRDS(long_fn)
    tmat <- mstate::trans.illdeath(c('transplant', 'pr', 'rfs'))
    
    
    # Should work with missing start times
    start_missing <- data.frame(id=1:10, start_time=1)
    full <- msprep2(entry, tmat, censors = censor_time, covars=covars, start_times = start_missing)
    expect_equal(ncol(full), 10)
    expect_equal(nrow(full) >= nrow(ebmt3), TRUE)
    start_times <- full$Tstart[full$id %in% seq(10) & full$from == 1]
    default_start_times <- full$Tstart[!full$id %in% seq(10) & full$from == 1]
    expect_equal(all(start_times == 1), TRUE)
    expect_equal(all(default_start_times == 0), TRUE)
    
    # Shouldn't work when don't have id column or start_time column
    expect_error(msprep2(entry, tmat, censors = censor_time, covars=covars,
                         start_times = data.frame(patid=1:10, start_time=2)),
                 "Error: id field 'id' not found in start_times.")
    expect_error(msprep2(entry, tmat, censors = censor_time, covars=covars,
                         start_times = data.frame(id=1:10, time=2)),
                 "Error: column start_time not found in start_times.")
    
    # start times less than max entry times and censor times
    
})
    
test_that("msprep2 start_states guards work", {
    entry <- readRDS(entry_fn)
    censor_time <- readRDS(censors_fn)
    covars <- readRDS(covars_fn)
    long <- readRDS(long_fn)
    tmat <- mstate::trans.illdeath(c('transplant', 'pr', 'rfs'))
    
    # Shouldn't work when don't have id column or start_time column
    expect_error(msprep2(entry, tmat, censors = censor_time, covars=covars,
                         start_states = data.frame(patid=1:10, start_state=1)),
                 "Error: id field 'id' not found in start_states.")
    expect_error(msprep2(entry, tmat, censors = censor_time, covars=covars,
                         start_states = data.frame(id=1:10, state=1)),
                 "Error: column start_state not found in start_states.")
    
    # start states without id for everyong
    start_missing <- data.frame(id=1:10, start_state=2)
    # Expect this to work actually as it should fill in starting states for remainder
    full <- msprep2(entry, tmat, censors = censor_time, covars=covars, start_states = start_missing)
    expect_equal(ncol(full), 10)
    expect_equal(nrow(full) >= nrow(ebmt3), TRUE)
    
    
    start_states <- full$from[full$id %in% seq(10) & full$Tstart == 0]
    default_start_states <- full$from[!full$id %in% seq(10) & full$Tstart == 0]
    
    expect_equal(all(start_states == 2), TRUE)
    expect_equal(all(default_start_states == 1), TRUE)
    
    # start states not in tmat
    start_states <- data.frame(id=1:10, start_state=seq(10))
    expect_error(msprep2(entry, tmat, censors = censor_time, covars=covars, start_states = start_states),
                 "Error: start_state column must be state name or number.")
    
    # Should work with characters!
    start_states <- data.frame(id=1:9, start_state=rep(c('transplant', 'pr', 'rfs'), 3))
    full <- msprep2(entry, tmat, censors = censor_time, covars=covars, start_states = start_states)
    expect_equal(ncol(full), 10)
    expect_equal(nrow(full) >= nrow(ebmt3), TRUE)
    
    # Just not with characters that aren't in transition matrix
    start_states <- data.frame(id=1:9, start_state=rep(c('heal', 'illness', 'death'), 3))
    expect_error(msprep2(entry, tmat, censors = censor_time, covars=covars, start_states = start_states),
                 "Error: start_state column must be state name or number.")
})
                
test_that("msprep2 works with repeated state entries", {
    entry <- readRDS(entry_fn)
    censor_time <- readRDS(censors_fn)
    covars <- readRDS(covars_fn)
    long <- readRDS(long_fn)
    tmat <- mstate::trans.illdeath(c('transplant', 'pr', 'rfs'))
    
    # Can go A->B, A->C, B->A, B->C, thereby can have multiple entries to B
    # id 1 goes A->B, B->A, A->B, B->C
    # id 2 goes A->B, B->C
    # id 3 goes A->C
    # id 4 goes A->B, B->A, A->B
    # Entry every 5 units offset by id number
    df <- data.frame(id=c(rep(1, 4),
                          rep(2, 2),
                          rep(3, 1),
                          rep(4, 3)),
                     state=c('B', 'A', 'B', 'C',
                             'B', 'C',
                             'C',
                             'B', 'A', 'B'),
                     time=c(6, 11, 16, 21,
                            7, 12,
                            8,
                            9, 14, 19))
    tmat <- matrix(c(NA, 3, NA, 1, NA, NA, 2, 4, NA), nrow=3, ncol=3, dimnames=list(LETTERS[1:3],
                                                                                    LETTERS[1:3]))
    out <- msprep2(df, tmat)
    exp_out <- data.frame(do.call('rbind', list(
                                     data.frame(id=1, from=1, to=2, trans=1, Tstart=0, Tstop=6, time=6, status=1),
                                     data.frame(id=1, from=1, to=3, trans=2, Tstart=0, Tstop=6, time=6, status=0),
                                     data.frame(id=1, from=2, to=1, trans=3, Tstart=6, Tstop=11, time=5, status=1),
                                     data.frame(id=1, from=2, to=3, trans=4, Tstart=6, Tstop=11, time=5, status=0),
                                     data.frame(id=1, from=1, to=2, trans=1, Tstart=11, Tstop=16, time=5, status=1),
                                     data.frame(id=1, from=1, to=3, trans=2, Tstart=11, Tstop=16, time=5, status=0),
                                     data.frame(id=1, from=2, to=1, trans=3, Tstart=16, Tstop=21, time=5, status=0),
                                     data.frame(id=1, from=2, to=3, trans=4, Tstart=16, Tstop=21, time=5, status=1),
                                     
                                     data.frame(id=2, from=1, to=2, trans=1, Tstart=0, Tstop=7, time=7, status=1),
                                     data.frame(id=2, from=1, to=3, trans=2, Tstart=0, Tstop=7, time=7, status=0),
                                     data.frame(id=2, from=2, to=1, trans=3, Tstart=7, Tstop=12, time=5, status=0),
                                     data.frame(id=2, from=2, to=3, trans=4, Tstart=7, Tstop=12, time=5, status=1),
                                     
                                     data.frame(id=3, from=1, to=2, trans=1, Tstart=0, Tstop=8, time=8, status=0),
                                     data.frame(id=3, from=1, to=3, trans=2, Tstart=0, Tstop=8, time=8, status=1),
                                     
                                     data.frame(id=4, from=1, to=2, trans=1, Tstart=0, Tstop=9, time=9, status=1),
                                     data.frame(id=4, from=1, to=3, trans=2, Tstart=0, Tstop=9, time=9, status=0),
                                     data.frame(id=4, from=2, to=1, trans=3, Tstart=9, Tstop=14, time=5, status=1),
                                     data.frame(id=4, from=2, to=3, trans=4, Tstart=9, Tstop=14, time=5, status=0),
                                     data.frame(id=4, from=1, to=2, trans=1, Tstart=14, Tstop=19, time=5, status=1),
                                     data.frame(id=4, from=1, to=3, trans=2, Tstart=14, Tstop=19, time=5, status=0)
                                     )))
    # Check all columns are same
    expect_equal(dim(out), dim(exp_out))
    ncols <- ncol(out)
    column_check <- sapply(seq(ncols), function(i) all(out[, i] == exp_out[, i]))
    expect_equal(all(column_check), TRUE)
    
})