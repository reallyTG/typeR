library(lfl)


### Name: is.specific
### Title: Determine whether the first set of predicates is more specific
###   (or equal) than the other.
### Aliases: is.specific
### Keywords: models robust

### ** Examples

    # create vars (v) and specs (s)
    v <- c(rep('a', 3), rep('b', 3), rep('c', 3), rep('d', 3))
    names(v) <- paste(rep(c('VeSm', 'Sm', 'Bi'), times=4),
                      rep(c('a', 'b', 'c', 'd'), each=3),
                      sep='.')

    s <- matrix(c(0,1,0, 0,0,0, 0,0,0, 0,0,0,
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
    colnames(s) = names(v)
    rownames(s) = names(v)

    # returns TRUE
    is.specific(c('VeSm.a', 'Bi.c'), 
                c('VeSm.a', 'Bi.c'),
                v, s)

    # returns TRUE (x and y swapped return FALSE)
    is.specific(c('VeSm.a', 'Bi.c', 'Sm.d'),
                c('Sm.a', 'Bi.c', 'Sm.d'),
                v, s)

    # returns TRUE (x and y swapped return FALSE)
    is.specific(c('VeSm.a', 'Bi.c', 'Sm.d'),
                c('VeSm.a', 'Bi.c'),
                v, s)

    # returns TRUE (x and y swapped return FALSE)
    is.specific(c('VeSm.a', 'Bi.c', 'Sm.d'),
                NULL,
                v, s)

    # returns FALSE
    is.specific(c('Sm.a'), c('Bi.c'), v, s)

    # returns FALSE
    is.specific(c('VeSm.a', 'Sm.c'),
                c('Sm.a', 'Bi.c'),
                v, s)



