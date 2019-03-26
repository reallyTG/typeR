library(docopulae)
context('main functions')


test_that('getDAPar', {
    i1 = 0:6
    i2 = sample(length(i1), sample(1:length(i1), 1))
    i3 = sample(length(i2), sample(1:length(i2), 1))
    b1 = paste('beta', i1, sep='')
    b2 = paste('beta', i1[i2], sep='')
    b3 = paste('beta', i1[i2[i3]], sep='')

    mod = list(fisherI=list())

    A = NULL
    expect_equal(getDAPar(mod, A, NULL),
                 list(parNames=NULL, A=A))
    expect_equal(getDAPar(mod, A, b2),
                 list(parNames=b2, A=A))
    expect_equal(getDAPar(mod, A, i2),
                 list(parNames=i2, A=A))

    A = b3
    expect_error(getDAPar(mod, A, NULL))
    r = getDAPar(mod, A, b2)
    expect_equal(r$parNames, b2)
    expect_equal(apply(r$A, 2, which.max), match(A, b2))
    expect_error(getDAPar(mod, A, i2))

    A = i3
    expect_error(getDAPar(mod, A, NULL))
    r = getDAPar(mod, A, b2)
    expect_equal(r$parNames, b2)
    expect_equal(apply(r$A, 2, which.max), A)
    r = getDAPar(mod, A, i2)
    expect_equal(r$parNames, i2)
    expect_equal(apply(r$A, 2, which.max), A)

    s = length(b3)
    A = matrix(rnorm(s*2), nrow=s, ncol=2)
    rownames(A) = b3
    expect_error(getDAPar(mod, A, NULL))
    r = getDAPar(mod, A, b2)
    expect_equal(r$parNames, b2)
    expect_equivalent(r$A[i3,, drop=F], A)
    expect_error(getDAPar(mod, A, i2))

    k = length(i2)
    A = matrix(rnorm(k*2), nrow=k, ncol=2)
    expect_equal(getDAPar(mod, A, NULL),
                 list(parNames=NULL, A=A))
    expect_equal(getDAPar(mod, A, b2),
                 list(parNames=b2, A=A))
    expect_equal(getDAPar(mod, A, i2),
                 list(parNames=i2, A=A))


    m = diag(length(b1))
    rownames(m) = b1
    mod = list(fisherI=list(m))

    A = NULL
    expect_equal(getDAPar(mod, A, NULL),
                 list(parNames=NULL, A=A))
    expect_equal(getDAPar(mod, A, b2),
                 list(parNames=i2, A=A))
    expect_equal(getDAPar(mod, A, i2),
                 list(parNames=i2, A=A))

    A = b3
    r = getDAPar(mod, A, NULL)
    expect_null(r$parNames)
    expect_equal(apply(r$A, 2, which.max), i2[i3])
    r = getDAPar(mod, A, b2)
    expect_equal(r$parNames, i2)
    expect_equal(apply(r$A, 2, which.max), i3)
    r = getDAPar(mod, A, i2)
    expect_equal(r$parNames, i2)
    expect_equal(apply(r$A, 2, which.max), i3)

    A = i3
    r = getDAPar(mod, A, NULL)
    expect_null(r$parNames)
    expect_equal(apply(r$A, 2, which.max), i3)
    r = getDAPar(mod, A, b2)
    expect_equal(r$parNames, i2)
    expect_equal(apply(r$A, 2, which.max), i3)
    r = getDAPar(mod, A, i2)
    expect_equal(r$parNames, i2)
    expect_equal(apply(r$A, 2, which.max), i3)

    s = length(b3)
    A = matrix(rnorm(s*2), nrow=s, ncol=2)
    rownames(A) = b3
    r = getDAPar(mod, A, NULL)
    expect_null(r$parNames)
    expect_equivalent(r$A[i2[i3],, drop=F], A)
    r = getDAPar(mod, A, b2)
    expect_equal(r$parNames, i2)
    expect_equivalent(r$A[i3,, drop=F], A)
    r = getDAPar(mod, A, i2)
    expect_equal(r$parNames, i2)
    expect_equivalent(r$A[i3,, drop=F], A)

    k = length(i2)
    A = matrix(rnorm(k*2), nrow=k, ncol=2)
    expect_equal(getDAPar(mod, A, NULL),
                 list(parNames=NULL, A=A))
    expect_equal(getDAPar(mod, A, b2),
                 list(parNames=i2, A=A))
    expect_equal(getDAPar(mod, A, i2),
                 list(parNames=i2, A=A))
})

