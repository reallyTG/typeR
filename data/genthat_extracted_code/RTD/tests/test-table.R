context('table')

library(webmockr)

webmockr::enable()

conn <- Td(apikey = "xxxxxxx")

test_that('list_tables works with mock', {
  stub_request("get", "https://api.treasuredata.com/v3/table/list/sample_datasets") %>%
    to_return(body = '{"tables":[
  {"id":210906,"name":"nasdaq","estimated_storage_size":168205061,"counter_updated_at":null,"last_log_timestamp":null,"type":"log","count":8807278,"expire_days":null,"created_at":"2014-10-08 02:57:38 UTC","updated_at":"2014-10-08 03:16:59 UTC","schema":"[]"},
  {"id":208715,"name":"www_access","estimated_storage_size":0,"counter_updated_at":"2014-10-04T01:13:20Z","last_log_timestamp":"2014-10-04T01:13:15Z","type":"log","count":5000,"expire_days":null,"created_at":"2014-10-04 01:13:12 UTC","updated_at":"2014-10-22 07:02:19 UTC","schema":"[]"}
  ],
  "database":"sample_datasets"
}', status = 200)
  tables <- list_tables(conn, "sample_datasets")
  expect_equal(dplyr::count(tables)$n, 2)
})

test_that('exist_table works with mock', {
  stub_request("get", "https://api.treasuredata.com/v3/table/list/sample_datasets") %>%
    to_return(body = '{"tables":[
              {"id":210906,"name":"nasdaq","estimated_storage_size":168205061,"counter_updated_at":null,"last_log_timestamp":null,"type":"log","count":8807278,"expire_days":null,"created_at":"2014-10-08 02:57:38 UTC","updated_at":"2014-10-08 03:16:59 UTC","schema":"[]"},
              {"id":208715,"name":"www_access","estimated_storage_size":0,"counter_updated_at":"2014-10-04T01:13:20Z","last_log_timestamp":"2014-10-04T01:13:15Z","type":"log","count":5000,"expire_days":null,"created_at":"2014-10-04 01:13:12 UTC","updated_at":"2014-10-22 07:02:19 UTC","schema":"[]"}
              ],
              "database":"sample_datasets"
}', status = 200)
  expect_true(exist_table(conn, 'sample_datasets', 'nasdaq'))
  expect_false(exist_table(conn, 'sample_datasets', 'unexist'))
})

test_that('create_table works with mock', {
  stub_request("post", "https://api.treasuredata.com/v3/table/create/sample_datasets/test/log") %>%
    to_return(body = "{}", status = 200)
  expect_true(create_table(conn, "sample_datasets", "test"))
})

test_that('delete_table works with mock', {
  stub_request("post", "https://api.treasuredata.com/v3/table/delete/sample_datasets/test") %>%
    to_return(body = '{"type": "log"}', status = 200)
  expect_equal(delete_table(conn, "sample_datasets", "test"), "log")
})
