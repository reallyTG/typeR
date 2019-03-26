context("oa_get_lots")

# test_that("oa_get works on lots of different urls", {
#   skip_on_cran()
#   skip_on_travis() # because they'd take a long time to run
#
#   urls <- c('http://data.openaddresses.io.s3.amazonaws.com/20150727/au-tas-launceston.csv',
#             'http://data.openaddresses.io.s3.amazonaws.com/20150713/ca-bc-okanagan_similkameen.zip',
#             'http://data.openaddresses.io.s3.amazonaws.com/20150626/ca-on-ottawa.zip',
#             'http://data.openaddresses.io.s3.amazonaws.com/20150511/ca-on-york_region.zip',
#             'http://s3.amazonaws.com/openaddresses-cfa/20141030/de-berlin.zip',
#             'http://data.openaddresses.io.s3.amazonaws.com/20150523/fr-bano.zip')
#
#   # check many others to make sure they don't break
#   expect_is(suppressMessages(oa_get(urls[1])), "tbl_df")
#   expect_is(suppressMessages(oa_get(urls[2])), "tbl_df")
#   #expect_is(suppressMessages(oa_get(urls[3])), "tbl_df")
#   #expect_is(suppressMessages(oa_get(urls[4])), "tbl_df")
#   #expect_is(suppressMessages(oa_get(urls[5])), "tbl_df")
#   expect_is(suppressMessages(oa_get(urls[6])), "tbl_df")
# })
