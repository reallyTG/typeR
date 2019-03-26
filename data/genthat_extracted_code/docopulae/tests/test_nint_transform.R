library(docopulae)
context('nint_transform')

dfltNCube = nint_integrateNCube
dfltNFunc = nint_integrateNFunc

expect = function(tt, space, v, tolerance=NULL) {
    expect_named(tt,
                 c('f', 'space'))
    expect_identical(tt$space,
                     space)
    r = nint_integrate(tt$f, tt$space)
    if (is.null(tolerance))
        expect_equal(r,
                     v)
    else
        expect_equal(r,
                     v, tolerance=tolerance)
}


test_that('1D', {
    f = function(x) dnorm(x, mean=3, sd=1)
    space = nint_space(nint_intvDim(-Inf, Inf))
    tt = nint_transform(f, space, list(nint_tanTransform(3, 5, dIdcs=1)), funcDimToF=NULL)
    expect(tt, nint_space(nint_intvDim(-pi/2, pi/2)), 1)
})

test_that('2D, intvDim', {
    f = function(x) prod(dnorm(x, mean=c(3, -1), sd=c(1, 3)))
    space = nint_space(nint_intvDim(-Inf, Inf),
                       nint_intvDim(-Inf, Inf))

    tt = nint_transform(f, space, list(nint_tanTransform(3, 5, dIdcs=1)))
    expect(tt, nint_space(nint_intvDim(-pi/2, pi/2),
                          nint_intvDim(-Inf, Inf)), 1)

    tt = nint_transform(f, space, list(nint_tanTransform(3, 5, dIdcs=2)))
    expect(tt, nint_space(nint_intvDim(-Inf, Inf),
                          nint_intvDim(-pi/2, pi/2)), 1, tolerance=3.3e-8)

    tt = nint_transform(f, space, list(nint_tanTransform(c(3, 5), c(5, 7), dIdcs=1:2)))
    expect(tt, nint_space(nint_intvDim(-pi/2, pi/2),
                          nint_intvDim(-pi/2, pi/2)), 1)
})

test_that('2D, funcDim, no funcDimToF', {
    f = function(x) prod(dnorm(x, mean=c(3, -1), sd=c(1, 3)))
    space = nint_space(nint_intvDim(-Inf, Inf),
                       nint_funcDim(function(x) nint_intvDim(-Inf, x[1])))

    tt = nint_transform(f, space, list(nint_tanTransform(3, 5, dIdcs=1)), funcDimToF=c())
    expect_equal(nint_integrate(tt$f, tt$space),
                 0.89704839651959101, tolerance=6.8e-8)

    tt = nint_transform(f, space, list(nint_tanTransform(3, 5, dIdcs=2)), funcDimToF=c())
    expect_equal(nint_integrate(tt$f, tt$space),
                 0.89704839651959101)

    tt = nint_transform(f, space, list(nint_tanTransform(c(3, 5), c(5, 7), dIdcs=1:2)), funcDimToF=c())
    expect_equal(nint_integrate(tt$f, tt$space),
                 0.89704839651959101)
})

test_that('2D, funcDim', {
    f = function(x) sqrt(1 - x[1]^2 - x[2]^2)
    space = nint_space(nint_intvDim(-1, 1),
                       nint_funcDim(function(x) nint_intvDim(c(-1, 1)*sqrt(1 - x[1]^2))))
    tt = nint_transform(f, space, list())
    expect(tt, nint_space(nint_intvDim(-1, 1),
                          nint_intvDim(0, 1)), 4/3*pi / 2, tolerance=8e-8)

    tt = nint_transform(f, space, list(nint_tanTransform(3, 5, dIdcs=1)))
    expect(tt, nint_space(nint_intvDim(atan((-1 - 3)/5), atan((1 - 3)/5)),
                          nint_intvDim(0, 1)), 4/3*pi / 2)

    tt = nint_transform(f, space, list(nint_tanTransform(3, 5, dIdcs=2)))
    expect(tt, nint_space(nint_intvDim(-1, 1),
                          nint_intvDim(0, 1)), 4/3*pi / 2, tolerance=5e-8)

    tt = nint_transform(f, space, list(nint_tanTransform(c(3, 5), c(5, 7), dIdcs=1:2)))
    expect(tt, nint_space(nint_intvDim(atan((-1 - 3)/5), atan((1 - 3)/5)),
                          nint_intvDim(0, 1)), 4/3*pi / 2)
})

test_that('4D, funcDim, random', {
    f = function(x) sum(x)

    check = function(x, low, high)
        if (any(x < low) || any(high < x)) {
            #print(x)
            stop('function dimension got invalid arguments')
        }
    d1 = list(nint_intvDim(1, 1.5),
              nint_intvDim(1.5, 2))
    d2 = list(nint_intvDim(1.5, 2.5),
              nint_funcDim(function(x) {
                  check(x[1], 1, 2)
                  nint_intvDim(1.5, 1.5 + x[1]/2)
              }))
    d3 = list(nint_intvDim(4/3, 25/12),
              nint_funcDim(function(x) {
                  check(x[1:2], c(1, 1.5), c(2, 2.5))
                  nint_intvDim(1 + x[1]/3, 1.25 + x[2]/3)
              }))
    d4 = list(nint_intvDim(1, 3.8197222121219467),
              nint_funcDim(function(x) {
                  check(x[1:3], c(1, 1.5, 4/3), c(2, 2.5, 25/12))
                  nint_intvDim(1, sqrt(sum(x[1:3]^2)))
              }))

    rdim = function(x) {
        ## x = list of dimensions objects
        if (runif(1) < 0.5)
            return(x)
        walls = runif(length(x) - 1) < 0.5
        r = split(x, cumsum(c(F, walls)))
        r = lapply(r, rdim)
        names(r) = NULL
        return(r)
    }

    rtran = function(dIdcs) {
        n = sample(length(dIdcs), 1)
        dIdcs = sample(dIdcs, n)
        if (n == 1)
            #return(list(nint_tanTransform(0, 1, dIdcs=dIdcs)))
            return(list(nint_tanTransform(runif(1, -1, 1), 2^runif(1, -1, 1), dIdcs=dIdcs)))
        walls = runif(length(dIdcs) - 1) < 0.5
        r = split(dIdcs, cumsum(c(F, walls)))
        names(r) = NULL
        r = lapply(r, function(rr)
            #nint_tanTransform(0, 1, dIdcs=rr))
            nint_tanTransform(runif(length(rr), -1, 1), 2^runif(length(rr), -1, 1), dIdcs=rr))
        return(r)
    }

    ## prepare for SparseGrid
    ncube = function(dimension)
        SparseGrid::createIntegrationGrid('GQU', dimension, 7)
    ncube = nint_integrateNCube_SparseGrid(ncube)
    unlockBinding('nint_integrateNCube', environment(nint_integrate))
    assign('nint_integrateNCube', ncube, envir=environment(nint_integrate))

    unlockBinding('nint_integrateNFunc', environment(nint_integrate))
    assign('nint_integrateNFunc', nint_integrateNFunc_recursive(ncube), envir=environment(nint_integrate))

    #space = nint_space(d1, d2, d3, d4)
    ##space = nint_space(d1[1], d2[2], d3[1], d4[1])
    ##space = nint_space(sample(d1, 1), sample(d2, 1), sample(d3, 1), sample(d4, 1))
    #format(nint_integrate(f, space), digits=17)
    ##tt = nint_transform(f, space, list(), c(0))
    #tt = nint_transform(f, space, list(nint_tanTransform(0, 1, 1:4)), c(0))
    #nint_integrate(tt$f, tt$space)

    maxDev = 0

    for (i in 1:1) {
        #cat(i, 'maxDev=', maxDev, '\n')
        space = nint_space(rdim(d1), rdim(d2), rdim(d3), rdim(d4))

        funcDimToF = sample(length(space), sample(length(space), size=1))
        tt = nint_transform(f, space, rtran(length(space)),
                            funcDimToF=funcDimToF)

        if (is.null(names(tt)))
            v = sum(sapply(tt, function(tt) nint_integrate(tt$f, tt$space)))
        else
            v = nint_integrate(tt$f, tt$space)
        expect_equal(v,
                     72.352291000343655, tolerance=1e-3)

        dev = abs(v - 72.352291000343655)
        if (maxDev < dev)
            maxDev = dev
    }
})


assign('nint_integrateNCube', dfltNCube, envir=environment(nint_integrate))
assign('nint_integrateNFunc', dfltNFunc, envir=environment(nint_integrate))
