context("Testing news helpers")

dir_loc <- tempfile()
dir.create(dir_loc)
dir.create(paste0(dir_loc, "/inst"))
on.exit(unlink(dir_loc, recursive = TRUE))

description <- paste0(dir_loc, "/DESCRIPTION")
news <- paste0(dir_loc, "/inst/NEWS")
news_md <- paste0(dir_loc, "/inst/NEWS.md")

readr::write_lines(c("Package: testing"), description)

readr::write_lines(c(
  "# testing 0.1.1 (2019-01-02)",
  " * BUG FIX: Fixing a lot of bugs!",
  "",
  "# testing 0.1.0 (2019-01-01)",
  " * FUNCTIONALITY: Oh man I implemented so many things today!",
  "   I am so smart, I am so smart",
  "   https://media0.giphy.com/media/vLruErVSYGx8s/giphy.gif?cid=3640f6095c939f916374546263a8a301",
  "",
  "# testing 0.0.1 (2018-12-31)",
  " * INITIAL RELEASE: super useful package!"
), news_md)

test_that("update_news works", {
  news_normal <- update_news(path = dir_loc, write = FALSE)

  expect_is(news_normal, "character")
  expect_true(any(grepl("testing 0.1.1", news_normal)))
  expect_false(file.exists(news))

  news_normal <- update_news(path = dir_loc, write = TRUE)

  expect_is(news_normal, "character")
  expect_true(any(grepl("testing 0.1.1", news_normal)))
  expect_true(file.exists(news))
  expect_true(any(grepl("testing 0.1.1", readr::read_lines(news))))

  recent_news <- recent_news(path = dir_loc, 2)

  expect_is(recent_news, "character")
  expect_true(any(grepl("testing 0.1.1", recent_news)))
  expect_false(any(grepl("testing 0.0.1", recent_news)))

  file.remove(news_md)
  expect_error(find_news(path = dir_loc), regexp = "does not have a NEWS.md")

  file.remove(description)
  expect_error(detect_package_folder(path = dir_loc), regexp = "Could not find DESCRIPTION file")
})

