context("test-contributors")

# httptest::start_capturing()

with_mock_api({
  test_that("get contributor details", {
    x <- getContributorDetails(id = c("800506", "1653538"))
    expect_equal(sapply(x[["data"]], function(i)
      i[["id"]]),
      c("800506", "1653538"))
  })
})

with_mock_api({
  test_that("list contributor details", {
    x <-
      listContributorCollections(contributor_id = "800506", sort = "newest")
    expect_equal(
      sapply(x[["data"]], function(i)
        i[["name"]]),
      c(
        "Baby Elephants",
        "Zebra",
        "Birds",
        "Rhino",
        "Hyena",
        "Giraffe",
        "Monochrome",
        "Leopard cubs",
        "African Landscapes",
        "Lion Cubs"
      )
    )
  })
})

with_mock_api({
  test_that("get contributor collections details", {
    x <-
      getContributorCollectionsDetails(contributor_id = "800506", id = "1991678")
    expect_equal(x[["name"]], "Baby Elephants")
    expect_equal(x[["id"]], "1991678")
  })
})

with_mock_api({
  test_that("get contributor collections details items", {
    x <-
      getContributorCollectionsDetailsItems(contributor_id = "800506",
                                            id = "1991678",
                                            sort = "newest")
    expect_equal(sapply(x[["data"]], function(i)
      i[["id"]]),
      c("94373977", "88269310", "168592952"))
  })
})

# httptest::stop_capturing()
