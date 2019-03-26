context("test-utilities")

kDelta.n <- 0.01 # Default proposal sd delta from Roberts & Rosenthal (2009)

test_that("AcceptProp works", {
    # Always accept when the Metropolis ratio is >= 1
    expect_true(AcceptProp(log(1), log(10)))
    expect_true(AcceptProp(log(2), log(1), log(1), log(2)))
    expect_true(AcceptProp(log(2), log(1), log(1), log(10)))

    # Tests for Metropolis ratio < 1
    m1 <- mockery::mock(0.4, 0.6, 0.2, 0.3)
    mockery::stub(AcceptProp, "stats::runif", m1)
    expect_true(AcceptProp(log(2), log(1)))
    expect_false(AcceptProp(log(2), log(1)))
    expect_true(AcceptProp(log(2), log(1), log(2), log(1)))
    expect_false(AcceptProp(log(2), log(1), log(2), log(1)))
})

test_that("AcceptProp is vectorized", {
    # Always accept when the Metropolis ratio is >= 1
    expect_equivalent(AcceptProp(log(c(1, 1)), log(c(2, 2))), c(TRUE, TRUE))

    # Accept first, reject second
    m1 <- mockery::mock(c(0.01, 0.99))
    mockery::stub(AcceptProp, "stats::runif", m1)
    log.curr.1 <- log(c(2, 2))
    log.prop.1 <- log(c(1, 1))
    expect_equivalent(AcceptProp(log.curr.1, log.prop.1), c(TRUE, FALSE))

    # Reject both
    m2 <- mockery::mock(c(0.99, 0.99))
    mockery::stub(AcceptProp, "stats::runif", m2)
    log.curr.2 <- log(c(2, 2))
    log.prop.2 <- log(c(1, 1))
    expect_equivalent(AcceptProp(log.curr.2, log.prop.2), c(FALSE, FALSE))

    # Accept first, reject second, with transition probs
    m3 <- mockery::mock(c(0.2, 0.3))
    mockery::stub(AcceptProp, "stats::runif", m3)
    log.curr.3 <- log(c(2, 2))
    log.prop.3 <- log(c(1, 1))
    log.curr.to.prop.3 <- log(c(2, 2))
    log.prop.to.curr.3 <- log(c(1, 1))
    expect_equivalent(AcceptProp(log.curr.3,log.prop.3, log.curr.to.prop.3,
                                     log.prop.to.curr.3),
                      c(TRUE, FALSE))

})

test_that("Amwg increases/decreases proposal sd in vector setting", {
    batch.size <- 3
    s.start <- c(10, 10)
    m <- mockery::mock(c(1, 1),
                       c(1, 2),
                       c(1, 3),
                       c(1, 4))
    # First param has low acceptance, decrease proposal sd
    # Second param has high acceptance, increase proposal sd
    s.expected.update <- c(exp(log(s.start[1]) - kDelta.n),
                           exp(log(s.start[2]) + kDelta.n))

    f <- function(s) m()
    g <- Amwg(f, s.start, batch.size=batch.size)
    # No update yet until batch.size reached
    g()
    expect_equal(get("s", envir=environment(g)), s.start)
    # No update yet until batch.size reached
    g()
    expect_equal(get("s", envir=environment(g)), s.start)
    # Update on batch.size
    g()
    expect_equal(get("s", envir=environment(g)), s.expected.update)
})

test_that("Amwg decreases proposal sd in univariate setting", {
    batch.size <- 3
    s.start <- 10
    m <- mockery::mock(1, 1, 1, 1)
    # Low acceptance, decrease proposal sd
    s.expected.update <- exp(log(s.start[1]) - kDelta.n)

    f <- function(s) m()
    g <- Amwg(f, s.start, batch.size=batch.size)
    # No update yet until batch.size reached
    g()
    expect_equal(get("s", envir=environment(g)), s.start)
    # No update yet until batch.size reached
    g()
    expect_equal(get("s", envir=environment(g)), s.start)
    # Update on batch.size
    g()
    expect_equal(get("s", envir=environment(g)), s.expected.update)
})

test_that("Amwg increases proposal sd in univariate setting", {
    batch.size <- 3
    s.start <- 10
    m <- mockery::mock(1, 2, 3, 4)
    # High acceptance, increase proposal sd
    s.expected.update <- exp(log(s.start[1]) + kDelta.n)

    f <- function(s) m()
    g <- Amwg(f, s.start, batch.size=batch.size)
    # No update yet until batch.size reached
    g()
    expect_equal(get("s", envir=environment(g)), s.start)
    # No update yet until batch.size reached
    g()
    expect_equal(get("s", envir=environment(g)), s.start)
    # Update on batch.size
    g()
    expect_equal(get("s", envir=environment(g)), s.expected.update)
})

test_that("Amwg works when batch size is 1", {
    batch.size <- 1
    s.start <- 10
    m <- mockery::mock(1, 1, 2)

    f <- function(s) m()
    g <- Amwg(f, s.start, batch.size=batch.size)

    # Low acceptance, decrease proposal sd
    g()
    expect_equal(get("s", envir=environment(g)),
                 exp(log(s.start[1]) - kDelta.n))
    # Acceptance above default of 0.44, increase proposal sd
    s.curr <- get("s", envir=environment(g))
    g()
    expect_equal(get("s", envir=environment(g)),
                 exp(log(s.curr) + kDelta.n))
})

test_that("Amwg stops if the proposal sd is the wrong length", {
    batch.size <- 1
    s.start <- c(10, 10)
    f <- function(s) rnorm(3, 0, s)
    g <- Amwg(f, s.start, batch.size=batch.size)
    expect_error(g(), "length(s) should be 1 or length(f(..., s))", fixed=TRUE)
})

test_that("Amwg can handle random vectors/joint updates", {
    batch.size <- 2
    s.start <- 10
    f <- mockery::mock(c(1, 1),
                       c(2, 2),
                       c(3, 3))
    # High acceptance rate, expect increased proposal sd
    s.expected.update <- exp(log(s.start) + kDelta.n)

    g <- Amwg(f, s.start, batch.size=batch.size)
    # No change before batch length iterations
    g()
    expect_equal(get("s", envir=environment(g)), s.start)
    # New proposal sd is correct
    g()
    expect_equal(get("s", envir=environment(g)), s.expected.update)
})

test_that("Default DeltaN is applied correctly", {
    # Default is min(0.01, n^(-1/2))
    batch.size <- 1
    iters.before.switch <- 100^2 # Solution to n^(-1/2) = 0.01
    s.start <- 10
    m <- mockery::mock(1, cycle=TRUE)
    f <- function(s) m()
    g <- Amwg(f, s.start, batch.size=batch.size)

    # While the min is 0.01, before the switch
    for(i in 1:iters.before.switch) {
        g()
    }
    s.before <- get("s", envir=environment(g))
    expect_equal(s.before, exp(log(s.start) - iters.before.switch * kDelta.n))

    # After the switch, when n(-1/2) < 0.01
    g()
    s.after <- get("s", envir=environment(g))
    iters.after.switch <- iters.before.switch + 1
    delta.n <- iters.after.switch^(-1/2)
    expect_equal(s.after, exp(log(s.before) - delta.n))
})

test_that("Custom DeltaN is applied correctly", {
    cust.delta <- 0.05
    DeltaN <- function(n) min(cust.delta, n^(-1/3))
    batch.size <- 1
    iters.before.switch <- 20^3 # Solution to n^(-1/2) = 0.05
    s.start <- 10
    m <- mockery::mock(1, cycle=TRUE)
    f <- function(s) m()
    g <- Amwg(f, s.start, batch.size=batch.size, DeltaN=DeltaN)

    # While the min is 0.05, before the switch
    for(i in 1:iters.before.switch) {
        g()
    }
    s.before <- get("s", envir=environment(g))
    expect_equal(s.before, exp(log(s.start) - iters.before.switch * cust.delta))

    # After the switch, when n(-1/3) < 0.05
    g()
    s.after <- get("s", envir=environment(g))
    iters.after.switch <- iters.before.switch + 1
    delta.n <- iters.after.switch^(-1/3)
    expect_equal(s.after, exp(log(s.before) - delta.n))
})

