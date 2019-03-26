context("cache")
library("digest")

`%is%` <- expect_equal

# For these tests we record "signals" when arguments are forced or an error occurs.
signals <- c()
signal <- function(x=".") {
  signals <<- c(signals, x)
  x
}

try_finally <- function(setup = NULL, code = NULL, teardown = NULL) {
  force(setup)
  on.exit(teardown)
  result <- code
}

with_clean_signals <- function(code = NULL) {
  try_finally(
    setup = {
      old_signals <- signals
      signals <<- c()},
    teardown = {
      signals <<- old_signals
    },
    code = code)
}

expect_signal <- function (code, pattern=".+") {
  with_clean_signals({
    force(code)
    expect_that(paste0(signals, collapse=""), matches(pattern),
                "No signal seen when one was expected")
  })
}

expect_no_signal <- function(code, pattern="^$") {
  with_clean_signals({
    force(code)
    expect_that(paste0(signals, collapse=""), matches(pattern),
                "Signal called when none was expected")
  })
}

test_that("memo() memoizes a function.", {
  f <- memo(function(x) {signal(); x*2})
  a <- 1:5
  b <- a
  expect_signal(f(a) %is% seq(2, 10, 2))
  expect_no_signal(f(b) %is% seq(2, 10, 2))
})

test_that("Memoization is based on memory address, not value", {
  f <- memo(function(x) {signal(); x*2}, key="pointer_key")
  a <- 1:5
  f(a)
  #A sufficiently clever implementation of R may make the following fail.
  c <- a + 1 - 1 # i.e. identical object but a new copy.
  expect_signal(f(c) %is% seq(2, 10, 2))
})

test_that("Pointer Memoization does compare scalars by value.", {
  a <- 123481233783240
  b <- 123481233700000 + 83240
  f <- memo(function(x) {signal(); x*2}, key="pointer_key")
  expect_signal(f(a) %is% 246962467566480)
  expect_no_signal(f(b) %is% 246962467566480)
})

test_that("Digest-based memoisation memoises on content", {
  f <- memo(function(x) {signal(); x*2}, key="digest_key")
  a <- 1:5 + 0 #R now has range objects????
  expect_signal(f(a))
  c <- a + 1 - 1 # i.e. identical object but a new copy.
  expect_no_signal(f(c) %is% seq(2, 10, 2))
})

with_trace <- function(what, tracer, where=topenv(parent.frame())) {
  force(where)
  function(arg) {
    suppressMessages(trace((what), (tracer), (where), print=FALSE))
    tryCatch(arg, finally=suppressMessages(untrace((what), (where))))
  }
}

test_that("Hybrid falls back on content but limits calls to digest()", local({
  signalDigest <- function(x) {signal("D"); digest(x)}
  f <- memo(
    function(x) {
      signal("E");
      x*2
    },
    key="hybrid_key",
    digest=signalDigest) #"E" for evaluate
  a <- 1:5 + 0 #R now has range objects
  expect_signal(f(a), "DDE")
  expect_no_signal(f(a)) #digest not computed
  c <- a + 1 - 1 # i.e. identical object but a new copy.
  expect_signal(f(c) %is% seq(2, 10, 2), "D") #digest computes, not eval
}))

test_that("pointer and hybrid caches hold on to their arguments", local({
  # test: a large argument can be used in digest_cache and then forgotten.
  # Same is not true of pointer_key or hybrid_key.
  memused <- function() sum(gc()[,2])

  observe_keysize <- function(key) {
    f <- memo(sum, key=key)
    x1 = memused()
    arg <- runif(100000)
    s <- sum(arg)
    f(arg) %is% s
    rm(arg)
    x2 <- memused()
    x2 - x1
  }
  expect_true(observe_keysize("digest_key") < 0.5)
  expect_true(observe_keysize("pointer_key") > 0.5)
  expect_true(observe_keysize("hybrid_key") > 0.5)
}))
