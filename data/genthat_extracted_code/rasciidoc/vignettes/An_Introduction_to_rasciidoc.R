## ----minimal_knitting_file, comment = ""---------------------------------
file_name <- system.file("files", "minimal", "knit.Rasciidoc",
                         package = "rasciidoc")
cat(readLines(file_name), sep = "\n")

## ----minimal_knitting_run------------------------------------------------
withr::with_dir(tempdir(), {
                    file.copy(file_name, ".")
                    rasciidoc::render(basename(file_name))
})

## ----simple_knitting_file, comment = ""----------------------------------
file_name <- system.file("files", "simple", "knit.Rasciidoc",
                         package = "rasciidoc")
cat(readLines(file_name), sep = "\n")

## ----get_codes-----------------------------------------------------------
my_directory <- file.path(tempdir(), "simple")
dir.create(my_directory)
withr::with_dir(my_directory, {
                    file.copy(file_name, ".")
                    file.copy(file.path(dirname(file_name), "src"), ".",
                              recursive = TRUE)
})
dir(my_directory, recursive = TRUE, full.names = TRUE)

## ----simple_knitting_run-------------------------------------------------
rasciidoc::render(file.path(my_directory, basename(file_name)))

## ----simple_spinnig_file, comment = ""-----------------------------------
file_name <- system.file("files", "simple", "spin.R_nolint",
                         package = "rasciidoc")
cat(readLines(file_name), sep = "\n")

## ----simple_spinnig_run--------------------------------------------------
withr::with_dir(tempdir(), {
                    file.copy(file_name, ".", overwrite = TRUE)
                    file.copy(file.path(dirname(file_name), "src"), ".",
                              recursive = TRUE)
                    rasciidoc::render(basename(file_name))
})

## ----hooks---------------------------------------------------------------
rasciidoc::render(file.path(tempdir(), basename(file_name)), hooks = NULL)

