context("GetFormStructure")

test_that("error by wrong token", {
  expect_error(
    GetFormStructure("notexisttoken", 5705),
    "Error 401: O token informado não é válido para o acesso."
  )
  expect_error(
    GetFormStructure("", 5705),
    "Error 401: Unauthorized"
  )
})

test_that("error by wrong idForm or nameForm", {
  expect_error(
    GetFormStructure("cizio7xeohwgc8k4g4koo008kkoocwg", 5715),
    "Form not found."
  )

  expect_error(
    GetFormStructure("cizio7xeohwgc8k4g4koo008kkoocwg",
                     nameForm = "RColetum Test - NaN"),
    "Name not found."
  )

  expect_warning(
    expect_error(
      GetFormStructure("cizio7xeohwgc8k4g4koo008kkoocwg",
                       5841,
                       "RColetum Test - NaN"),
      "Form not found."
    )
  )

  expect_warning(
    expect_error(
      GetFormStructure("cizio7xeohwgc8k4g4koo008kkoocwg",
                       5715,
                       "RColetum Test - Iris"),
      "Form not found."
    )
  )

  expect_error(
    GetFormStructure("cizio7xeohwgc8k4g4koo008kkoocwg"),
    "IdForm or nameForm should be provided."
  )

})

test_that("Warming when is informed the idForm and nameForm", {
  expect_warning(
    GetFormStructure("cizio7xeohwgc8k4g4koo008kkoocwg",
                     5705,
                     "RColetum Test - Iris"),
    "The idForm and nameForm are provided. Ignoring the nameForm."
  )
})

test_that("error by duplicated form name", {
  expect_error(
    GetAnswers(token = "cizio7xeohwgc8k4g4koo008kkoocwg",
               nameForm = "RColetum Test - Westeros")
  )
})


test_that("GetFormStructure in simple form", {
  # Create the data frame to compare (long command creation)
  ## Created using dput()
  myExpectedFormStructure <-
    structure(
      list(label = c("Specie", "Sepal", "Petal"),
           componentId = c("specie66137", "sepal66138", "petal66141"),
           type = c("selectfield", "group", "group"),
           helpBlock = c(NA, NA, NA),
           order = c("0", "1", "2"),
           components =
             list(NULL,
                  structure(
                    list(label = c("Length", "Width"),
                         componentId = c("length66139", "width66140"),
                         type = c("floatfield", "floatfield"),
                         helpBlock = c(NA, NA),
                         order = c("0", "1"),
                         components = c(NA, NA)),
                    .Names =
                      c("label", "componentId", "type", "helpBlock",
                        "order", "components"),
                    class = "data.frame", row.names = 1:2),
                  structure(
                    list(label = c("Length", "Width"),
                         componentId = c("length66142", "width66143"),
                         type = c("floatfield", "floatfield"),
                         helpBlock = c(NA, NA),
                         order = c("0", "1"),
                         components = c(NA, NA)),
                    .Names =
                      c("label", "componentId", "type", "helpBlock",
                        "order", "components"),
                    class = "data.frame",
                    row.names = 1:2))
           ),
      .Names =
        c("label", "componentId", "type", "helpBlock", "order",
          "components"),
      class = "data.frame",
      row.names = c(NA, 3L)
      )

  myFullFormStructure <-
    GetFormStructure("cizio7xeohwgc8k4g4koo008kkoocwg", 5705)
  expect_equal(myFullFormStructure, myExpectedFormStructure)

  myFormStructureFiltered <-
    GetFormStructure(token = "cizio7xeohwgc8k4g4koo008kkoocwg",
                     idForm = 5705,
                     componentId = "width66140")
  myFormStructureFiltered2 <-
    dplyr::filter(myExpectedFormStructure$components[[2]],
                  componentId == "width66140")
  expect_equal(myFormStructureFiltered, myFormStructureFiltered2)

  })

test_that("GetFormStructure in complex and nested form", {
  # Create the data frame to compare (very long command creation)
  ## Created using dput()
  myExpectedComplexNestedFormStructure <-
    structure(
      list(label =
             c("Artist name", "Active", "Origin localition", "Members", "Music"),
           componentId =
             c("artistName66429", "active66430", "originLocalition66431",
               "members66433", "music66436"),
           type = c("textfield", "agreementfield", "group", "group", "group"),
           helpBlock = c(NA, NA, NA, NA, NA),
           order = c("0", "1", "2", "3", "4"),
           components =
             list(NULL,
                  NULL,
                  structure(
                    list(label = "Country",
                         componentId = "country66432",
                         type = "countryfield",
                         helpBlock = NA,
                         order = "0",
                         components = NA),
                    .Names =
                      c("label", "componentId", "type", "helpBlock",
                        "order", "components"),
                    class = "data.frame",
                    row.names = 1L),
                  structure(
                    list(label = c("Active", "Past"),
                         componentId = c("active66434", "past66435"),
                         type = c("textfield", "textfield"),
                         helpBlock = c(NA, NA),
                         order = c("0", "1"),
                         components = c(NA, NA)),
                    .Names =
                      c("label", "componentId", "type", "helpBlock",
                        "order", "components"),
                    class = "data.frame", row.names = 1:2),
                  structure(
                    list(label = "Album",
                         componentId = "album66437",
                         type = "group",
                         helpBlock = NA,
                         order = "0",
                         components =
                           list(
                             structure(
                               list(label =
                                      c("Name", "Year", "Genres", "Members"),
                                    type =
                                      c("textfield", "integerfield",
                                        "relationalfield", "group"),
                                    componentId =
                                      c("name66438", "year66439", "genres66441",
                                        "members66443"),
                                    helpBlock = c(NA, NA, NA, NA),
                                    order = c("0", "1", "2", "3"),
                                    components =
                                      list(NULL, NULL, NULL,
                                           structure(
                                             list(label =
                                                    c("Name", "Instruments"),
                                                  componentId =
                                                    c("name66444",
                                                      "instruments66446"),
                                                  type =
                                                    c("textfield",
                                                      "relationalfield"),
                                                  helpBlock = c(NA, NA),
                                                  order = c("0", "1"),
                                                  components = c(NA, NA)),
                                             .Names =
                                               c("label", "componentId",
                                                 "type", "helpBlock", "order",
                                                 "components"),
                                             class = "data.frame",
                                             row.names = 1:2))),
                               .Names =
                                 c("label", "type", "componentId",
                                   "helpBlock", "order", "components"),
                               class = "data.frame",
                               row.names = c(NA, 4L)))),
                    .Names =
                      c("label", "componentId", "type", "helpBlock",
                        "order", "components"),
                    class = "data.frame",
                    row.names = 1L))),
      .Names =
        c("label", "componentId", "type", "helpBlock", "order",
          "components"),
      class = "data.frame",
      row.names = c(NA, 5L)
      )

  myFullFormStructure <-
    GetFormStructure("cizio7xeohwgc8k4g4koo008kkoocwg", 5722)
  expect_equal(myExpectedComplexNestedFormStructure, myFullFormStructure)

  myFilteredFormStructure <-
    GetFormStructure(token = "cizio7xeohwgc8k4g4koo008kkoocwg",
                     idForm = 5722,
                     componentId = "past66435")
  myFilteredFormStructure2 <-
    dplyr::filter(myExpectedComplexNestedFormStructure$components[[4]],
                  componentId == "past66435")
  expect_equal(myFilteredFormStructure, myFilteredFormStructure2)

})
