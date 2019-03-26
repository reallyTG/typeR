testthat::test_that("reading gifti files", {
  tdir = tempdir()
  download_gifti_data(tdir)
  expect_true(have_gifti_test_data(tdir))

  ######################################
  # Make sure you can read stuff in
  ######################################
  gii_files = download_gifti_data(tdir)
  gii_list = lapply(gii_files, readgii)

  ################################
  # Making sure the other read gifti
  # functions work
  ################################
  gii1 = readGIfTI(gii_files[1])
  gii2 = read_gifti(gii_files[1])

  expect_identical(gii1, gii2)
  expect_identical(gii_list[[1]], gii2)

  # Checking surf_triangles
  surf_files = grep("white[.]surf[.]gii", gii_files, value = TRUE)
  surfs = lapply(surf_files, surf_triangles)

  expect_equal(names(surfs[[1]]), c("pointset", "triangle"))

  # Checking a shape file
  col_file = grep("white[.]shape[.]gii", gii_files, value = TRUE)
  cdata = readgii(col_file)
  expect_equal(names(cdata$data), c("shape"))

  # Checking a shape file
  ts_file = grep("white_projection[.]time[.]gii", gii_files, value = TRUE)
  tdata = readgii(ts_file)
  expect_equal(names(tdata$data), rep("timeseries", 128))

  ts_file = grep("white[.]inflated[.]surf[.]gii", gii_files, value = TRUE)
  tdata = readgii(ts_file)
  expect_equal(names(tdata$data), c("pointset", "triangle"))
})
