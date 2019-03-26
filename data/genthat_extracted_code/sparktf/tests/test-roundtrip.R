context("roundtrip")

test_that("we can roundtrip with sparktf", {
  test_requires("dplyr")
  sc <- testthat_spark_connection()
  iris_tbl <- testthat_tbl("iris")
  
  data_path <- file.path(tempdir(), "iris")
  
  df1 <- iris_tbl %>%
    ft_string_indexer_model(
      "Species", "label",
      labels = c("setosa", "versicolor", "virginica")
    )
  
  df1 %>%
    spark_write_tfrecord(
      path = data_path,
      write_locality = "local"
    )
  
  df2 <- spark_read_tfrecord(sc, data_path)
  
  collect_sorted_local_df <- function(x) {
    x %>%
      dplyr::select(label, Petal_Length, Petal_Width, Sepal_Length, Sepal_Width, Species) %>%
      dplyr::arrange(label, Petal_Length, Petal_Width, Sepal_Length, Sepal_Width, Species) %>%
      dplyr::collect() %>%
      dplyr::mutate_if(is.numeric, round, 2)
  }
  
  expect_equal(
    collect_sorted_local_df(df1),
    collect_sorted_local_df(df2)
  )
})