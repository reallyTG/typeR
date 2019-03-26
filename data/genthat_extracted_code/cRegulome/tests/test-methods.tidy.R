context('methods.tidy')

# connect to the db file
fl <- system.file('extdata', 'cRegulome.db', package = 'cRegulome')
conn <- RSQLite::dbConnect(RSQLite::SQLite(), fl)

test_that('cor_tidy output a data.frame identical to output of get_mir', {
    dat <- get_mir(conn,
                   mir = 'hsa-let-7g',
                   study = 'STES',
                   min_abs_cor = .3,
                   max_num = 5)
    
    cmir <- cmicroRNA(dat)
    tidy_cmir <- cor_tidy(cmir)
    
    expect_equal(dat, tidy_cmir)
})

test_that('cor_tidy works with mulitple queries', {
    dat <- get_mir(conn,
                   mir = c('hsa-let-7g', 'hsa-mir-149'),
                   study = 'STES',
                   max_num = 5)

    cmir <- cmicroRNA(dat)
    tidy_cmir <- cor_tidy(cmir)
    
    expect_true(all(dat$mirna_base %in% tidy_cmir$mirna_base))
    expect_true(all(dat$feature %in% tidy_cmir$feature))
})

test_that('tidy output a data.frame identical to output of get_tf', {
    dat <- get_tf(conn,
                  tf = 'LEF1',
                  study = 'STES',
                  min_abs_cor = .3,
                  max_num = 5)
    
    ctf <- cTF(dat)
    tidy_tf <- cor_tidy(ctf)
    
    expect_equal(dat, tidy_tf)
})


test_that("cor_igraph retruns a the proper object", {
    dat <- get_mir(conn,
                   mir = 'hsa-let-7g',
                   study = 'STES',
                   min_abs_cor = .3,
                   max_num = 5)
    
    cmir <- cmicroRNA(dat)
    
    g <- cor_igraph(cmir)
    expect_s3_class(g, 'igraph')
    
    dat <- get_tf(conn,
                  tf = 'LEF1',
                  study = 'STES',
                  min_abs_cor = .3,
                  max_num = 5)
    
    ctf <- cTF(dat)
    g <- cor_igraph(ctf)
    expect_s3_class(g, 'igraph')
})

test_that('cor_prep works', {
    dat <- get_tf(conn,
                  tf = 'LEF1',
                  study = 'STES',
                  min_abs_cor = .3,
                  max_num = 5)
    
    ctf <- cTF(dat)
    df <- cor_prep(ctf, 'STES')
    expect_true(is.data.frame(df))
    expect_true('Direction' %in% names(df))
    expect_true('Correlation' %in% names(df))
    expect_equal(unique(df$study), 'STES')
})

test_that('cor_prep works with multiple queries', {
    dat <- get_mir(conn,
                   mir = c('hsa-let-7g', 'hsa-let-7i'),
                   study = 'STES')
    
    cmir <- cmicroRNA(dat)
    
    df <- cor_prep(cmir, 'STES')
    expect_true(is.data.frame(df))
    expect_true('Direction' %in% names(df))
    expect_true('Correlation' %in% names(df))
    expect_equal(unique(df$study), "STES")
})

# clean up
RSQLite::dbDisconnect(conn)
