const.client.id <- "FzOYqDgb"
const.client.secret <-"SPrvmY8eGRcGA"

test_knoema_exp <- function(expr){
  tryCatch(
    {
      return(expr)
    },
    error = function(e) {
      return(e$message)
    }
  )}


context("test dataset id is null error")
test_that("test dataset id is null error",{
  data_frame = test_knoema_exp(Knoema(NULL))
  if (data_frame != "Client error: (403) Forbidden") {
    expect_equal(data_frame,"dataset.id should be a string. Can't be NULL")
  } else {
      expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})


context("test dataset id is double error")
test_that("test dataset id is double error",{
  data_frame = test_knoema_exp(Knoema(123))
  if (data_frame != "Client error: (403) Forbidden") {
    expect_equal(data_frame,"dataset.id should be a string. Can't be double")
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context("test selection and mnemonics in one call error")
test_that("test selection and mnemonics in one call error",{
  data_frame = test_knoema_exp(Knoema("IMFWEO2017Oct", list(country = "912", subject = "LP;NGDP"), mnemonics = "test", client.id = const.client.id, client.secret = const.client.secret))
  if (data_frame != "Client error: (403) Forbidden") {
    expect_equal(data_frame,"The function does not support specifying mnemonics and selection in a single call")
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context("test wrong dimension error")
test_that("test wrong dimension error error",{
  data_frame = test_knoema_exp(Knoema("IMFWEO2017Oct", list(indicator = "LP;NGDP"), client.id = const.client.id, client.secret = const.client.secret))
  if (data_frame != "Client error: (403) Forbidden") {
    expect_equal(data_frame,"Dimension with id or name indicator is not found")
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context("test empty dimension selection error")
test_that("test empty dimension selection error",{
  data_frame = test_knoema_exp(Knoema("IMFWEO2017Oct", list(country = "", subject = "LP;NGDP"), client.id = const.client.id, client.secret = const.client.secret))
  if (data_frame != "Client error: (403) Forbidden") {
    expect_equal(data_frame, "Selection for dimension Country is empty")
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context("test wrong dimension selection error")
test_that("test wrong dimension selection error",{
  data_frame = test_knoema_exp(Knoema("IMFWEO2017Oct", list(country=  "914;512;111", subject = "L1P;N1GDP"), client.id = const.client.id, client.secret = const.client.secret))
  if (data_frame != "Client error: (403) Forbidden") {
    expect_equal(data_frame, "Selection for dimension Subject is empty")
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context("test incorrect dataset id error")
test_that("test incorrect dataset id error",{
  data_frame = test_knoema_exp(Knoema("incorrect id", list(domedim = "val1;val2"), client.id = const.client.id, client.secret = const.client.secret))
  if (data_frame != "Client error: (403) Forbidden") {
    expect_equal(data_frame, "Requested dataset doesn't exist or you don't have access to it.")
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context("test incorrect client.id and client.secret error")
test_that("test incorrect client.id and client.secret error",{
  expect_error(Knoema("IMFWEO2017Oct", list(country = "914;512;111", subject = "LP;NGDP"), client.id = "b", client.secret = "s"),"Client error: (403) Forbidden", fixed = TRUE)
})

context("test incorrect frequencies error")
test_that("test incorrect frequencies error",{
  data_frame = test_knoema_exp(Knoema("IMFWEO2017Oct", list(country = "914;512;111", subject = "LP;NGDP", frequency = "A;G;R"), client.id = const.client.id, client.secret = const.client.secret))
  if (data_frame != "Client error: (403) Forbidden") {
    expect_equal(data_frame, "The following frequencies are not correct: G,R")
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context("test incorrect host error")
test_that("test incorrect host error",{
  data_frame = test_knoema_exp(Knoema("IMFWEO2017Oct", list(country = "914;512;111", subject = "LP;NGDP", frequency = "A"), host = 'knoema_incorrect.com', client.id = const.client.id, client.secret = const.client.secret))
  if (data_frame != "Client error: (403) Forbidden") {
    expect_equal(data_frame, "The specified host knoema_incorrect.com does not exist")
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context("test unknown type error")
test_that("test unknown type error",{
  data_frame = test_knoema_exp( Knoema("IMFWEO2017Oct", list(country = "914;512;111", subject = "LP;NGDP", frequency = "A"), type = "incorrect_type", host = 'knoema.com', client.id = const.client.id, client.secret = const.client.secret))
  if (data_frame != "Client error: (403) Forbidden") {
    expect_equal(data_frame, "Unknown type incorrect_type")
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})
