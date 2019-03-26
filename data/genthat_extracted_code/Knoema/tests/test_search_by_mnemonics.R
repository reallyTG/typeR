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


context("search by mnememonics - annual - MetaDataframe - one dataset")
test_that("search by mnememonics - annual - MetaDataframe one dataset",{
  data_frame = test_knoema_exp(Knoema("eqohmpb", mnemonics="512NGDP_A_in_test_dataset", type = "MetaDataFrame", client.id = const.client.id, client.secret = const.client.secret))
  if (class(data_frame)=="data.frame") {
    sname = "512NGDP_A_in_test_dataset"
    expect_equal(nrow(data_frame),5)
    expect_equal(data_frame[['Mnemonics',sname]], '512NGDP_A_in_test_dataset')
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context("search by mnememonics - semiannual, daily - DataFrame one dataset")
test_that("search by mnememonics - semiannual, daily - DataFrame one dataset",{
  data_frame = test_knoema_exp(Knoema("eqohmpb", mnemonics="512NGDP_S_in_test_dataset;512NGDP_D_in_test_dataset", type = "DataFrame", client.id = const.client.id, client.secret = const.client.secret))
  if (is.list(data_frame)) {
    expect_equal(length(data_frame),2)
    sname = "512NGDP_S_in_test_dataset"
    expect_equal(data_frame[['2003-07-01',sname]], 2)
    sname = "512NGDP_D_in_test_dataset"
    expect_equal(data_frame[['2004-10-03',sname]], 17)
    expect_equal(data_frame[['2004-12-02',sname]], 16)
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context("search by mnememonics - quarterly, monthly - ts one dataset")
test_that("search by mnememonics - quarterly, monthly - ts one dataset",{
  data_frame = test_knoema_exp(Knoema("eqohmpb", mnemonics="512NGDP_Q_in_test_dataset;512NGDP_M_in_test_dataset", client.id = const.client.id, client.secret = const.client.secret))
  if (is.list(data_frame)) {
    expect_equal(length(data_frame),2)
    sname = "512NGDP_Q_in_test_dataset"
    time_ser = data_frame[[sname]]
    value = window(time_ser, start=c(2003,2),frequency=4)[[1]]
    expect_equal(value, 5)
    sname = "512NGDP_M_in_test_dataset"
    time_ser = data_frame[[sname]]
    value = window(time_ser, start=c(2003,2),frequency=12)[[1]]
    expect_equal(value, 80.7144, tolerance=0.001)
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context("search by mnememonics - annual - MetaDataframe all datasets")
test_that("search by mnememonics - annual - MetaDataframe all datasets",{
  data_frame = test_knoema_exp(Knoema(NULL, mnemonics="512NGDP_A_in_test_dataset", type = "MetaDataFrame", client.id = const.client.id, client.secret = const.client.secret))
  if (class(data_frame)=="data.frame") {
    sname = "512NGDP_A_in_test_dataset"
    expect_equal(nrow(data_frame),5)
    expect_equal(data_frame[['Mnemonics',sname]], '512NGDP_A_in_test_dataset')
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context("search by mnememonics - semiannual, daily - DataFrame all datasets")
test_that("search by mnememonics - semiannual, daily - DataFrame all datasets",{
  data_frame = test_knoema_exp(Knoema(dataset = NULL, mnemonics="512NGDP_S_in_test_dataset;512NGDP_D_in_test_dataset", type = "DataFrame", client.id = const.client.id, client.secret = const.client.secret))
  if (class(data_frame)=="data.frame") {
    expect_equal(length(data_frame),2)
    sname = "512NGDP_S_in_test_dataset"
    expect_equal(data_frame[['2003-07-01',sname]], 2)
    sname = "512NGDP_D_in_test_dataset"
    expect_equal(data_frame[['2004-10-03',sname]], 17)
    expect_equal(data_frame[['2004-12-02',sname]], 16)
  } else {
    expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})

context("search by mnememonics - quarterly, monthly - ts all datasets")
test_that("search by mnememonics - quarterly, monthly - ts all datasets",{
  data_frame = test_knoema_exp(Knoema(mnemonics="512NGDP_Q_in_test_dataset;512NGDP_M_in_test_dataset", client.id = const.client.id, client.secret = const.client.secret))
  if (is.list(data_frame)) {
    expect_equal(length(data_frame),2)
    sname = "512NGDP_Q_in_test_dataset"
    time_ser = data_frame[[sname]]
    value = window(time_ser, start=c(2003,2),frequency=4)[[1]]
    expect_equal(value, 5)
    sname = "512NGDP_M_in_test_dataset"
    time_ser = data_frame[[sname]]
    value = window(time_ser, start=c(2003,2),frequency=12)[[1]]
    expect_equal(value, 80.7144, tolerance=0.001)
  } else {
      expect_equal(data_frame,"Client error: (403) Forbidden")
  }
})
