context("stability adjusted")
library(Matrix)

measures = list(
  "stabilityZucknick",
  "stabilityZhang",
  "stabilityIntersectionMBM",
  "stabilityIntersectionGreedy",
  "stabilityIntersectionCount",
  "stabilityIntersectionMean"
)

mat = function() {
  sim.mat = matrix(0.4, nrow = 5, ncol = 5)
  diag(sim.mat) = 1
  sim.mat[3, 4] = sim.mat[4, 3] = 0.99
  sim.mat[2, 4] = sim.mat[4, 2] = 0.92
  sim.mat[1, 5] = sim.mat[5, 1] = 0.93

  sim.mat = sim.mat %*% t(sim.mat)
  sim.mat = cov2cor(sim.mat)

  return(sim.mat)
}

sim.mat1 = mat()
sim.mat2 = sim.mat1
colnames(sim.mat2) = paste0("V", 1:5)
sim.mat3 = diag(5)
sim.mat4 = matrix(0, ncol = 5, nrow = 5)
sim.mat4[1:3, ] = sim.mat4[, 3:1] = 1
diag(sim.mat4) = 1
sim.mat5 = Matrix(sim.mat1)
sim.mat6 = Matrix(sim.mat1, sparse = TRUE)
sim.mat7 = as(sim.mat6, "dgCMatrix")
sim.mat8 = matrix(1, nrow = 1, ncol = 1)

feats1 = list(1:3, 2:5)
feats2 = list(1:5, 1:5, numeric(0L), numeric(0L), 1:2, 2:4)
feats3 = list(numeric(0L), numeric(0L))
feats4 = lapply(feats1, function(f) paste0("V", f))
feats5 = list(1:2, 1:2)
feats6 = list(1, 1)


test_that("set 1: basic", {
  lapply(measures, function(m) {
    checkmate::expect_number(get(m)(features = feats1, sim.mat = sim.mat1,
      threshold = 0.85, correction.for.chance = "estimate", N = 100),
      na.ok = FALSE, null.ok = FALSE, finite = TRUE, info = paste(m, "estimate"))
  })

  lapply(measures, function(m) {
    checkmate::expect_number(get(m)(features = feats1, sim.mat = sim.mat1,
      threshold = 0.85, correction.for.chance = "exact", N = 100),
      na.ok = FALSE, null.ok = FALSE, finite = TRUE, info = paste(m, "exact"))
  })

  checkmate::expect_number(stabilityZucknick(features = feats1, sim.mat = sim.mat1,
    threshold = 0.85, correction.for.chance = "none", N = 100),
    na.ok = FALSE, null.ok = FALSE, finite = TRUE, info = paste("stabilityZucknick", "none"))
})

test_that("set 1: Matrix", {
  lapply(measures, function(m) {
    checkmate::expect_number(get(m)(features = feats1, sim.mat = sim.mat5,
      threshold = 0.85, correction.for.chance = "estimate", N = 100),
      na.ok = FALSE, null.ok = FALSE, finite = TRUE, info = m)
  })
})

test_that("set 1: Matrix sparse", {
  lapply(measures, function(m) {
    checkmate::expect_number(get(m)(features = feats1, sim.mat = sim.mat6,
      threshold = 0.85, correction.for.chance = "estimate", N = 100),
      na.ok = FALSE, null.ok = FALSE, finite = TRUE, info = m)
  })
})

test_that("set 1: Matrix non-symmetric format", {
  lapply(measures, function(m) {
    checkmate::expect_number(get(m)(features = feats1, sim.mat = sim.mat7,
      threshold = 0.85, correction.for.chance = "estimate", N = 100),
      na.ok = FALSE, null.ok = FALSE, finite = TRUE, info = m)
  })
})


test_that("set 1: no similarities", {
  lapply(measures, function(m) {
    checkmate::expect_number(get(m)(features = feats1, sim.mat = sim.mat3,
      threshold = 0.85, correction.for.chance = "estimate", N = 100),
      na.ok = FALSE, null.ok = FALSE, finite = TRUE, info = m)
  })
})

test_that("set 2: some empty sets: NAs", {
  lapply(measures, function(m) {
    checkmate::expect_scalar_na(get(m)(features = feats2, sim.mat = sim.mat1,
      threshold = 0.85, correction.for.chance = "estimate", N = 100),
      null.ok = FALSE, info = m)
  })
})

test_that("set 2: some empty sets: impute NAs", {
  lapply(measures, function(m) {
    checkmate::expect_number(get(m)(features = feats2, sim.mat = sim.mat1,
      threshold = 0.85, correction.for.chance = "estimate", N = 100, impute.na = 0),
      na.ok = FALSE, null.ok = FALSE, finite = TRUE, info = m)
  })
})


test_that("set 3: only empty sets", {
  lapply(measures, function(m) {
    checkmate::expect_scalar_na(get(m)(features = feats3, sim.mat = sim.mat1,
      threshold = 0.85, correction.for.chance = "estimate", N = 100),
      null.ok = FALSE, info = m)
  })
})

test_that("set 4: unnamed", {
  lapply(measures, function(m) {
    expect_error(get(m)(features = feats4, sim.mat = sim.mat1,
      threshold = 0.85, correction.for.chance = "estimate", N = 100),
      info = m)
  })
})

test_that("set 4: named", {
  lapply(measures, function(m) {
    checkmate::expect_number(get(m)(features = feats4, sim.mat = sim.mat2,
      threshold = 0.85, correction.for.chance = "estimate", N = 100),
      na.ok = FALSE, null.ok = FALSE, finite = TRUE, info = m)
  })
})

test_that("set 4: character input exact correction", {
  lapply(measures, function(m) {
    checkmate::expect_number(get(m)(features = feats4, sim.mat = sim.mat2,
      threshold = 0.85, correction.for.chance = "exact"),
      na.ok = FALSE, null.ok = FALSE, finite = TRUE, info = m)
  })

  lapply(measures, function(m) {
    expect_equal(
      get(m)(features = feats4, sim.mat = sim.mat2,
        threshold = 0.85, correction.for.chance = "exact"),
      get(m)(features = feats1, sim.mat = sim.mat2,
        threshold = 0.85, correction.for.chance = "exact"),
      info = m)
  })
})


test_that("set 5: constant selection gives value 1", {
  lapply(measures, function(m) {
    expect_equal(
      get(m)(features = feats5, sim.mat = sim.mat1,
        threshold = 0.85, correction.for.chance = "exact"),
      1, info = m)
  })
})

test_that("set 6: only one feature in dataset", {
  lapply(measures, function(m) {
    checkmate::expect_number(get(m)(feats6, sim.mat = sim.mat8,
      threshold = 0.85, correction.for.chance = "exact"),
      na.ok = TRUE, null.ok = FALSE, info = m)
  })

  lapply(measures, function(m) {
    checkmate::expect_number(get(m)(feats6, sim.mat = sim.mat8,
      threshold = 0.85, correction.for.chance = "estimate", N = 100),
      na.ok = TRUE, null.ok = FALSE, info = m)
  })

  lapply(measures, function(m) {
    checkmate::expect_number(get(m)(feats6, sim.mat = sim.mat8,
      threshold = 0.85, correction.for.chance = "none"),
      na.ok = FALSE, null.ok = FALSE, finite = TRUE, info = m)
  })

})
