context("getDataRepositoryData")
test_that("test if download works", {
  skip_on_cran()
  expect_s4_class(
    ar <- getDataRepositoryData(
      "https://www.datarepository.movebank.org/handle/10255/move.503"
    ),
    "MoveStack"
  )
  expect_message(
    at <- getDataRepositoryData("doi:10.5441/001/1.2k536j54"),
    "Non csv file\\(s\\) found \\(not included in data\\): \"Steller's eider \\(Polysticta stelleri\\) in northern Europe and northwest Russia \\(data from Petersen et al. 2006\\)-raw-argos-diag.txt\"*"
  )
  expect_equal(ar,
               at)
  expect_s4_class(getDataRepositoryData("doi:10.5441/001/1.2tp2j43g"),
                  "MoveStack")# data has windows line sep in ref data
  expect_s4_class(m <-
                    getDataRepositoryData("doi:10.5441/001/1.f01815nq")                  ,
                  "MoveStack")
  expect_equal(
    citations(m) ,
    "Dechmann DKN, Wikelski M, Varga K, Yohannes E, Fiedler W, Safi K, Burkhard W-D, O’Mara MT (2014) Tracking post-hibernation behavior and early migration does not reveal the expected sex-differences in a \"female-migrating\" bat. PLoS ONE. doi:10.1371/journal.pone.0114810"
  )
  expect_equal(sensor(getDataRepositoryData("doi:10.5441/001/1.82652t83")), as.factor(rep("radio-transmitter", 124)))
  expect_warning(
    m <-
      getDataRepositoryData("doi:10.5441/001/1.44183438"),
    "1 individual omitted since there is only outlier data"
  )
  expect_equal(unique(trackId(m)),
               structure(
                 1:28,
                 .Label = c(
                   "X1079",
                   "X1080",
                   "X1081",
                   "X1082",
                   "X1084",
                   "X1086",
                   "X1088",
                   "X1607",
                   "X1608",
                   "X1610",
                   "X1612",
                   "X1613",
                   "X1615",
                   "X1616",
                   "X1620",
                   "X1626",
                   "X1870_1",
                   "X1870_2",
                   "X1875",
                   "X2394",
                   "X2396",
                   "X2402",
                   "X2404",
                   "X2608",
                   "X2609",
                   "X2612",
                   "X2772",
                   "X697"
                 ),
                 class = "factor"
               ))
  expect_silent(suppressMessages(getDataRepositoryData('10.5441/001/1.k8s2g5v7')))
})
test_that("test some exceptions",{
  skip_on_cran()
  expect_error(
    getDataRepositoryData(
      "https://www.datarepository.movebank.org/handle/10255/move.644"
    ),
    "Currently multiple deployments are not implemented"
  )
  expect_warning(
    getDataRepositoryData(
      "https://www.datarepository.movebank.org/handle/10255/move.272"
    ),
    "Data is replaced now returning: doi:10.5441/001/1.f32gn841"
  )
})
