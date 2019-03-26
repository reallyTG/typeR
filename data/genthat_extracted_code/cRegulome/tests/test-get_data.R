context('get_data')

# remove db file if exists
if(file.exists('cRegulome.db')) {
    unlink('cRegulome.db')
}

#test_that('get_db downlaods db file succussfully', {
#    get_db(test = TRUE)
#    fl <- paste(tempdir(), 'cRegulome.db', sep = '/')
#    
#    expect_true(file.exists(fl))
#    
#    if(file.exists(fl)) unlink(fl)
#})

#test_that('get_db downloads db file to certain location', {
#    get_db(test = TRUE,
#           destfile = './cRegulome.db')
#    
#    fl <- './cRegulome.db'
#    expect_true(file.exists(fl))
#    
#    if(file.exists(fl)) unlink(fl)
#})

# connect to the db file

fl <- system.file('extdata', 'cRegulome.db', package = 'cRegulome')
conn <- RSQLite::dbConnect(RSQLite::SQLite(), fl)

test_that('stat_make works', {
    stat <- stat_make('hsa-let-7g',
                      study = 'STES')
    expect_identical(
        stat,
        'SELECT cor_mir.mirna_base, cor_mir.feature, cor_mir.STES FROM cor_mir WHERE cor_mir.mirna_base=\"hsa-let-7g\"')
    
    df <- RSQLite::dbGetQuery(conn, stat)
    
    expect_true(is.data.frame(df))
    expect_identical(unique(df$mirna_base), 'hsa-let-7g')
    expect_identical(names(df)[3], 'STES')
})

test_that('stat_make works with filters', {
    stat <- stat_make('hsa-let-7g',
                      study = 'STES',
                      min_abs_cor = .3,
                      max_num = 5)
    expect_identical(
        stat,
        paste(
            'SELECT cor_mir.mirna_base, cor_mir.feature, cor_mir.STES FROM cor_mir WHERE cor_mir.mirna_base=\"hsa-let-7g\"',
            "AND ABS(cor_mir.STES) > 30",
            "ORDER BY ABS(cor_mir.STES) DESC LIMIT 5"
        ))
    
    df <- RSQLite::dbGetQuery(conn, stat)
    
    expect_true(is.data.frame(df))
    expect_identical(unique(df$mirna_base), 'hsa-let-7g')
    expect_identical(names(df)[3], 'STES')
    expect_true(min(df$STES) > 30)
    expect_equal(nrow(df), 5)
})

test_that('stat_make works for tf', {
    stat <- stat_make('LEF1',
                      study = 'STES',
                      type = 'tf')
    expect_identical(
        stat,
        'SELECT cor_tf.tf, cor_tf.feature, cor_tf.STES FROM cor_tf WHERE cor_tf.tf=\"LEF1\"')
    
    df <- RSQLite::dbGetQuery(conn, stat)
    
    expect_true(is.data.frame(df))
    expect_identical(unique(df$tf), 'LEF1')
    expect_identical(names(df)[3], 'STES')
})

test_that("stat_collect works", {
    stat <- stat_make('hsa-let-7g',
                      study = 'STES')
    
    df <- stat_collect(conn, 'STES', stat)
    
    expect_true(is.data.frame(df))
    expect_equal(ncol(df), 4)
    expect_identical(unique(df$mirna_base), 'hsa-let-7g')
    expect_identical(unique(df$study), 'STES')
})

test_that("stat_make_targets work", {
    stat <- stat_make_targets(reg = 'LEF1',
                              study = 'STES',
                              type = 'tf')
    expect_equal(stat, "SELECT feature FROM targets_tf WHERE tf = \"LEF1\" AND study=\"STES\"")
    
    stat <- stat_make_targets(reg = 'hsa-let-7g',
                              study = 'STES')
    expect_equal(stat, "SELECT feature FROM targets_mir WHERE mirna_base = \"hsa-let-7g\"")
})

test_that("stat_collect_targets work", {
    stat <- stat_make_targets(reg = 'hsa-let-7g',
                              study = 'STES')
    tars <- stat_collect_targets(conn, 
                                 stat = stat)
    
    expect_true(is.character(tars))
    expect_true(length(tars) > 0)
    
    stat <- stat_make_targets(reg = 'LEF1',
                              study = 'STES',
                              type = 'tf')
    tars <- stat_collect_targets(conn, 
                                 stat = stat)
    
    expect_true(is.character(tars))
    expect_true(length(tars) > 0)
})

test_that('stat_collect returns df with nrow 0 when reg is not id db', {
    stat <- stat_make('AAA',
                      study = 'STES')
    df <- stat_collect(conn, 'STES', stat)
    expect_true(is.data.frame(df))
    expect_equal(nrow(df), 0)
    
    stat <- stat_make('AAA',
                      study = 'STES',
                      type = 'tf')
    df <- stat_collect(conn, 'STES', stat, type = 'tf')
    expect_true(is.data.frame(df))
    expect_equal(nrow(df), 0)
})

test_that('get_mir works', {
    df <- get_mir(conn, 
                  mir = 'hsa-let-7g',
                  study = 'STES')
    
    expect_true(is.data.frame(df))
    expect_equal(ncol(df), 4)
    expect_identical(unique(df$mirna_base), 'hsa-let-7g')
    expect_identical(unique(df$study), 'STES')
})

test_that('get_mir collect all studies', {
    df <- get_mir(conn, 
                  mir = 'hsa-let-7g')
    expect_identical(unique(df$study), 'STES')
})

test_that('get_mir works with multiple queries', {
    df <- get_mir(conn, 
                  mir = c('hsa-let-7g', 'hsa-mir-149'),
                  study = 'STES')
    
    expect_true(is.data.frame(df))
    expect_equal(ncol(df), 4)
    expect_identical(unique(df$mirna_base), c('hsa-let-7g', 'hsa-mir-149'))
    expect_identical(unique(df$study), 'STES')
})

test_that('get_mir works with multiple queries and filters', {
    df <- get_mir(conn, 
                  mir = c('hsa-let-7g', 'hsa-mir-149'),
                  study = 'STES',
                  max_num = 5)
    
    expect_true(is.data.frame(df))
    expect_true(nrow(df) >= 10)
    
    df <- get_mir(conn, 
                  mir = c('hsa-let-7g', 'hsa-mir-149'),
                  study = 'STES',
                  min_abs_cor = .2)
    expect_true(is.data.frame(df))
    expect_true(abs(min(df$cor)) >= .2)
})

test_that("get_mir returns skips mir that doesn't exist in db", {
    df <- get_mir(conn, 
                  mir = 'AAA',
                  study = 'STES')
    
    expect_true(is.data.frame(df))
    expect_equal(nrow(df), 0)
    
    df <- get_mir(conn, 
                  mir = c('hsa-let-7g', 'AAA'),
                  study = 'STES')
    
    expect_true(is.data.frame(df))
    expect_true(!'AAA' %in% unique(df$mirna_base))
})

test_that('get_mir works with targets', {
    df <- get_mir(conn, 
                  mir = 'hsa-let-7g',
                  study = 'STES',
                  targets_only = TRUE)
    
    expect_true(is.data.frame(df))
    expect_equal(ncol(df), 4)
    expect_identical(unique(df$mirna_base), 'hsa-let-7g')
    expect_identical(unique(df$study), 'STES')
    
    df <- get_mir(conn, 
                  mir = 'hsa-let-7g',
                  study = 'STES',
                  targets = c('ABL2', 'ACTR10'))
    
    expect_true(is.data.frame(df))
    expect_equal(ncol(df), 4)
    expect_identical(unique(df$mirna_base), 'hsa-let-7g')
    expect_identical(unique(df$study), 'STES')
})

test_that('get_mir handels errors', {
    expect_error(get_mir(conn))
    expect_error(get_mir(conn, list('hsa-let-7g')))
    expect_error(get_mir(conn, 
                         mir = 'hsa-let-7g',
                         study = list('STES')))
    expect_error(get_mir(conn, 
                         mir = 'hsa-let-7g',
                         study = 'STES',
                         min_abs_cor = '1'))
    expect_error(get_mir(conn, 
                         mir = 'hsa-let-7g',
                         study = 'STES',
                         min_abs_cor = 2))
    expect_error(get_mir(conn, 
                         mir = 'hsa-let-7g',
                         study = 'STES',
                         max_num = -1))
    expect_error(get_mir(conn, 
                         mir = 'hsa-let-7g',
                         study = 'STES',
                         max_num = '1'))
})

test_that('get_tf works', {
    df <- get_tf(conn, 
                 tf = 'LEF1',
                 study = 'STES')
    
    expect_true(is.data.frame(df))
    expect_equal(ncol(df), 4)
    expect_identical(unique(df$tf), 'LEF1')
    expect_identical(unique(df$study), 'STES')
})

test_that('get_tf works with multiple queries', {
    df <- get_tf(conn, 
                 tf = c('LEF1', 'MYB'),
                 study = 'STES')
    
    expect_true(is.data.frame(df))
    expect_equal(ncol(df), 4)
    expect_identical(unique(df$tf), c('LEF1', 'MYB'))
    expect_identical(unique(df$study), 'STES')
})

test_that("get_tf returns skips tf that doesn't exist in db", {
    df <- get_tf(conn, 
                 tf = 'AAA',
                 study = 'STES')
    
    expect_true(is.data.frame(df))
    expect_equal(nrow(df), 0)
    
    df <- get_tf(conn, 
                  tf = c('LEF1', 'AAA'),
                  study = 'STES')
    
    expect_true(is.data.frame(df))
    expect_true(!'AAA' %in% unique(df$mirna_base))
})

test_that('get_tf works with more than two tfs', {
    df <- get_tf(conn,
                 tf = c("TFAP2A", "ETV4", "LEF1", "MYB", "MYBL2"),
                 study = 'STES')
    expect_true(is.data.frame(df))
})

test_that('get_tf works with targets', {
    df <- get_tf(conn, 
                 tf = 'LEF1',
                 study = 'STES',
                 targets_only = TRUE)
    
    expect_true(is.data.frame(df))
    expect_equal(ncol(df), 4)
    expect_identical(unique(df$tf), 'LEF1')
    expect_identical(unique(df$study), 'STES')
    
    df <- get_tf(conn, 
                 tf = 'LEF1',
                 study = 'STES',
                 targets = c('A2M', 'A4GALT'))
    
    expect_true(is.data.frame(df))
    expect_equal(ncol(df), 4)
    expect_identical(unique(df$tf), 'LEF1')
    expect_identical(unique(df$study), 'STES')
})

test_that('get_tf handels errors', {
    expect_error(get_tf(conn))
    expect_error(get_tf(conn, list('LEF1')))
    expect_error(get_tf(conn, 
                        tf = 'LEF1',
                        study = list('STES')))
    expect_error(get_tf(conn, 
                         tf = 'LEF1',
                         study = 'STES',
                         min_abs_cor = '1'))
    expect_error(get_tf(conn, 
                         tf = 'LEF1',
                         study = 'STES',
                         min_abs_cor = 2))
    expect_error(get_tf(conn, 
                         tf = 'LEF1',
                         study = 'STES',
                         max_num = -1))
    expect_error(get_tf(conn, 
                        tf = 'LEF1',
                        study = 'STES',
                        max_num = '1'))
})

# clean up
RSQLite::dbDisconnect(conn)