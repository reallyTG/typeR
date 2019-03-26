# Functions used only for testing

# Step Size Expectation ---------------------------------------------------

expect_step <- function(actual, x, f, df, alpha = x, nfev, tolerance = 1e-4) {
  expect_equal(actual$step$par, x, tolerance = tolerance)
  expect_equal(actual$step$f, f, tolerance = tolerance)
  expect_equal(actual$step$df, df, tolerance = tolerance)
  expect_equal(actual$step$alpha, alpha, tolerance = tolerance)
  expect_equal(actual$nfn, nfev)
}

# Finite Difference -------------------------------------------------------

gfd <- function(par, fn, rel_eps = sqrt(.Machine$double.eps)) {
  g <- rep(0, length(par))
  for (i in 1:length(par)) {
    oldx <- par[i]
    if (oldx != 0) {
      eps <- oldx * rel_eps
    }
    else {
      eps <- 1e-3
    }
    par[i] <- oldx + eps
    fplus <- fn(par)

    par[i] <- oldx - eps
    fminus <- fn(par)
    par[i] <- oldx

    g[i] <- (fplus - fminus) / (2 * eps)
  }
  g
}

make_gfd <- function(fn, eps = 1.e-3) {
  function(par) {
    gfd(par, fn, eps)
  }
}

hfd <- function(par, fn, rel_eps = sqrt(.Machine$double.eps)) {
  hs <- matrix(0, nrow = length(par), ncol = length(par))
  for (i in 1:length(par)) {
    for (j in i:length(par)) {
      oldxi <- par[i]
      oldxj <- par[j]

      if (oldxi != 0 && oldxj != 0) {
        eps <- min(oldxi, oldxj) * rel_eps
      }
      else {
        eps <- 1e-3
      }
      if (i != j) {
        par[i] <- par[i] + eps
        par[j] <- par[j] + eps
        fpp <- fn(par)

        par[j] <- oldxj - eps
        fpm <- fn(par)

        par[i] <- oldxi - eps
        par[j] <- oldxj + eps
        fmp <- fn(par)

        par[j] <- oldxj - eps
        fmm <- fn(par)

        par[i] <- oldxi
        par[j] <- oldxj

        val <- (fpp - fpm - fmp + fmm) / (4 * eps * eps)

        hs[i, j] <- val
        hs[j, i] <- val
      }
      else {
        f <- fn(par)
        oldxi <- par[i]

        par[i] <- oldxi + 2 * eps
        fpp <- fn(par)

        par[i] <- oldxi + eps
        fp <- fn(par)

        par[i] <- oldxi - 2 * eps
        fmm <- fn(par)

        par[i] <- oldxi - eps
        fm <- fn(par)

        par[i] <- oldxi

        hs[i, i] <- (-fpp + 16 * fp - 30 * f + 16 * fm - fmm) / (12 * eps * eps)
      }
    }
  }
  hs
}

make_hfd <- function(fn, eps = 1.e-3) {
  function(par) {
    hfd(par, fn, eps)
  }
}

make_fg <- function(fn, gr = NULL, hs = NULL) {
  if (is.null(gr)) {
    gr <- make_gfd(fn)
  }
  if (is.null(hs)) {
    hs <- make_hfd(fn)
  }
  list(
    fn = fn,
    gr = gr,
    hs = hs
  )
}


# Rosenbrock ---------------------------------------------------------------

rb0 <- c(-1.2, 1)
# taken from the optim man page
rosenbrock_fg <- list(
  fn = function(x) {
    x1 <- x[1]
    x2 <- x[2]
    100 * (x2 - x1 * x1) ^ 2 + (1 - x1) ^ 2
  },
  gr = function(x) {
    x1 <- x[1]
    x2 <- x[2]
    c(
      -400 * x1 * (x2 - x1 * x1) - 2 * (1 - x1),
      200 *      (x2 - x1 * x1))
  },
  hs = function(x) {
    xx <- 1200 * x[1] * x[1] - 400 * x[2] + 2
    xy <- x[1] * -400
    yy <- 200
    matrix(c(xx, xy, xy, yy), nrow = 2)
  },
  hi = function(x) {
    1 / c(1200 * x[1] * x[1] - 400 * x[2] + 2, 200)
  },
  fg = function(x) {
    x1 <- x[1]
    x2 <- x[2]
    a <- (x2 - x1 * x1)
    b <- 1 - x1
    list(
      fn = 100 * a * a + b * b,
      gr = c(
        -400 * x1 * a - 2 * b,
        200 * a
      )
    )
  },
  n = 2
)

rosen_no_hess <- rosenbrock_fg
rosen_no_hess$hs <- NULL
rosen_no_hess$hi <- NULL

# log-sum-exp -------------------------------------------------------------

# http://papers.nips.cc/paper/5322-a-differential-equation-for-modeling-nesterovs-accelerated-gradient-method-theory-and-insights.pdf

log_sum_exp_fg <- function(n = 50, m = 200, rho = 20, bvar = 2) {
  A <- matrix(stats::rnorm(m * n), nrow = m)
  b <- stats::rnorm(n = m, mean = 0, sd = sqrt(bvar))
  lse_fg(A = A, b = b, rho = rho)
}

# Smooth and convex, but not strongly convex
lse_fg <- function(A, b, rho) {
  fn <- function(x) {
    rho * log(sum(exp((A %*% x - b) / rho)))
  }
  gr <- function(x) {
    rAxb <- exp((A %*% x - b) / rho)
    mult <- sweep(A, 1, rAxb, "*")
    num <- colSums(mult)
    as.vector(num / sum(rAxb))
  }
  res <- list(
    fn = fn,
    gr = gr,
    A = A,
    b = b,
    rho = rho
  )
  res$grr <- make_gfd(fn = res$fn)
  res
}

# Function with unhelpful Hessian -----------------------------------------

tricky_fg <- function() {
  res <- list(
    fn = function(par) {
      x1 <- par[1]
      x2 <- par[2]
      (1.5 - x1 + x1 * x2)^2 +
        (2.25 - x1 + x1 * x2 * x2)^2 +
        (2.625 - x1 + x1 * x2 * x2 * x2)^2
    }
  )
  res$gr <- make_gfd(res$fn)
  res$hs <- make_hfd(res$fn)

  res
}


# Line Search Util --------------------------------------------------------

# Create Initial Step Value
#
# Given a set of start parameters and a search direction, initializes the
# step data. Utility function for testing.
make_step0 <- function(fg, x, pv, f = fg$fn(x), df = fg$gr(x)) {
  list(
    x = x,
    alpha = 0,
    f = f,
    df = df,
    d = dot(pv, df)
  )
}

# More'-Thuente test functions --------------------------------------------


# Test Function 1 ---------------------------------------------------------

# 1 phi(a) = -(a) / (a^2 + b) phi'(a) = (a^2 - b) / (a^2 + b)^2 b = 2
fn1 <- function(alpha, beta = 2) {
  -alpha / (alpha ^ 2 + beta)
}
gr1 <- function(alpha, beta = 2) {
  (alpha ^ 2 - beta) / ((alpha ^ 2 + beta) ^ 2)
}
fcn1 <- function(x) {
  list(f = fn1(x), g = gr1(x))
}


# Test Function 2 ---------------------------------------------------------

# 2 phi(a) = (a + b)^5 - 2(a + b)^4  phi'(a) = (a+b)^3*(5a+5b-8)  b = 0.004
fn2 <- function(alpha, beta = 0.004) {
  (alpha + beta) ^ 5 - 2 * (alpha + beta) ^ 4
}
gr2 <- function(alpha, beta = 0.004) {
  (alpha + beta) ^ 3 * (5 * alpha + 5 * beta - 8)
}
fcn2 <- function(x) {
  list(f = fn2(x), g = gr2(x))
}


# Test Function 3 ---------------------------------------------------------

# 3 phi(a) = phi_0(a) + [2(1-b)/(l*pi)]sin(l*pi*alpha*0.5)
#   phi'(a) =  phi_0'(a) + (1-b)cos(l*pi*alpha*0.5)
#   phi_0(a) = 1 - a if a <= 1 - b  phi_0'(a) = -1
#            = a - 1 if a >= 1 + b  phi_0'(a) = 1
#            = (a-1)^2/2b + b/2 if a in [1-b,1+b] phi_0'(a) =  a - 1 /b
#     b = 0.01 l = 39
fn3 <- function(alpha, beta = 0.01, l = 39) {
  if (alpha <= 1 - beta) {
    phi_0 <- 1 - alpha
  } else if (alpha >= 1 + beta) {
    phi_0 <- alpha - 1
  } else {
    phi_0 <- (alpha - 1) ^ 2 / (2 * beta) + (beta / 2)
  }
  phi_0 + (2 * (1 - beta) * sin(l * pi * alpha * 0.5)) / (l * pi)
}
#   phi'(a) =  phi_0'(a) + (1-b)cos(l*pi*alpha*0.5)

gr3 <- function(alpha, beta = 0.01, l = 39) {
  if (alpha <= 1 - beta) {
    dphi_0 <- -1
  } else if (alpha >= 1 + beta) {
    dphi_0 <- 1
  } else {
    dphi_0 <- (alpha - 1) / beta
  }

  dphi_0 + (1 - beta) * cos(l * pi * alpha * 0.5)
}
fcn3 <- function(x) {
  list(f = fn3(x), g = gr3(x))
}


# Utils for Test Functions 4-6 --------------------------------------------

# gamma(b) = (1+b^2)^1/2 - b
yanaig <- function(beta) {
  sqrt(1 + beta ^ 2) - beta
}

yanai1 <- function(alpha, beta) {
  sqrt((1 - alpha) ^ 2 + beta ^ 2)
}
gryanai1 <- function(alpha, beta) {
  (alpha - 1) / yanai1(alpha, beta)
}

yanai2 <- function(alpha, beta) {
  sqrt(alpha ^ 2 + beta ^ 2)
}
gryanai2 <- function(alpha, beta) {
  alpha / yanai2(alpha, beta)
}

# phi(a) = gamma(b_1)[(1-a)^2 + b_2^2]^1/2 + gamma(b_2)[a^2 + b_1^2]^1/2
yanai <- function(alpha, beta1, beta2) {
  yanaig(beta1) * yanai1(alpha, beta2) +
    yanaig(beta2) * yanai2(alpha, beta1)
}

#   phi'(a) = -[gamma(b_1)(1-a)]/sqrt[(1-a)^2 + b_2^2] + gamma(b_2)a/sqrt([a^2 + b_1^2])
gryanai <- function(alpha, beta1, beta2) {
  (yanaig(beta1) * gryanai1(alpha, beta2)) + (yanaig(beta2) * gryanai2(alpha, beta1))
}

# Test Function 4 ---------------------------------------------------------

fn4 <- function(alpha) {
  yanai(alpha, beta1 = 0.001, beta2 = 0.001)
}
gr4 <- function(alpha) {
  gryanai(alpha, beta1 = 0.001, beta2 = 0.001)
}
fcn4 <- function(x) {
  list(f = fn4(x), g = gr4(x))
}


# Test Function 5 ---------------------------------------------------------

fn5 <- function(alpha) {
  yanai(alpha, beta1 = 0.01, beta2 = 0.001)
}
gr5 <- function(alpha) {
  gryanai(alpha, beta1 = 0.01, beta2 = 0.001)
}
fcn5 <- function(x) {
  list(f = fn5(x), g = gr5(x))
}


# Test Function 6 ---------------------------------------------------------


fn6 <- function(alpha) {
  yanai(alpha, beta1 = 0.001, beta2 = 0.01)
}
gr6 <- function(alpha) {
  gryanai(alpha, beta1 = 0.001, beta2 = 0.01)
}
fcn6 <- function(x) {
  list(f = fn6(x), g = gr6(x))
}

f1 <- list(fn = fn1, gr = gr1)
f2 <- list(fn = fn2, gr = gr2)
f3 <- list(fn = fn3, gr = gr3)
f4 <- list(fn = fn4, gr = gr4)
f5 <- list(fn = fn5, gr = gr5)
f6 <- list(fn = fn6, gr = gr6)

