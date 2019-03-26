context("cacheManagement")

test_that("manageCache() tests sortBy values", {
  expect_error({
    removedCount <- manageCache(tempdir(),
                              extensions=".MazamaWebUtils-test",
                              maxCacheSize=1e-6, # 1 Byte
                              sortBy = "a")
  }, NULL) # expects error
  expect_error({
    removedCount <- manageCache(tempdir(),
                                extensions=".MazamaWebUtils-test",
                                maxCacheSize=1e-6, # 1 Byte
                                sortBy = "atime")
  }, NA) # expects no error
})

test_that("manageCache() doesn't remove files when maxCacheSize is big", {
  # setup
  count <- 4
  for ( i in 1:count ) {
    write.csv(iris,tempfile(fileext=".MazamaWebUtils-test"))  
  }
  removedCount <- manageCache(tempdir(),
                              extensions=".MazamaWebUtils-test",
                              maxCacheSize=1e6) # 1 TB
  
  expect_equal(removedCount, 0)
  
  # cleanup
  file.remove(list.files(tempdir(),
                         pattern=".MazamaWebUtils-test",
                         full.names=TRUE))
})

test_that("manageCache() removes files when maxCacheSize is small", {
  # setup
  count <- 4
  for ( i in 1:count ) {
    write.csv(iris,tempfile(fileext=".MazamaWebUtils-test"))  
  }
  removedCount <- manageCache(tempdir(),
                              extensions=".MazamaWebUtils-test",
                              maxCacheSize=1e-6) # 1 Byte
  
  expect_equal(removedCount, count)
})
