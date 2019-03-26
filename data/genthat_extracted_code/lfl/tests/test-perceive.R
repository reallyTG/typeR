test_that('perceive global', {
    .vars <- c(rep('a', 3),
              rep('b', 3),
              rep('c', 3),
              rep('d', 3))
    names(.vars) <- paste(rep(c('VeSm', 'Sm', 'Bi'), times=4),
                         rep(c('a', 'b', 'c', 'd'), each=3),
                         sep='.')

    .specs <- matrix(c(0,1,0, 0,0,0, 0,0,0, 0,0,0,
                      0,0,0, 0,0,0, 0,0,0, 0,0,0,
                      0,0,0, 0,0,0, 0,0,0, 0,0,0,

                      0,0,0, 0,1,0, 0,0,0, 0,0,0,
                      0,0,0, 0,0,0, 0,0,0, 0,0,0,
                      0,0,0, 0,0,0, 0,0,0, 0,0,0,

                      0,0,0, 0,0,0, 0,1,0, 0,0,0,
                      0,0,0, 0,0,0, 0,0,0, 0,0,0,
                      0,0,0, 0,0,0, 0,0,0, 0,0,0,

                      0,0,0, 0,0,0, 0,0,0, 0,1,0,
                      0,0,0, 0,0,0, 0,0,0, 0,0,0,
                      0,0,0, 0,0,0, 0,0,0, 0,0,0),
                    byrow=TRUE,
                    ncol=12)
    colnames(.specs) = names(.vars)
    rownames(.specs) = names(.vars)

    runPerceive <- function(...) {
        ret <- perceive(list(...), .vars, .specs)
        return(ret)
    }

    expect_equal(runPerceive(c('Sm.d', 'Sm.a', 'Bi.c'),
                             c('Sm.d', 'VeSm.a', 'Bi.c'),
                             c('Sm.d', 'Sm.b', 'Sm.c')),
                 c(F, T, T))

    expect_equal(runPerceive(c('Sm.d', 'Sm.a', 'Bi.c'),
                             c('Sm.d', 'VeSm.a', 'Sm.c'),
                             c('Sm.d', 'Sm.b', 'Sm.c')),
                 c(T, T, T))

    expect_equal(runPerceive(c('Sm.d', 'Sm.a', 'Bi.c'),
                             c('Bi.d', 'VeSm.a', 'Bi.c'),
                             c('Sm.d', 'Sm.b', 'Sm.c')),
                 c(F, T, T))
})


test_that('perceive local', {
    .vars <- c(rep('a', 3),
              rep('b', 3),
              rep('c', 3),
              rep('d', 3))
    names(.vars) <- paste(rep(c('VeSm', 'Sm', 'Bi'), times=4),
                         rep(c('a', 'b', 'c', 'd'), each=3),
                         sep='.')

    .specs <- matrix(c(0,1,0, 0,0,0, 0,0,0, 0,0,0,
                      0,0,0, 0,0,0, 0,0,0, 0,0,0,
                      0,0,0, 0,0,0, 0,0,0, 0,0,0,

                      0,0,0, 0,1,0, 0,0,0, 0,0,0,
                      0,0,0, 0,0,0, 0,0,0, 0,0,0,
                      0,0,0, 0,0,0, 0,0,0, 0,0,0,

                      0,0,0, 0,0,0, 0,1,0, 0,0,0,
                      0,0,0, 0,0,0, 0,0,0, 0,0,0,
                      0,0,0, 0,0,0, 0,0,0, 0,0,0,

                      0,0,0, 0,0,0, 0,0,0, 0,1,0,
                      0,0,0, 0,0,0, 0,0,0, 0,0,0,
                      0,0,0, 0,0,0, 0,0,0, 0,0,0),
                    byrow=TRUE,
                    ncol=12)
    colnames(.specs) = names(.vars)
    rownames(.specs) = names(.vars)

    runPerceive <- function(..., fired) {
        return(perceive(list(...), .vars, .specs, type='local', fired=fired))
    }

    expect_equal(runPerceive(c('Sm.d', 'Sm.a', 'Bi.c'),
                             c('Sm.d', 'VeSm.a', 'Bi.c'),
                             fired=c(0.3, 0.4)),
                 c(F, T))

    expect_equal(runPerceive(c('Sm.d', 'Sm.a', 'Bi.c'),
                             c('Sm.d', 'VeSm.a', 'Bi.c'),
                             fired=c(0.4, 0.3)),
                 c(T, F))

    expect_equal(runPerceive(c('Sm.d', 'Sm.a', 'Bi.c'),
                             c('Sm.d', 'VeSm.a', 'Bi.c'),
                             fired=c(0.4, 0.4)),
                 c(F, T))

    expect_equal(runPerceive(c('Sm.d', 'Sm.a', 'Bi.c'),
                             c('Sm.d', 'VeSm.a', 'Bi.c'),
                             fired=c(1, 1)),
                 c(F, T))
})
