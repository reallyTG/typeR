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


context("get data single series by member id ts")
test_that("get data single series by member id ts",{
  data_frame = test_knoema_exp(Knoema("IMFWEO2017Oct", list(country = "914", subject = "lp"), client.id = const.client.id, client.secret = const.client.secret))
  if (is.list(data_frame)) {
    expect_equal(length(data_frame),1)
    sname = "A - Albania - Population (Persons)"
    time_ser = data_frame[[sname]]
    expect_equal(is.ts(time_ser),TRUE)
    expect_equal(is.zoo(time_ser),FALSE)
    expect_equal(is.xts(time_ser),FALSE)
    expect_equal(time_ser[1], 2.762)
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context("get data multi series by member id ts")
test_that("get data multi series by member id ts",{
  data_frame = test_knoema_exp(Knoema("IMFWEO2017Oct", list(country="914;512;111", subject="lp;ngdp"), client.id = const.client.id, client.secret = const.client.secret))
  if (is.list(data_frame)) {
    expect_equal(length(data_frame),6)
    sname = "A - United States - Gross domestic product, current prices (National currency)"
    time_ser = data_frame[[sname]]
    expect_equal(is.ts(time_ser),TRUE)
    expect_equal(is.zoo(time_ser),FALSE)
    expect_equal(is.xts(time_ser),FALSE)
    expect_equal(time_ser[1], 2862.475)
    value = window(time_ser, start=c(2020,1),frequency=1)[[1]]
    expect_equal(value, 21846.332)
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context("get data multi series by member name ts")
test_that("get data multi series by member name",{
  subj_names = "Gross domestic product, current prices (National currency);population (persons)"
  data_frame = test_knoema_exp(Knoema("IMFWEO2017Oct", list(country="albania;afghanistan;united states", subject=subj_names),client.id = const.client.id, client.secret = const.client.secret))
  if (is.list(data_frame)) {
    expect_equal(length(data_frame),6)
    sname = "A - United States - Gross domestic product, current prices (National currency)"
    time_ser = data_frame[[sname]]
    expect_equal(is.ts(time_ser),TRUE)
    expect_equal(is.zoo(time_ser),FALSE)
    expect_equal(is.xts(time_ser),FALSE)
    expect_equal(time_ser[1], 2862.475)
    value = window(time_ser, start=c(2020,1),frequency=1)[[1]]
    expect_equal(value, 21846.332)
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context("get data multi series by member id range ts")
test_that("get data multi series by member id range",{
  data_frame = test_knoema_exp(Knoema("IMFWEO2017Oct", list(country="914;512;111", subject="lp;ngdp", timerange="2015-2020"), client.id = const.client.id, client.secret = const.client.secret))
  if (is.list(data_frame)) {
    expect_equal(length(data_frame),6)
    sname = "A - United States - Gross domestic product, current prices (National currency)"
    time_ser = data_frame[[sname]]
    expect_equal(is.ts(time_ser),TRUE)
    expect_equal(is.zoo(time_ser),FALSE)
    expect_equal(is.xts(time_ser),FALSE)
    expect_equal(time_ser[1], 18120.70)
    value = window(time_ser, start=c(2018,1),frequency=1)[[1]]
    expect_equal(value, 20199.96)
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context("get data single series different frequencies by member id ts")
test_that("get data single series different frequencies by member id ts",{
 data_frame = test_knoema_exp(Knoema('eqohmpb', list(country='512', Indicator='NGDP'), client.id = const.client.id, client.secret = const.client.secret))
 if (is.list(data_frame)) {
  expect_equal(length(data_frame),6)
  sname = "M - Afghanistan - Gross domestic product, current prices"
  time_ser = data_frame[[sname]]
  expect_equal(is.ts(time_ser),TRUE)
  expect_equal(is.zoo(time_ser),FALSE)
  expect_equal(is.xts(time_ser),FALSE)
  expect_equal(time_ser[1], 26.02858, tolerance = 0.0001)
  value = window(time_ser, start=c(2003,2),frequency=12)[[1]]
  expect_equal(value, 80.71440, tolerance = 0.0001)

  sname = "Q - Afghanistan - Gross domestic product, current prices"
  time_ser = data_frame[[sname]]
  expect_equal(is.ts(time_ser),TRUE)
  expect_equal(is.zoo(time_ser),FALSE)
  expect_equal(is.xts(time_ser),FALSE)
  expect_equal(time_ser[1], 4)

  value = window(time_ser, start=c(2003,2),frequency=4)[[1]]
  expect_equal(value, 5)
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context("get data multi series single frequency by member id ts")
test_that("get data multi series single frequency by member id ts",{
  data_frame = test_knoema_exp(Knoema('eqohmpb', list(country='512', Indicator='NGDP;NGDP_D', frequency='M'), client.id = const.client.id, client.secret = const.client.secret))

  if (is.list(data_frame)) {
    expect_equal(length(data_frame),2)

    sname = "M - Afghanistan - Gross domestic product, current prices"
    time_ser = data_frame[[sname]]
    expect_equal(is.ts(time_ser),TRUE)
    expect_equal(is.zoo(time_ser),FALSE)
    expect_equal(is.xts(time_ser),FALSE)
    expect_equal(time_ser[1], 26.02858, tolerance = 0.0001)
    value = window(time_ser, start=c(2003,2),frequency=12)[[1]]
    expect_equal(value, 80.71440, tolerance = 0.0001)

    sname = "M - Afghanistan - Gross domestic product, deflator"
    time_ser = data_frame[[sname]]
    expect_equal(is.ts(time_ser),TRUE)
    expect_equal(is.zoo(time_ser),FALSE)
    expect_equal(is.xts(time_ser),FALSE)
    value = window(time_ser, start=c(2003,1),frequency=1)[[1]]
    expect_equal(value, 16)
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context("get data multi series multi frequency by member id ts")
test_that("get data multi series multi frequency by member id ts",{
  data_frame = test_knoema_exp(Knoema('eqohmpb', list(country='512', Indicator='NGDP;NGDP_D', frequency='A;M'), client.id = const.client.id, client.secret = const.client.secret))

  if (is.list(data_frame)) {
    expect_equal(length(data_frame),4)

    sname = "M - Afghanistan - Gross domestic product, current prices"
    time_ser = data_frame[[sname]]
    expect_equal(is.ts(time_ser),TRUE)
    expect_equal(is.zoo(time_ser),FALSE)
    expect_equal(is.xts(time_ser),FALSE)
    expect_equal(time_ser[1], 26.02858, tolerance = 0.0001)
    value = window(time_ser, start=c(2003,2),frequency=12)[[1]]
    expect_equal(value, 80.71440, tolerance = 0.0001)

    sname = "A - Afghanistan - Gross domestic product, deflator"
    time_ser = data_frame[[sname]]
    expect_equal(is.ts(time_ser),TRUE)
    expect_equal(is.zoo(time_ser),FALSE)
    expect_equal(is.xts(time_ser),FALSE)
    value = window(time_ser, start=c(2003,1),frequency=1)[[1]]
    expect_equal(value, 110.706)
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context("get data multi series multi frequency by member id range ts")
test_that("get data multi series multi frequency by member id range ts",{
 data_frame = test_knoema_exp(Knoema('eqohmpb', list(country='512', Indicator='NGDP;NGDP_D', frequency='A;M', timerange = '2004M1-2006M12'), client.id = const.client.id, client.secret = const.client.secret))

 if (is.list(data_frame)) {
   expect_equal(length(data_frame),4)

   sname = "M - Afghanistan - Gross domestic product, current prices"
   time_ser = data_frame[[sname]]
   expect_equal(is.ts(time_ser),TRUE)
   expect_equal(is.zoo(time_ser),FALSE)
   expect_equal(is.xts(time_ser),FALSE)
   value = window(time_ser, start=c(2004,1),frequency=12)[[1]]
   expect_equal(value, 90.82493, tolerance = 0.0001)

   sname = "A - Afghanistan - Gross domestic product, deflator"
   time_ser = data_frame[[sname]]
   expect_equal(is.ts(time_ser),TRUE)
   expect_equal(is.zoo(time_ser),FALSE)
   expect_equal(is.xts(time_ser),FALSE)
   value = window(time_ser, start=c(2004,1),frequency=1)[[1]]
   expect_equal(value, 123.063)
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context("get data from dataset with multiword dimnames ts")
test_that("get data from dataset with multiword dimnames ts",{
  data_frame = test_knoema_exp(Knoema("eqohmpb", list("Country"= "512", "Indicator"= "NGDP"), type = "ts", client.id = const.client.id, client.secret = const.client.secret))

  if (is.list(data_frame)) {
    expect_equal(length(data_frame),6)

    sname = "M - Afghanistan - Gross domestic product, current prices"
    time_ser = data_frame[[sname]]
    expect_equal(is.ts(time_ser),TRUE)
    expect_equal(is.zoo(time_ser),FALSE)
    expect_equal(is.xts(time_ser),FALSE)
    expect_equal(time_ser[1], 26.02858, tolerance = 0.0001)
    value = window(time_ser, start=c(2003,2),frequency=12)[[1]]
    expect_equal(value, 80.71440, tolerance = 0.0001)

    sname = "Q - Afghanistan - Gross domestic product, current prices"
    time_ser = data_frame[[sname]]
    expect_equal(is.ts(time_ser),TRUE)
    expect_equal(is.zoo(time_ser),FALSE)
    expect_equal(is.xts(time_ser),FALSE)
    expect_equal(time_ser[1], 4)

    value = window(time_ser, start=c(2003,2),frequency=4)[[1]]
    expect_equal(value, 5)
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context("get data multi series by member key ts")
test_that("get data multi series by member key ts",{
  data_frame = test_knoema_exp(Knoema("IMFWEO2017Oct", list(country="1000010;1000000;1001830", subject="1000370;1000040"), client.id = const.client.id, client.secret = const.client.secret))

  if (is.list(data_frame)) {
    expect_equal(length(data_frame),6)

    sname = "A - Afghanistan - Gross domestic product, current prices (National currency)"
    time_ser = data_frame[[sname]]
    expect_equal(is.ts(time_ser),TRUE)
    expect_equal(is.zoo(time_ser),FALSE)
    expect_equal(is.xts(time_ser),FALSE)
    expect_equal(time_ser[1], 178.756)
    value = window(time_ser, start=c(2019,1),frequency=1)[[1]]
    expect_equal(value, 1722.521)
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context("get data from dataset by dim ids ts")
test_that("get data from dataset by dim ids ts",{
  data_frame = test_knoema_exp(Knoema("eqohmpb", list("country"= "512", "Indicator"= "NGDP"), type = "ts", client.id = const.client.id, client.secret = const.client.secret))

  if (is.list(data_frame)) {
    expect_equal(length(data_frame),6)

    sname = "M - Afghanistan - Gross domestic product, current prices"
    time_ser = data_frame[[sname]]
    expect_equal(is.ts(time_ser),TRUE)
    expect_equal(is.zoo(time_ser),FALSE)
    expect_equal(is.xts(time_ser),FALSE)
    expect_equal(time_ser[1], 26.02858, tolerance = 0.0001)
    value = window(time_ser, start=c(2003,2),frequency=12)[[1]]
    expect_equal(value, 80.71440, tolerance = 0.0001)

    sname = "Q - Afghanistan - Gross domestic product, current prices"
    time_ser = data_frame[[sname]]
    expect_equal(is.ts(time_ser),TRUE)
    expect_equal(is.zoo(time_ser),FALSE)
    expect_equal(is.xts(time_ser),FALSE)
    expect_equal(time_ser[1], 4)

    value = window(time_ser, start=c(2003,2),frequency=4)[[1]]
    expect_equal(value, 5)
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context ("get series from dataset by partial selection ts")
test_that("get series from dataset by partial selection ts",{
  data_frame = test_knoema_exp(Knoema('IMFWEO2017Oct', list(subject = 'flibor6'), client.id = const.client.id, client.secret = const.client.secret))
  if (is.list(data_frame)) {
    expect_equal(length(data_frame),2)

    sname = "A - Japan - Six-month London interbank offered rate (LIBOR) (Percent)"

    time_ser = data_frame[[sname]]
    expect_equal(is.ts(time_ser),TRUE)
    expect_equal(is.zoo(time_ser),FALSE)
    expect_equal(is.xts(time_ser),FALSE)
    expect_equal(time_ser[1], 10.861)
    expect_equal(time_ser[39], 0.178)
  } else {
   expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})
