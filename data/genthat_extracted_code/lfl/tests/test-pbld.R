test_that('pbld', {
    # init fsets
    .vars <- c(rep('b', 3),
               rep('c', 3))
    names(.vars) <- paste(rep(c('VeSm', 'Sm', 'Bi'), times=2),
                          rep(c('b', 'c'), each=3),
                          sep='.')


    .specs <- matrix(c(0,1,0, 0,0,0,
                       0,0,0, 0,0,0,
                       0,0,0, 0,0,0,
 
                       0,0,0, 0,1,0,
                       0,0,0, 0,0,0,
                       0,0,0, 0,0,0),
                     byrow=TRUE,
                     ncol=6)
    colnames(.specs) <- names(.vars)
    rownames(.specs) <- names(.vars)

    x <- matrix(runif(18), ncol=6, nrow=3)
    colnames(x) <- names(.vars)

    x <- fsets(x, vars=.vars, specs=.specs)

    # init rules
    rules <- list(c('Sm.b', 'VeSm.c'),
                  c('Sm.b', 'Sm.c'),
                  c('Bi.b', 'Bi.b'),
                  c('Bi.b', 'Sm.c', 'Sm.b'))

    # init values
    values <- 0:10 / 10

    # init partition
    partition <- lcut3(data.frame(b=values))


    res <- pbld(x, rules, partition, values)
    expect_equal(nrow(x), length(res))
    #expect_true(FALSE)
})


test_that('pbld with empty rulebase', {
    # init fsets
    .vars <- c(rep('b', 3),
               rep('c', 3))
    names(.vars) <- paste(rep(c('VeSm', 'Sm', 'Bi'), times=2),
                          rep(c('b', 'c'), each=3),
                          sep='.')


    .specs <- matrix(c(0,1,0, 0,0,0,
                       0,0,0, 0,0,0,
                       0,0,0, 0,0,0,
 
                       0,0,0, 0,1,0,
                       0,0,0, 0,0,0,
                       0,0,0, 0,0,0),
                     byrow=TRUE,
                     ncol=6)
    colnames(.specs) <- names(.vars)
    rownames(.specs) <- names(.vars)

    x <- matrix(runif(18), ncol=6, nrow=3)
    colnames(x) <- names(.vars)

    x <- fsets(x, vars=.vars, specs=.specs)

    # init rules
    rules <- list()

    # init values
    values <- 0:10 / 10

    # init partition
    partition <- lcut3(data.frame(b=values))


    res <- pbld(x, rules, partition, values)
    expect_equal(nrow(x), length(res))
})


test_that('pbld complete test', {
    x <- matrix(seq(0, 0.4, 0.025), nrow=17, ncol=1)
    colnames(x) <- 'x'
    inputContext <- c(0, 0.4, 1)
    input <- lcut3(x, context=inputContext)

    rules <- list(c('Bi.y', 'Sm.x'),
                c('Me.y', 'RoSm.x'),
                c('VeSm.y', 'ExSm.x'))

    outputContext <- c(0, 0.4, 1)
    v <- slices(outputContext[1], outputContext[3], 1000)
    p <- lcut3(v, name='y', context=outputContext)

    expect_equal(round(pbld(input, rules, p, v), 2), 
                 c(0.03, 0.91, 0.91, 0.41, 0.41, 0.41, 0.41, 0.42, 0.44, 0.45, rep(0, 7)))
})
