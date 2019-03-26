context('database')

library(webmockr)

webmockr::enable()

conn <- Td(apikey = "xxxxxxx")

test_that('list_databases works with mock', {
  stub_request("get", "https://api.treasuredata.com/v3/database/list") %>%
    to_return(body =  "{\"databases\":[{\"name\":\"test\",\"created_at\":\"2011-07-23 00:00:00 UTC\",\"updated_at\":\"2011-07-23 16:32:52 UTC\",\"count\":10901115119,\"organization\":null,\"permission\":\"administrator\",\"delete_protected\":false}]}", status = 200)
  expect_true(is.data.frame(list_databases(conn)))
})

test_that('exist_databae works with mock', {
  stub_request("get", "https://api.treasuredata.com/v3/database/list") %>%
    to_return(body = "{\"databases\":[{\"name\":\"test\",\"created_at\":\"2011-07-23 00:00:00 UTC\",\"updated_at\":\"2011-07-23 16:32:52 UTC\",\"count\":10901115119,\"organization\":null,\"permission\":\"administrator\",\"delete_protected\":false}]}", status = 200)
  expect_true(exist_database(conn, 'test'))
  expect_false(exist_database(conn, 'unexist'))
})

test_that('create_database works with mock', {
  stub_request("post", "https://api.treasuredata.com/v3/database/create/test") %>%
    to_return(body = "{}", status = 200)
  expect_true(create_database(conn, "test"))
})

test_that('create_database works with mock', {
  stub_request("post", "https://api.treasuredata.com/v3/database/delete/test") %>%
    to_return(body = "{}", status = 200)
  expect_true(create_database(conn, "test"))
})
