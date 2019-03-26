context("bison")

test_that("bison returns the correct value", {
  vcr::use_cassette("bison", {
    out1 <- bison(species="Bison bison", count=5)
    out2 <- bison(species="Canis latrans", type="scientific_name", count=5)
    
    expect_that(out1$points$name[1], equals("Bison bison"))
    expect_that(out2$points$name[1], equals("Canis latrans"))
    expect_that(out1, is_a("bison"))
    expect_that(out2, is_a("bison"))
    expect_is(out1$summary, "list")
    expect_is(out1$points, "data.frame")
  })
})

test_that("bison returns the correct value", {
  vcr::use_cassette("bison_count", {
    # larger count values trigger while loop paginator
    out5 <- bison(species="Quercus lobata", count=1010)

    expect_is(out5, "bison")
    expect_equal(out5$points$name[1], "Quercus lobata")
    expect_gt(NROW(out5$points), 800)
  })
})
