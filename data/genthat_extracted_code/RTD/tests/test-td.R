context('td')

library(mockery)

con <- Td(apikey="xxxxx")
embulk_exec <- if(.Platform$OS.type == "windows") "embulk.bat" else "embulk"


test_that("td_upload works with mock",{
  template_path <- system.file("extdata", "tsv_upload.yml.liquid", package="RTD")
  m <- mock(0, 0)
  with_mock(
    exist_database = mock(FALSE),
    exist_table = mock(FALSE),
    create_database = mock(TRUE),
    create_table = mock(TRUE),
    delete_table = mock(TRUE),
    tempdir = mock("/tmp"),
    `readr::write_tsv` = mock(TRUE),
    `Sys.which` = mock("/home/RTD/bin/embulk"),
    `system2` = m,
    {
      td_upload(con, "test", "iris", iris)
    }
  )
  expect_args(m, 1, embulk_exec, paste("guess", template_path, "-o /tmp/load.yml"))
  expect_args(m, 2, embulk_exec, "run /tmp/load.yml")
})

test_that("td_upload works with mock when the table already exists",{
  template_path <- system.file("extdata", "tsv_upload.yml.liquid", package="RTD")
  m <- mock(0, 0)
  with_mock(
    exist_database = mock(FALSE, cycle = TRUE),
    exist_table = mock(TRUE, cycle = TRUE),
    create_database = mock(TRUE, cycle = TRUE),
    create_table = mock(TRUE, cycle = TRUE),
    delete_table = mock(TRUE, cycle = TRUE),
    tempdir = mock("/tmp", cycle = TRUE),
    `readr::write_tsv` = mock(TRUE, cycle = TRUE),
    `Sys.which` = mock("/home/RTD/bin/embulk", cycle = TRUE),
    `system2` = m,
    {
      expect_error(td_upload(con, "test", "iris", iris), ".* already exists.")
      td_upload(con, "test", "iris", iris, overwrite = TRUE)
    }
  )
  expect_args(m, 1, embulk_exec, paste("guess", template_path, "-o /tmp/load.yml"))
  expect_args(m, 2, embulk_exec, "run /tmp/load.yml")
})

