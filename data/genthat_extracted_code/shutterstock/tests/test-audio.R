context("test-audio")

# httptest::start_capturing()

with_mock_api({
  test_that("search audio", {
    x <- searchAudio(query = "bluegrass",
                     duration_from = "60",
                     moods = "uplifting")
    expect_equal(
      sapply(x[["data"]], function(i)
        i[["title"]]),
      c(
        "Dulcimer Dream",
        "Whistling Workers",
        "Ukulele Happiness",
        "Crawfish",
        "Easy Hayride",
        "Hayseeds",
        "Get Your Ticket",
        "Happenstance Day Parade",
        "Can't Stop My Smile",
        "Speakeasy",
        "My Grass Is Blue",
        "John Henry Bluegrass",
        "Angel Band",
        "Wildwood Flower",
        "Appalachian Sun",
        "On the Top of the Hill",
        "Last Train to Pine Ridge"
      )
    )
  })
})

with_mock_api({
  test_that("list audio tracks", {
    lat <- listAudioTracks(id = "442583")
    expect_equal(sapply(lat[["data"]], function(i)
      i[["title"]]),
      c("Another Tomorrow"))

    lati <- listAudioTracks(id = c("442583", "434750"))
    expect_equal(sapply(lati[["data"]], function(i)
      i[["title"]]),
      c("Fresh Love", "Another Tomorrow"))
  })
})

with_mock_api({
  test_that("get audio details", {
    x <- getAudioDetails(id = "442583")
    expect_equal(x[["id"]], "442583")
    expect_equal(
      x[["description"]],
      "Pulsing and feel-good, featuring soaring synthesizer, groovy synth bass drums and synth drums that create a euphoric, upbeat mood."
    )
    expect_equal(x[["is_instrumental"]], TRUE)
    expect_equal(x[["duration"]], 183)
    expect_equal(x[["bpm"]], 110)
  })
})

with_mock_api({
  test_that("get audio collections", {
    expect_error(getAudioCollections(id = "48433107"))
  })
})

with_mock_api({
  test_that("get audio collections content", {
    expect_error(getAudioCollectionsContent(id = "48433113"))
  })
})

# httptest::stop_capturing()
