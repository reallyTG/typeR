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

context("get data from flat dataset ts error")
test_that("get data from flat dataset ts error",{
  data_frame = test_knoema_exp(Knoema("cblymmf", list(Country="Albania;Australia", Keyword="FGP;TWP;TRP"), client.id = const.client.id, client.secret = const.client.secret))
  if (data_frame != "Client error: (403) Forbidden") {
    expect_equal(data_frame,"Types ts, xts, zoo are not supported for flat datasets")
  } else {
      expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context("get data from flat dataset xts error")
test_that("get data from flat dataset xts error",{
  data_frame = test_knoema_exp(Knoema("cblymmf", list(Country="Albania;Australia", Keyword="FGP;TWP;TRP"), type ="xts", client.id = const.client.id, client.secret = const.client.secret))
  if (data_frame != "Client error: (403) Forbidden") {
    expect_equal(data_frame,"Types ts, xts, zoo are not supported for flat datasets")
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context("get data from flat dataset zoo error")
test_that("get data from flat dataset zoo error",{
  data_frame = test_knoema_exp(Knoema("cblymmf", list(Country="Albania;Australia", Keyword="FGP;TWP;TRP"), type ="zoo", client.id = const.client.id, client.secret = const.client.secret))
  if (data_frame != "Client error: (403) Forbidden") {
    expect_equal(data_frame,"Types ts, xts, zoo are not supported for flat datasets")
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context("get data from flat dataset DataFrame")
test_that("get data from flat dataset DataFrame",{
  data_frame = test_knoema_exp(Knoema("cblymmf", list(Country="Albania;Australia", Keyword="FGP;TWP;TRP"), type = "DataFrame", client.id = const.client.id, client.secret = const.client.secret))
  if (class(data_frame)=="data.frame") {
    expect_equal(length(data_frame), 4)
    sname = "Albania - FGP - D"
    expect_equal(data_frame[["All time",sname]], 8)
    sname ="Australia - TWP - D"
    expect_equal(data_frame[["All time",sname]], 8)
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context("get data from flat dataset MetaDataFrame")
test_that("get data from flat dataset MetaDataFrame",{
  data_frame = test_knoema_exp(Knoema("cblymmf", list(Country="Albania;Australia", Keyword="FGP;TWP;TRP"), type = "MetaDataFrame", client.id = const.client.id, client.secret = const.client.secret))
  if (class(data_frame)=="data.frame") {
    expect_equal(length(data_frame), 4)
    sname = "Albania - FGP - D"
    expect_equal(data_frame[["Unit",sname]], "# of records")
    sname ="Australia - TWP - D"
    expect_equal(data_frame[["Scale",sname]], "1")
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})
