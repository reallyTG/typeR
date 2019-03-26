context("object")

# connect to the db file
fl <- system.file('extdata', 'cRegulome.db', package = 'cRegulome')
conn <- RSQLite::dbConnect(RSQLite::SQLite(), fl)

test_that('objects cmicroRNA are constructed properly', {
    dat <- get_mir(conn,
                   mir = 'hsa-let-7g',
                   study = 'STES',
                   min_abs_cor = .3,
                   max_num = 5)
    cmir <- cmicroRNA(dat)
    
    expect_s3_class(cmir, 'cmicroRNA')
    expect_identical(names(cmir), c("microRNA", "features", "studies", "corr"))
    expect_identical(cmir$microRNA, 'hsa-let-7g')
    expect_identical(cmir$studies, 'STES')
    expect_equal(length(cmir$features), 5)
    expect_true(min(abs(cmir$corr[[1]][ ,1])) > .3)
})

test_that('objects cmicroRNA are constructed from multiple queries and filters', {
    dat <- get_mir(conn, 
                   mir = c('hsa-let-7g', 'hsa-mir-149'),
                   study = 'STES',
                   max_num = 5)
    cmir <- cmicroRNA(dat)
    
    expect_s3_class(cmir, 'cmicroRNA')
    expect_identical(names(cmir), c("microRNA", "features", "studies", "corr"))
    expect_identical(cmir$microRNA, c('hsa-let-7g', 'hsa-mir-149'))
    expect_identical(cmir$studies, 'STES')
    expect_true(nrow(cmir$corr[[1]]) >= 5)
})

test_that('objects cTF are constructed properly', {
    dat <- get_tf(conn,
                  tf = 'LEF1',
                  study = 'STES',
                  min_abs_cor = .3,
                  max_num = 5)
    ctf <- cTF(dat)
    
    expect_s3_class(ctf, 'cTF')
    expect_identical(names(ctf), c("TF", "features", "studies", "corr"))
    expect_identical(ctf$TF, 'LEF1')
    expect_identical(ctf$studies, 'STES')
    expect_equal(length(ctf$features), 5)
    expect_true(min(abs(ctf$corr[[1]][, 1])) > .3)
})

test_that('cTF works with more than two tfs', {
    tf = c("TFAP2A", "ETV4", "LEF1", "MYB", "MYBL2")
    dat <- get_tf(conn,
                 tf  = tf,
                 study = 'STES')
    ctf <- cTF(dat)
    expect_equal(class(ctf), 'cTF')
    expect_true(all(colnames(ctf$corr[[1]]) %in% tf))
})
# clean up
RSQLite::dbDisconnect(conn)