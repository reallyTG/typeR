context("Villeneuve & Desaulniers Algorithm")


test_that("Default example", {
  data.graph <- data.frame(from = c("s", "s", "s", "u", "u", "w", "w", "x", "x", "v", "v", "y", "y"),
                           to = c("u", "w", "x", "w", "v", "v", "y", "w", "y", "y", "t", "t", "u"),
                           cost = c(1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L),
                           stringsAsFactors = FALSE)
  data.fpaths <- data.frame(V1 = c("s", "u"), V2 = c("u", "v"), V3 = c("v", "y"), V4 = c("t", "u"),
                            stringsAsFactors = FALSE)

  expected.gStar <- structure(list(from = c("s", "s", "u", "w", "w", "x", "x", "v", "v", "y", "y", 
                                            "s", "s|u", "u", "u|v", "s|u", "s|u|v", "u|v", "u|v", "u|v|y"), 
                                   to = c("w", "x", "w", "v", "y", "w", "y", "y", "t", "t", "u", 
                                          "s|u", "s|u|v", "u|v", "u|v|y", "w", "u|v|y", "u|v|y", "t", "t"), 
                                   cost = list(1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1, 1, 1, 1, 1, 1, 1, 1, 1)), 
                              row.names = c(NA, -20L), class = "data.frame")


  expected.gStar2 <- data.frame(from = c("s", "s", "u", "w", "w", "x", "v", "y", "y", "s", "s|u", 
                                         "u", "u|v", "s|u", "s|u|v", "u|v", "u|v", "u|v|y"), 
                                to = c("w", "x", "w", "v", "y", "w", "y", "y", "t", "u", "s|u", "s|u|v", 
                                       "u|v", "u|v|y", "w", "u|v|y", "t", "t"), 
                                cost = c(1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L,
                                        1L, 1L, 1L), 
                                stringsAsFactors = FALSE)
  rownames(expected.gStar2) <- c("2", "3", "4", "6", "7", "8", "9", "10", "11", "12", "13", "1", 
                                 "21", "31", "41", "14", "22", "32")

  expect_equal(modify_graph_vd(data.graph, data.fpaths, 1L), expected = expected.gStar)
  expect_false(
    isTRUE(
      all.equal(modify_graph_vd(data.graph, data.fpaths, 2L), expected.gStar2)
    )
  )

})




test_that("Wrong input", {
  data.graph <- structure(list(from = c("s", "s", "s", "u", "u", "w", "w", "x", "x", "v", "v", "y", "y"),
                               to = c("u", "w", "x", "w", "v", "v", "y", "w", "y", "y", "t", "t", "u"),
                               cost = c(1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L)),
                          .Names = c("from", "to", "cost"), class = "data.frame", row.names = c(NA, -13L))
  data.fpaths <- structure(list(V1 = c("s", "u"), V2 = c("u", "v"), V3 = c("v", "y"), V4 = c("t", "u")),
                           .Names = c("V1", "V2", "V3", "V4"), class = "data.frame", row.names = c(NA, -2L))

  expect_error(modify_graph_vd(NULL, data.fpaths, 1L))
  expect_error(modify_graph_vd(NA, NA))
  expect_error(modify_graph_vd(data.graph, NULL))
  expect_error(modify_graph_vd("123", data.fpaths))
  expect_error(modify_graph_vd(data.graph, 1234))
  expect_error(modify_graph_vd(c(123,46), c(789,456)))
})
