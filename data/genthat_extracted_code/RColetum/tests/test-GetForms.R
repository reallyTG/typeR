context("GetForms")

# Create the data frame to compare (long command creation)
## Created using dput()
myExpectedForms <-
  structure(
    list(id =
           c("5704", "5722", "5721", "5723", "5705", "5713", "5712", "5711",
             "5719", "5744", "5745"),
         name = c("API Doc - Filmes preferidos",
                  "RColetum Test - Classic Rocks",
                  "RColetum Test - Classic Rocks (genres)",
                  "RColetum Test - Classic Rocks (instruments)",
                  "RColetum Test - Iris", "RColetum Test - Star Wars",
                  "RColetum Test - Star Wars (films)",
                  "RColetum Test - Star Wars (species)",
                  "RColetum Test - Storms", "RColetum Test - Westeros",
                  "RColetum Test - Westeros"),
         status =
           c("enabled", "enabled", "disabled", "disabled", "enabled",
             "enabled", "disabled", "disabled", "enabled", "enabled",
             "enabled"),
         category =
           c(NA, "RColetum Tests", NA, NA, "RColetum Tests", "RColetum Tests",
             NA, NA, "RColetum Tests", "RColetum Tests", "RColetum Tests"),
         answerTracking =
           c(TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
             FALSE, FALSE, FALSE, FALSE),
         publicAnswers =
           c(FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
             FALSE, FALSE)),
    .Names = c("id", "name", "status", "category", "answerTracking",
               "publicAnswers"),
    class = "data.frame",
    row.names = c(NA, 11L))

test_that("error by wrong token", {
  expect_error(
    GetForms("notexisttoken"),
    "Error 401: O token informado não é válido para o acesso."
  )
  expect_error(
    GetForms(""),
    "Error 401: Unauthorized"
  )
})

test_that("error in using incorrection the filters", {
  expect_error(
    GetForms(token = "cizio7xeohwgc8k4g4koo008kkoocwg",
             status = "enable"),
    paste0("The option 'enable' are not avaliable for the filter 'status'. ",
    "The avaliable options to this filter are: 'enabled' or 'disabled'.")
  )

  expect_error(
    GetForms(token = "cizio7xeohwgc8k4g4koo008kkoocwg",
             publicAnswers = "enabled"),
    paste0("The option 'enabled' are not avaliable for the filter ",
           "'publicAnswers'. The avaliable options to this filter are: 'true' ",
           "or 'false'.")
  )

  expect_error(
    GetForms(token = "cizio7xeohwgc8k4g4koo008kkoocwg",
             answerTracking = "disabled"),
    paste0("The option 'disabled' are not avaliable.The avaliable options to ",
           "this filter are: 'true' or 'false'.")
  )

})

test_that("get forms with no filter", {
    myForms <- dplyr::arrange(
      GetForms("cizio7xeohwgc8k4g4koo008kkoocwg"), name, id)
  expect_equal(myForms,myExpectedForms)
})

test_that("get forms with the filters", {

    myFormnsDisabled <-
    GetForms("cizio7xeohwgc8k4g4koo008kkoocwg", status = 'disabled')
  myFormnsDisabled2 <-
    dplyr::mutate(
      dplyr::filter(myExpectedForms, status == "disabled"),
      category = as.logical(category)
    )
  expect_equal(myFormnsDisabled,myFormnsDisabled2)

  myFormnsEnabled <-
    dplyr::arrange(
      GetForms("cizio7xeohwgc8k4g4koo008kkoocwg", status = 'enabled'), name, id)
  myFormnsEnabled2 <-
    dplyr::filter(myExpectedForms, status == "enabled")
  expect_equal(myFormnsEnabled,myFormnsEnabled2)

  myFormsAnswerTracking <-
    GetForms("cizio7xeohwgc8k4g4koo008kkoocwg", answerTracking = TRUE)
  myFormsAnswerTracking2 <-
    dplyr::mutate(
      dplyr::filter(myExpectedForms, answerTracking == TRUE),
      category = as.logical(category)
      )
  expect_equal(myFormsAnswerTracking, myFormsAnswerTracking2)

  myFormsAnswerNotTracking <- dplyr::arrange(
    GetForms("cizio7xeohwgc8k4g4koo008kkoocwg", answerTracking = FALSE),
    name, id)
  myFormsAnswerNotTracking2 <-
    dplyr::filter(myExpectedForms, answerTracking == FALSE)
  expect_equal(myFormsAnswerNotTracking, myFormsAnswerNotTracking2)

  myFormsPublicAnswers <-
    GetForms("cizio7xeohwgc8k4g4koo008kkoocwg", publicAnswers = TRUE)
  expect_identical(myFormsPublicAnswers,NULL)

  myFormsNotPublicAnswers <- dplyr::arrange(
    GetForms("cizio7xeohwgc8k4g4koo008kkoocwg", publicAnswers = FALSE), name, id)
  myFormsNotPublicAnswers2 <-
    dplyr::filter(myExpectedForms, publicAnswers == FALSE)
  expect_equal(myFormsNotPublicAnswers,myFormsNotPublicAnswers2)

  myFormsMistFilters <- dplyr::arrange(
    GetForms(token = "cizio7xeohwgc8k4g4koo008kkoocwg",
             status = "enabled",
             publicAnswers = FALSE,
             answerTracking = FALSE), name, id)
  myFormsMixFilters2 <-
    dplyr::filter(myExpectedForms,
                  status == "enabled",
                  publicAnswers == FALSE,
                  answerTracking == FALSE)
  expect_equal(myFormsMistFilters,myFormsMixFilters2)

})
