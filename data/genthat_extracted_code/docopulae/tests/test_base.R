library(docopulae)
context('base functions')

## seq1
test_that('seq1', {
    expect_equal(seq1(1, 10),
                 seq(1, 10))
    expect_equal(seq1(1, 2),
                 seq(1, 2))
    expect_equal(seq1(1, 1),
                 seq(1, 1))
    expect_equal(seq1(1, 0),
                 integer(0))
    expect_equal(seq1(10, 1, -3),
                 seq(10, 1, -3))
    expect_equal(seq1(4, 1, -3),
                 seq(4, 1, -3))
    expect_equal(seq1(3, 1, -3),
                 seq(3, 1, -3))
    expect_equal(seq1(1, 1, -3),
                 seq(1, 1, -3))
    expect_equal(seq1(0, 1, -3),
                 integer(0))
})


## Derivf, Deriv2f
test_that('Derivf, Deriv2f', {
    if (require(Deriv)) {
        # Derivf, names
        e = quote( ((theta$x - theta$mu)/theta$sigma)^2 )
        x = c(theta='x', theta='mu', theta='sigma')
        d = Derivf(e, x)
        expect_named(d,
                     as.character(x))
        env = list(theta=list(x=2, mu=3, sigma=4))
        expect_equivalent(lapply(d, eval, env),
                          list(-0.125, 0.125, -0.03125))

        # Derivf, indices
        e = quote( ((theta[1] - theta[2])/theta[3])^2 )
        x = c(theta=2, theta=1, theta=3)
        d = Derivf(e, x)
        expect_named(d,
                     as.character(x))
        env = list(theta=c(2, 3, 4))
        expect_equivalent(lapply(d, eval, env),
                          list(0.125, -0.125, -0.03125))

        # Deriv2f, names
        e = quote( ((theta$x - theta$mu)/theta$sigma)^2 )
        x = c(theta='x', theta='mu', theta='sigma')
        d2 = Deriv2f(e, x)
        expect_named(d2,
                     as.character(x))
        for (s in d2)
            expect_named(s,
                         as.character(x))
        env = list(theta=list(x=2, mu=3, sigma=4))
        expect_equivalent(lapply(d2, function(s) lapply(s, eval, env)),
                          list(list(0.125, -0.125, 0.0625), list(-0.125, 0.125, -0.0625), list(0.0625, -0.0625, 0.0234375)))

        # Deriv2f, indices
        e = quote( ((theta[1] - theta[2])/theta[3])^2 )
        x = c(theta=2, theta=1, theta=3)
        d2 = Deriv2f(e, x)
        expect_named(d2,
                     as.character(x))
        for (s in d2)
            expect_named(s,
                         as.character(x))
        env = list(theta=c(2, 3, 4))
        expect_equivalent(lapply(d2, function(s) lapply(s, eval, env)),
                          list(list(0.125, -0.125, -0.0625), list(-0.125, 0.125, 0.0625), list(-0.0625, 0.0625, 0.0234375)))
    }
})


## mirrorMatrix
test_that('mirrorMatrix', {
    n = 4
    x = matrix(rnorm(n^2), nrow=n, ncol=n)
    x = x * !lower.tri(x)
    r = mirrorMatrix(x)
    # check sum of matrix
    expect_equal(sum(r),
                 2*sum(x * upper.tri(x)) + sum(diag(x)))
    # check lower triangle
    expect_equal(r * lower.tri(r, diag=T),
                 t(x))
    # check upper triangle
    expect_equal(r * upper.tri(r, diag=T),
                 x)
})


## is_flat, flatten
test_that('is_flat, flatten', {
    expect_true(is_flat(list()))
    expect_true(is_flat(list(1:2, 2:3, 3:4)))
    expect_false(is_flat(list(list(1:2), 2:3, 3:4)))

    expect_equal(flatten(1:2),
                 list(1:2))
    expect_equal(flatten(list()),
                 list())
    expect_equal(flatten(list(1:2, 2:3, 3:4)),
                 list(1:2, 2:3, 3:4))
    expect_equal(flatten(list(list(1:2), 2:3, 3:4)),
                 list(1:2, 2:3, 3:4))
    expect_equal(flatten(list(1:2, list(2:3), list(3:4, list(4:5)), list( list(list(5:6)) , 6:7))),
                 list(1:2, 2:3, 3:4, 4:5, 5:6, 6:7))
})


## zmin, zmax
test_that('zmin, zmax', {
    expect_equal(zmin(numeric(0)), 0)
    expect_equal(zmin(1:3), 1)

    expect_equal(zmax(numeric(0)), 0)
    expect_equal(zmax(1:3), 3)
})


## lproduct
test_that('lproduct', {
    expect_equal(lproduct(list()),
                 list())
    expect_equal(lproduct(list(list(1:2))),
                 list(list(1:2)))
    expect_equal(lproduct(list(list(1:2), list(2:3, 3:4))),
                 list(list(1:2, 2:3), list(1:2, 3:4)))
    expect_equal(lproduct(list(list(1:2, 2:3), list(3:4))),
                 list(list(1:2, 3:4), list(2:3, 3:4)))
    expect_equal(lproduct(list(list(list(1:2)), list(2:3))), # leave inner list(1:2) untouched
                 list(list(list(1:2), 2:3)))
})


## integrateA
test_that('integrateA', {
    f = function(x) 1/((x + 1)*sqrt(x))
    r = integrateA(f, 0, 2)
    expect_equal(r$message, 'OK')
    r = integrateA(f, 0, 2, subdivisions=3)
    expect_equal(r$message, 'maximum number of subdivisions reached')
    expect_error(integrateA(f, 0, 1e6))
})


## clusterDist, clusterPeak
test_that('clusterDist, clusterPeak handle distance correctly', {
    m = matrix(c(1, 2))
    expect_equal(clusterDist(as.matrix(dist(m)), 1),
                 c(1, 1))
    expect_equal(clusterPeak(m, 2:1, 1),
                 c(1, 1))

    m = matrix(c(1, 2 + 1e-15))
    expect_equal(clusterDist(as.matrix(dist(m)), 1),
                 c(1, 2))
    expect_equal(clusterPeak(m, 2:1, 1),
                 c(1, 2))
})

test_that('clusterDist, clusterPeak work for a simple 1D random example', {
    n = 100
    x1 = matrix(runif(n))
    x2 = matrix(runif(n)) + 1 + 1 + 1e-15
    x = rbind(x1, x2)
    ord = sample(1:nrow(x), nrow(x))
    tcl = rep(1:2, each=n) # true class
    x = x[ord,, drop=F]
    tcl = tcl[ord]

    cld = clusterDist(as.matrix(dist(x)), 1)
    clp = clusterPeak(x, nrow(x):1, 1)
    expect_equal(cld,
                 clp)
    # are groups consistent with true groups
    expect_equivalent(apply(table(cld, tcl), 1, max),
                      rep(n, 2))
})

test_that('clusterDist, clusterPeak work for a simple 2D random example', {
    n = 100
    x1 = matrix(runif(n*2), ncol=2)
    x2 = matrix(runif(n*2), ncol=2)
    x3 = matrix(runif(n*2), ncol=2)
    x4 = matrix(runif(n*2), ncol=2)
    off = 1 + sqrt(2) + 1e-15
    x2 = sweep(x2, 2, c(off, 0), '+')
    x3 = sweep(x3, 2, c(0, off), '+')
    x4 = sweep(x4, 2, c(off, off), '+')
    x = rbind(x1, x2, x3, x4)
    tcl = rep(1:4, each=n) # true class
    ord = sample(1:nrow(x), nrow(x))
    x = x[ord,]
    tcl = tcl[ord]
    #plot(x[,1], x[,2], col=tcl)

    cld = clusterDist(as.matrix(dist(x)), sqrt(2))
    clp = clusterPeak(x, nrow(x):1, sqrt(2))
    expect_equal(cld,
                 clp)
    # are groups consistent with true groups
    expect_equivalent(apply(table(cld, tcl), 1, max),
                      rep(n, 4))
})


## roworder
test_that('roworder works in trivial cases', {
    expect_equal(roworder(matrix(nrow=0, ncol=1)),
                 integer(0))
    expect_equal(roworder(data.frame(numeric(0))),
                 integer(0))
    expect_equal(roworder(matrix(1, ncol=1)),
                 1)
    expect_equal(roworder(data.frame(1)),
                 1)
})

test_that('roworder works for expand.grid example', {
    x1 = 1:3
    x2 = 1:5
    x3 = 1:7
    x = as.matrix(expand.grid(x1, x2, x3))
    expect_equivalent(x[roworder(x),],
                      cbind(rep(x1, each=length(x2)*length(x3)), rep(rep(x2, each=length(x3)), length(x1)), rep(x3, length(x1)*length(x2))))
})

test_that('roworder works for random examples', {
    n = 100
    k = 6
    x = unique(matrix(sample(k, size=n*k, replace=T), nrow=n))
    ord = roworder(x)
    x = x[ord,, drop=F]

    for (n in 1:10) {
        nord = sample(nrow(x))
        expect_equal(roworder(x[nord,, drop=F]),
                     order(nord))
    }
})


## rowmatch
test_that('rowmatch works in trivial cases', {
    a = matrix(0.0, nrow=0, ncol=2)
    b = matrix(as.double(1:4), ncol=2)
    expect_equal(rowmatch(a, b),
                 integer(0))
    expect_equal(rowmatch(b, a),
                 as.integer(c(NA, NA)))
    expect_equal(rowmatch(matrix(1), matrix(1)),
                 1)
    expect_equal(rowmatch(matrix(as.double(1:2)), matrix(as.double(2:1))),
                 2:1)

    a = matrix(as.double(1:4), ncol=2, byrow=T)
    b = matrix(as.double((-1):6), ncol=2, byrow=T)
    expect_equal(rowmatch(a, b),
                 2:3)
    expect_equal(rowmatch(b, a),
                 as.integer(c(NA, 1, 2, NA)))
})

test_that('rowmatch works for a random example', {
    n = 100
    k = 4
    x = matrix(rnorm(n*k), nrow=n)
    i = sample(1:nrow(x), sample(1:nrow(x), 1))
    s = x[i,, drop=F]
    expect_equal(rowmatch(s, x), # s in x
                 i)

    r = rowmatch(x, s) # x in s
    expect_equal(which(is.na(r)), # NA's
                 (1:n)[-i])
    expect_equivalent(na.omit(r), # matches
                      order(i))
})


## rowsduplicated
test_that('rowsduplicated works in trivial cases', {
    expect_equal(rowsduplicated(matrix(0.0, nrow=0, ncol=0)),
                 logical(0))

    expect_equal(rowsduplicated(matrix(0.0, nrow=0, ncol=2)),
                 logical(0))

    expect_equal(rowsduplicated(matrix(0.0)),
                 c(F))

    expect_equal(rowsduplicated(rbind(c(0.0, 0.0))),
                 c(F))

    expect_equal(rowsduplicated(rbind(0.0, 0.0)),
                 c(F, T))

    expect_equal(rowsduplicated(rbind(c(0.0, 1.0), c(0.0, 1.0))),
                 c(F, T))
})

