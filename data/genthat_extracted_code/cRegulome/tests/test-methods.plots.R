context("methods.plots")

# locate the testset file and connect
fl <- system.file('extdata', 'cRegulome.db', package = 'cRegulome')
conn <- RSQLite::dbConnect(RSQLite::SQLite(), fl)

# enter a custom query with different arguments
dat <- get_mir(conn,
               mir = c('hsa-let-7g', 'hsa-mir-149'),
               study = 'STES',
               max_num = 5)

# make a cmicroRNA object   
cmir <- cmicroRNA(dat)

# enter a custom query with different arguments
dat <- get_tf(conn, 
              tf = c('LEF1', 'MYB'),
              study = 'STES',
              max_num = 5)

# make a cTF object   
ctf <- cTF(dat)

test_that('cor_plot works', {
    g <- cor_plot(cmir)
    expect_equal(class(g), c("gg", "ggplot"))
    
    g <- cor_plot(ctf)
    expect_equal(class(g), c("gg", "ggplot"))
})

test_that('cor_venn_diagram works', {
    g <- cor_venn_diagram(cmir)
    expect_true(is.null(g))
    
    g <- cor_venn_diagram(ctf)
    expect_true(is.null(g))
})

test_that('cor_upset works', {
    g <- cor_upset(cmir)
    expect_true(is.null(g))
    
    g <- cor_upset(ctf)
    expect_true(is.null(g))
})

test_that('cor_hist works', {
    g <- cor_hist(cmir)
    expect_equal(class(g), 'histogram')
    
    g <- cor_hist(ctf)
    expect_equal(class(g), 'histogram')
})

test_that('cor_joy', {
    g <- cor_joy(cmir)
    expect_equal(class(g), c("gg", "ggplot"))
    
    g <- cor_joy(ctf)
    expect_equal(class(g), c("gg", "ggplot"))
})

# enter a custom query with a single regulator
dat <- get_mir(conn,
               mir = 'hsa-let-7g',
               study = 'STES',
               max_num = 5)

# make a cmicroRNA object   
cmir <- cmicroRNA(dat)

# enter a custom query with different arguments
dat <- get_tf(conn, 
              tf = 'MYB',
              study = 'STES',
              max_num = 5)

# make a cTF object   
ctf <- cTF(dat)

test_that('cor_venn_diagram handles errors', {
    expect_error(
        cor_venn_diagram(cmir)
    )

    expect_error(
        cor_venn_diagram(ctf)
    )
})

test_that('cor_upset handles error', {
    expect_error(
        cor_upset(cmir)
    )
    expect_error(
        cor_upset(ctf)
    )
})
# clean up
unlink('./*.log')
unlink('./*.pdf')

RSQLite::dbDisconnect(conn)
