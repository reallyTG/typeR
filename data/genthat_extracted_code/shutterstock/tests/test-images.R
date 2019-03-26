context("test-images")

# httptest::start_capturing()

with_mock_api({
  test_that("search images", {
    expect_is(searchImages(query = "farmer"), "list")
  })
})

with_mock_api({
  test_that("list image categories", {
    cats <- listImageCategories()
    expect_equal(names(cats), "data")
    expect_equal(length(cats[["data"]]), 25L)
    expect_equal(cats[["data"]][[1]][["name"]], "Abstract")
    expect_equal(cats[["data"]][[25]][["name"]], "Vintage")
  })
})

with_mock_api({
  test_that("list similar images", {
    img <- listSimilarImages(id = "620154782")
    expect_equal(names(img),
                 c("page", "per_page", "total_count", "search_id", "data"))
  })
})

with_mock_api({
  test_that("list recommended images", {
    img <-
      listRecommendedImages(id = c("620154782", "620154770"),
                            max_items = 5)
    expect_equal(length(img[["data"]]), 5L)
  })
})

with_mock_api({
  test_that("get image details", {
    img <- getImageDetails(id = "620154782")
    expect_equal(
      names(img[["assets"]]),
      c(
        "medium_jpg",
        "huge_tiff",
        "small_jpg",
        "huge_jpg",
        "preview",
        "small_thumb",
        "large_thumb",
        "huge_thumb"
      )
    )
    expect_equal(img[["description"]], "Woman bikes along windmill")
  })
})

with_mock_api({
  test_that("list images", {
    x <- listImages(id = c("620154782", "620154770"), view = "minimal")
    expect_equal(names(x), "data")
    expect_equal(
      sapply(x[["data"]], function(i)
        i[["description"]]),
      c("Woman bikes along windmill", "Woman bikes along windmill")
    )
  })
})

with_mock_api({
  test_that("list image collections", {
    x <- listImageCollections()
    expect_equal(x[["data"]][[1]][["name"]], "test")
  })
})

with_mock_api({
  test_that("get image collections", {
    x <- getImageCollections(id = "139149928")
    expect_equal(x[["name"]], "test")
  })
})

with_mock_api({
  test_that("get image collections details", {
    x <- getImageCollectionsDetails(id = "139149928")
    expect_equal(sapply(x[["data"]], function(i)
      i[["id"]]),
      "1192766653")
  })
})

with_mock_api({
  test_that("list featured collections", {
    lfc <- listFeaturedCollections()
    expect_equal(
      sapply(lfc[["data"]], function(i)
        i[["name"]]),
      c(
        "We See in 3D",
        "Where in the World",
        "We Could Be Heroes",
        "African American History",
        "Year of the Pig",
        "Hearts and Arrows",
        "They Were All Yellow",
        "On the Road Again",
        "It's Getting Hot in Here",
        "Portraits of African Americans",
        "Lunar New Year",
        "Whole Lotta Love",
        "Korean Family",
        "Sporting Events",
        "Fashion",
        "Technology ",
        "News"
      )
    )
    lfcp <- listFeaturedCollections(type = "photo")
    expect_equal(
      sapply(lfcp[["data"]], function(i)
        i[["name"]]),
      c(
        "They Were All Yellow",
        "On the Road Again",
        "It's Getting Hot in Here",
        "Portraits of African Americans",
        "Lunar New Year",
        "Whole Lotta Love"
      )
    )
  })
})

with_mock_api({
  test_that("get featured collections", {
    expect_error(getFeaturedCollections(id = "136351027"))
  })
})

with_mock_api({
  test_that("get featured collections items", {
    expect_error(getFeaturedCollectionsItems(id = "136351027"))
  })
})

# httptest::stop_capturing()
