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

context("get data frame")
test_that("get data frame",{
  data_frame = test_knoema_exp(Knoema("IMFWEO2017Oct", list(country = "914", subject = "lp"), type = "DataFrame", client.id = const.client.id, client.secret = const.client.secret))
  if (class(data_frame)=="data.frame") {
    sname = "Albania - Population (Persons) - A"
    expect_equal(data_frame[['2020-01-01',sname]], 2.865)
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context ("get data frame with multi selection")
test_that("get data frame with multi selection",{
  data_frame = test_knoema_exp(Knoema('IMFWEO2017Oct', list('frequency' = 'A', 'Country' = '914;612;512', 'Subject' = 'LP;NID_NGDP'),type = 'DataFrame', client.id = const.client.id, client.secret = const.client.secret))
  if (class(data_frame)=="data.frame"){
    sname = "Albania - Investment (Percent of GDP) - A"
    expect_equal(data_frame[['2012-01-01',sname]], 29.824)
    sname ="Afghanistan - Investment (Percent of GDP) - A"
    expect_equal(data_frame[['2007-01-01',sname]], 55.856)
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context("get metadata frame")
test_that("get metadata frame",{
  data_frame = test_knoema_exp(Knoema("IMFWEO2017Oct", list(country = "914", subject = "lp"), type = "MetaDataFrame", client.id = const.client.id, client.secret = const.client.secret))
  if (class(data_frame)=="data.frame") {
    sname = "Albania - Population (Persons) - A"
    expect_equal(data_frame[['Country Id',sname]], "914")
    expect_equal(data_frame[['Unit',sname]], "Persons (Millions)")
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context ("get metadata frame with multi selection")
test_that("get metadata frame with multi selection",{
  data_frame = test_knoema_exp(Knoema('IMFWEO2017Oct', list('frequency' = 'A', 'Country' = '914;612;512', 'Subject' = 'LP;NID_NGDP'),type = 'MetaDataFrame', client.id = const.client.id, client.secret = const.client.secret))
  if (class(data_frame)=="data.frame") {
    sname = "Algeria - Population (Persons) - A"
    expect_equal(data_frame[['Unit',sname]], "Persons (Millions)")
    sname ="Afghanistan - Investment (Percent of GDP) - A"
    expect_equal(data_frame[['Subject SubjectDescription',sname]], "Investment")
    expect_equal(data_frame[['Unit',sname]], "Percent of GDP")
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context ("get series from dataset by partial selection dataframe")
test_that("get series from dataset by partial selection",{
  data_frame = test_knoema_exp(Knoema('IMFWEO2017Oct', list(subject = 'flibor6'),type = "DataFrame", client.id = const.client.id, client.secret = const.client.secret))
  if (class(data_frame)=="data.frame") {
    expect_equal(length(data_frame),2)
    sname = "Japan - Six-month London interbank offered rate (LIBOR) (Percent) - A"
    expect_equal(data_frame[['2012-01-01',sname]], 0.325)
    sname ="United States - Six-month London interbank offered rate (LIBOR) (Percent) - A"
    expect_equal(data_frame[['2007-01-01',sname]], 5.252)
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context ("get series from dataset by partial selection Metadataframe")
test_that("get series from dataset by partial selection",{
  data_frame = test_knoema_exp(Knoema('IMFWEO2017Oct', list(subject = 'flibor6'), type = "MetaDataFrame", client.id = const.client.id, client.secret = const.client.secret))
  if (class(data_frame)=="data.frame") {
    expect_equal(length(data_frame),2)
    sname = "Japan - Six-month London interbank offered rate (LIBOR) (Percent) - A"
    expect_equal(data_frame[['Unit',sname]], "Percent")
    expect_equal(data_frame[['Subject Id',sname]], "FLIBOR6")
    sname ="United States - Six-month London interbank offered rate (LIBOR) (Percent) - A"
    expect_equal(data_frame[['Country Id',sname]], "111")
    expect_equal(data_frame[['Mnemonics',sname]], "NULL")
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context ("get series from dataset by weekly frequency DataFame")
test_that("get series from dataset by weekly frequency DataFame",{
  data_frame = test_knoema_exp(Knoema('eqohmpb', list(country='512', Indicator='NGDP', frequency='W'), type = 'DataFrame', client.id = const.client.id, client.secret = const.client.secret))
  if (class(data_frame)=="data.frame") {
    expect_equal(length(data_frame),1)
    sname = "Afghanistan - Gross domestic product, current prices - W"
    expect_equal(data_frame[['2006-01-09',sname]], 10)
    expect_equal(data_frame[['2007-04-09',sname]], 14)
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context("get all series from dataset")
test_that("get all series from dataset",{
  data_frame = test_knoema_exp(Knoema("eqohmpb", type = "DataFrame", client.id = const.client.id, client.secret = const.client.secret))
  if (class(data_frame)=="data.frame") {
    expect_equal(length(data_frame),14)
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context("get all series from dataset with empty list")
test_that("get all series from dataset with empty list",{
  data_frame = test_knoema_exp(Knoema("eqohmpb", list(), type = "DataFrame", client.id = const.client.id, client.secret = const.client.secret))
  if (class(data_frame)=="data.frame") {
    expect_equal(length(data_frame),14)
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})
