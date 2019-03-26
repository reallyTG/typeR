library(sparklyr)

library(sparkavro)
library(dplyr)
if(!exists("sc")){
  spark_install()
  sc <- spark_connect(master="local")
}

test_that("read existing avro", {
  df <- spark_read_avro(sc, "twitter", system.file("extdata", package="sparkavro"), "twitter.avro", memory = FALSE)
  expect_equal(df %>% collect() %>% length(), 3)
})

test_that("write Spark DataFrame into avro", {
  df <- spark_read_avro(sc, "twitter", system.file("extdata", package="sparkavro"), "twitter.avro", memory = FALSE)
  df2 <- df %>% filter(username == "miguno")
  filename <- tempfile("test", fileext=".avro")
  spark_write_avro(df2, filename)
  expect_true(file.exists(filename))
})
