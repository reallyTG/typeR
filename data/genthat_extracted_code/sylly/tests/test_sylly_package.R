context("environment")

test_that("setting environment variables", {
  set.sylly.env(lang="xy", hyph.cache.file="test", hyph.max.token.length=30)
  
  expect_match(
    get.sylly.env(lang=TRUE),
    "xy"
  )
  expect_match(
    get.sylly.env(hyph.cache.file=TRUE),
    "test"
  )
  expect_identical(
    get.sylly.env(hyph.max.token.length=TRUE),
    30
  )
})


context("pattern import")

test_that("import pattern file", {
  samplePatternFile <- normalizePath("hyph-xy.pat.txt")
  samplePatternStandard <- dget("hyph_xy_dput.txt")

  hyph.xy <- read.hyph.pat(file=samplePatternFile, lang="xy")
  
  expect_identical(
    hyph.xy,
    samplePatternStandard
  )
})


context("pattern object handling")

test_that("debugging hyphenation", {
  samplePatternStandard <- dget("hyph_xy_dput.txt")
  sampleSplitStandard <- dget("mhp_split_dput.txt")

  mhp_split <- manage.hyph.pat(hyph.pattern=samplePatternStandard, word="incomprehensibilities")
  
  expect_identical(
    mhp_split,
    sampleSplitStandard
  )
})

test_that("debugging hyphenation patterns", {
  samplePatternStandard <- dget("hyph_xy_dput.txt")
  sampleGetSetStandard <- dget("mhp_get_set_dput.txt")

  mhp_get_old <- manage.hyph.pat(hyph.pattern=samplePatternStandard, get="xyz")
  expect_is(
    mhp_get_old,
    "matrix"
  )
  expect_equal(
    colnames(mhp_get_old),
    c("orig", "char", "nums")
  )
  expect_equal(
    nrow(mhp_get_old),
    0
  )

  mhp_set <- manage.hyph.pat(hyph.pattern=samplePatternStandard, set="x3yz2")
  mhp_get_new <- manage.hyph.pat(hyph.pattern=mhp_set, get="xyz")
  expect_identical(
    mhp_get_new,
    sampleGetSetStandard
  )

  mhp_rm <- manage.hyph.pat(hyph.pattern=mhp_set, rm="xyz")
  expect_identical(
    mhp_rm,
    samplePatternStandard
  )
})


context("hyphenation")

test_that("hyphenation", {
  samplePatternStandard <- dget("hyph_xy_dput.txt")
  sampleHyphenStandard <- dget("hyphen_dput.txt")
  # also checking hyphenText() and [[ here
  sampleHyphenStandard_df <- hyphenText(sampleHyphenStandard)
  sampleHyphenStandard_c <- sampleHyphenStandard[["syll"]]

  hyph_result <- hyphen(
    "incomprehensibilities",
    hyph.pattern=samplePatternStandard,
    cache=FALSE,
    quiet=TRUE
  )
  hyph_result_df <- hyphen_df(
    "incomprehensibilities",
    hyph.pattern=samplePatternStandard,
    cache=FALSE,
    quiet=TRUE
  )
  hyph_result_c <- hyphen_c(
    "incomprehensibilities",
    hyph.pattern=samplePatternStandard,
    cache=FALSE,
    quiet=TRUE
  )
  
  expect_identical(
    hyph_result,
    sampleHyphenStandard
  )
  expect_identical(
    hyph_result_df,
    sampleHyphenStandard_df
  )
  expect_identical(
    hyph_result_c,
    sampleHyphenStandard_c
  )
})

test_that("helper methods", {
  # hyphenText() is being indirectly tested in various other tests
  sampleHyphenStandard <- dget("hyphen_dput.txt")

  expect_identical(
    language(sampleHyphenStandard),
    "xy"
  )
  expect_identical(
    describe(sampleHyphenStandard)[["num.syll"]],
    8
  )
})


test_that("fixing wrong hyphenation", {
  sampleHyphenStandard <- dget("hyphen_dput.txt")

  # don't freak out, i know this is wrong. it's just for the sake of testing...
  hyph_fixed <- correct.hyph(sampleHyphenStandard, "in-com-pre-hens-ib-il-it-ies", "in-co-mp-re-he-ns-ib-il-it-ie-s", cache=FALSE)

  expect_equal(
    hyphenText(hyph_fixed)[["syll"]],
    11
  )
})
