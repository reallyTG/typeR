context("test-videos")

# httptest::start_capturing()

with_mock_api({
  test_that("search videos", {
    x <- searchVideos(query = "hot air balloon",
                      duration_from = "30",
                      sort = "popular")
    expect_equal(
      sapply(x[["data"]], function(i)
        i[["id"]]),
      c(
        "10021289",
        "5092781",
        "12498323",
        "31427839",
        "22866478",
        "5084096",
        "9876293",
        "8146255",
        "25746743",
        "7718704",
        "4327925",
        "34731673",
        "13522022",
        "34800832",
        "28677595",
        "5084363",
        "18216415",
        "1009477847",
        "24762719",
        "10772753"
      )
    )
  })
})

with_mock_api({
  test_that("list videos", {
    x <- listVideos(id = c("18002566", "17139196"))
    expect_equal(
      sapply(x[["data"]], function(i)
        i[["description"]]),
      c(
        "Cherry tree summer good weather\n",
        "Tortoise walking on white isolated background"
      )
    )
  })
})

with_mock_api({
  test_that("get video details", {
    x <- getVideoDetails(id = "18002566")
    expect_equal(x[["id"]], "18002566")
    expect_equal(x[["description"]],
                 "Tortoise walking on white isolated background")
    expect_equal(x[["duration"]], 17)
    expect_equal(x[["aspect_ratio"]], "16:9")
  })
})

with_mock_api({
  test_that("list video categories", {
    x <- listVideoCategories()
    expect_equal(
      sapply(x[["data"]], function(i)
        i[["name"]]),
      c(
        "Animals/Wildlife",
        "Buildings/Landmarks",
        "Backgrounds/Textures",
        "Business/Finance",
        "Education",
        "Food and Drink",
        "Health Care",
        "Holidays",
        "Objects",
        "Industrial",
        "Art",
        "Nature",
        "People",
        "Religion",
        "Science",
        "Technology",
        "Signs/Symbols",
        "Sports/Recreation",
        "Transportation",
        "Editorial"
      )
    )
  })
})

with_mock_api({
  test_that("list similar videos", {
    x <- listSimilarVideos(id = "2140697")
    expect_equal(
      sapply(x[["data"]], function(i)
        i[["id"]]),
      c(
        "1015125220",
        "6658088",
        "12547097",
        "18357649",
        "14773081",
        "14775184",
        "32461642",
        "17973235",
        "14334772",
        "4333631",
        "1013902361",
        "18944168",
        "6834778",
        "12547013",
        "10474673",
        "4263776",
        "4944092",
        "1612780",
        "14334754",
        "8947951"
      )
    )
  })
})

# httptest::stop_capturing()
