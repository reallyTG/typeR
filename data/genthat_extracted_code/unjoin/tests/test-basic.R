context("basic")

test_that("unjoin works", {
  library(dplyr)
  data("Seatbelts", package= "datasets")
  x <- unjoin(as.data.frame(Seatbelts), front, rear, kms)
  all.equal(inner_join(x$.idx0, x$data) %>% select(-.idx0), as.data.frame(Seatbelts))

  iris %>% unjoin(-Species)
  chickwts %>% unjoin(weight)

  if (require("gapminder")) {
    gapminder %>%
      group_by(country, continent) %>%
      unjoin()

    gapminder %>%
      unjoin(-country, -continent)
    unjoin(gapminder)
  }
  x <- unjoin(iris, Petal.Width)
  x %>%  expect_named(c(".idx0", "data"))
  x$data %>% inner_join(x$.idx0) %>% expect_named(c("Sepal.Length", "Sepal.Width", "Petal.Length", "Species", ".idx0",
                                                   "Petal.Width"))

  x <- unjoin(iris, Petal.Width, Species, key_col = "vertexes")
  x %>%  expect_named(c("vertexes", "data"))
})


test_that("key col works", {
  lnames <- lapply(unjoin(iris), names)
  bnames <- lapply(unjoin(iris, key_col = "banana"),  names)

  expect_that(sum(".idx0" == unlist(lnames)), equals(2L))

  expect_that(sum("banana" == unlist(bnames)), equals(2L))

})


test_that("nse-compat works", {
   expect_named(unjoin_(iris, "Sepal.Length"), c(".idx0", "data"))
})

test_that("unholy mixes of compatibility are ok", {
  iris %>% unjoin() %>% unjoin_("Species", key_col = "aaa") %>% expect_silent()

  unjoin(iris) %>% unjoin(Sepal.Width, key_col = "www") %>% unjoin(Petal.Width) %>% expect_silent()

  unjoin(iris) %>% unjoin(Petal.Width, key_col = "iii") %>% unjoin_("Species", key_col = "aaa") %>% expect_silent()
})
