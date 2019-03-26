context("stability unadjusted")

measures = list(
  "stabilityDavis",
  "stabilityDice",
  "stabilityJaccard",
  "stabilityLustgarten",
  "stabilityNovovicova",
  "stabilityOchiai",
  "stabilityPhi",
  "stabilitySomol",
  "stabilityKappa",
  "stabilityUnadjusted",
  "stabilityNogueira"
)

corrected = list(
  "stabilityLustgarten",
  "stabilityPhi",
  "stabilitySomol",
  "stabilityKappa",
  "stabilityUnadjusted",
  "stabilityNogueira"
)

uncorrected = setdiff(measures, corrected)

measures.need.p = c(corrected, list("stabilityDavis"))
measures.not.need.p = setdiff(measures, measures.need.p)

can.deal.with.two.empty.sets = list("stabilityDavis", "stabilityNovovicova", "stabilitySomol", "stabilityNogueira")
cant.deal.with.two.empty.sets = setdiff(measures, can.deal.with.two.empty.sets)

feats1 = list(1:4, 2:4, 2:5)
feats2 = list(1:5, 1:5, numeric(0L), numeric(0L), 1:3, 2:4)
feats3 = list(numeric(0L), numeric(0L))
feats4 = lapply(feats1, function(f) paste0("V", f))
feats5 = list(1:2, 1:2)
feats6 = list(3, 3)
p = 5

test_that("set 1: p", {
  lapply(measures.need.p, function(m) {
    checkmate::expect_number(get(m)(feats1, p = p),
      na.ok = FALSE, null.ok = FALSE, finite = TRUE, info = m)
  })

  lapply(measures.not.need.p, function(m) {
    checkmate::expect_number(get(m)(feats1),
      na.ok = FALSE, null.ok = FALSE, finite = TRUE, info = m)
  })
})

test_that("set 1: correction estimated", {
  lapply(uncorrected, function(m) {
    checkmate::expect_number(get(m)(feats1, p = p, correction.for.chance = "estimate", N = 100),
      na.ok = FALSE, null.ok = FALSE, finite = TRUE, info = m)
  })
})

test_that("set 1: correction exact", {
  lapply(uncorrected, function(m) {
    checkmate::expect_number(get(m)(feats1, p = p, correction.for.chance = "exact"),
      na.ok = FALSE, null.ok = FALSE, finite = TRUE, info = m)
  })
})

test_that("set 2: NAs", {
  lapply(cant.deal.with.two.empty.sets, function(m) {
    checkmate::expect_scalar_na(get(m)(feats2, p = p), null.ok = FALSE, info = m)
  })
})

test_that("set 2: not NAs", {
  lapply(can.deal.with.two.empty.sets, function(m) {
    checkmate::expect_number(get(m)(feats2, p = p),
      na.ok = FALSE, null.ok = FALSE, finite = TRUE, info = m)
  })
})

test_that("set 2: impute NAs", {
  lapply(measures, function(m) {
    checkmate::expect_number(get(m)(feats2, p = p, impute.na = 0),
      na.ok = FALSE, null.ok = FALSE, finite = TRUE, info = m)
  })
})

test_that("set 3: NAs", {
  lapply(measures, function(m) {
    checkmate::expect_scalar_na(get(m)(feats3, p = p), null.ok = FALSE, info = m)
  })
})

test_that("set 3: impute NAs", {
  lapply(measures, function(m) {
    checkmate::expect_number(get(m)(feats3, p = p, impute.na = 0),
      na.ok = FALSE, null.ok = FALSE, finite = TRUE, info = m)
  })
})

test_that("set 4: character input", {
  lapply(measures.need.p, function(m) {
    checkmate::expect_number(get(m)(feats4, p = p),
      na.ok = FALSE, null.ok = FALSE, finite = TRUE, info = m)
  })

  lapply(measures.not.need.p, function(m) {
    checkmate::expect_number(get(m)(feats4),
      na.ok = FALSE, null.ok = FALSE, finite = TRUE, info = m)
  })
})

test_that("set 4: character input exact correction", {
  lapply(uncorrected, function(m) {
    checkmate::expect_number(get(m)(feats4, p = p,
      correction.for.chance = "exact"),
      na.ok = FALSE, null.ok = FALSE, finite = TRUE, info = m)
  })

  lapply(uncorrected, function(m) {
    expect_equal(
      get(m)(feats4, p = p, correction.for.chance = "exact"),
      get(m)(feats1, p = p, correction.for.chance = "exact"),
      info = m)
  })
})


test_that("set 5: constant selection gives value 1", {
  max.prop.c = setdiff(corrected, list("stabilityLustgarten", "stabilitySomol"))
  max.prop.uc = setdiff(uncorrected, list("stabilityDavis"))

  lapply(max.prop.c, function(m) {
    expect_equal(
      get(m)(feats5, p = p), 1, info = m)
  })

  lapply(max.prop.uc, function(m) {
    expect_equal(
      get(m)(feats5, correction.for.chance = "none"),
      1, info = m)
  })

  lapply(max.prop.uc, function(m) {
    expect_equal(
      get(m)(feats5, p = p, correction.for.chance = "exact"),
      1, info = m)
  })
})


test_that("set 6: only one feature in dataset", {
  lapply(measures.need.p, function(m) {
    checkmate::expect_number(get(m)(feats6, p = 1),
      na.ok = TRUE, null.ok = FALSE, info = m)
  })

  lapply(measures.not.need.p, function(m) {
    checkmate::expect_number(get(m)(feats6),
      na.ok = FALSE, null.ok = FALSE, finite = TRUE, info = m)
  })

  lapply(uncorrected, function(m) {
    checkmate::expect_number(get(m)(feats6, p = 1,
      correction.for.chance = "exact"),
      na.ok = TRUE, null.ok = FALSE, info = m)
  })

  lapply(uncorrected, function(m) {
    checkmate::expect_number(get(m)(feats6, p = 1,
      correction.for.chance = "estimate", N = 100),
      na.ok = TRUE, null.ok = FALSE, info = m)
  })
})