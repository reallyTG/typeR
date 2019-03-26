library(clustRcompaR)
context("Basic Functionality")

d <- inaugural_addresses
d <- dplyr::mutate(d, century = ifelse(Year < 1800, "17th",
                                       ifelse(Year >= 1800 & Year < 1900, "18th",
                                              ifelse(Year >= 1900 & Year < 2000, "19th", "20th"))))

three_clusters <- cluster(d, n_clusters = 3)

#saveRDS(object = three_clusters, file = "three_cluster.rds")

test_that("Clustering works correctly", {
  expect_known_output(three_clusters, "three_cluster.rds")
})
