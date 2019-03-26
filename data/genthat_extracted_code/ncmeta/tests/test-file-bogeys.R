context("file-bogeys")

test_that("files and bad files are handled", {
  skip_if_not(we_are_raady())
  oisst_dayfile <- raadfiles::oisst_daily_files()$fullname[1]
  nc_meta(oisst_dayfile) %>% expect_named(c("dimension", "variable", "attribute", "axis", "grid", "source"
  ))
  oisst_monfile <- raadfiles::oisst_monthly_files()$fullname[1]
  nc_meta(oisst_monfile) %>% expect_named(c("dimension", "variable", "attribute", "axis", "grid", "source"
  ))
  roms_file <- raadtools::cpolarfiles()$fullname[1]
  nc_meta(roms_file) %>% expect_named(c("dimension", "variable", "attribute", "axis", "grid", "source"
  ))
  l3_file <- raadtools::ocfiles()$fullname[1]  
  expect_error(nc_vars(l3_file), "NetCDF: HDF error")
})

test_that("bad files and URLs fail gracefully", {
  skip_on_travis()  ## why does tis fail so badly on travis?
  skip_on_cran()
  expect_error(nc_meta(""), "empty string")
  expect_error(nc_meta(), "must be a valid NetCDF source, filename or URL")  
  expect_error(nc_meta("https://abc"), "failed to open 'x'")
})

