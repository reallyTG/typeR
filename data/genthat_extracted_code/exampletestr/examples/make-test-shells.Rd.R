library(exampletestr)


### Name: make-test-shells
### Title: Create test shells.
### Aliases: make-test-shells make_test_shell_fun make_tests_shells_file
###   make_tests_shells_pkg

### ** Examples

usethis::create_package(tempdir(check = TRUE), open = FALSE)
file.copy(system.file("extdata", c("detect.R", "match.R"),
                      package = "exampletestr"),
          paste0(tempdir(), "/R"))
make_test_shell_fun("str_detect()", document = TRUE, open = FALSE,
                    pkg_dir = tempdir())
make_tests_shells_file("detect", document = FALSE, open = FALSE,
                       pkg_dir = tempdir())
make_tests_shells_pkg(overwrite = TRUE, document = FALSE,
                      pkg_dir = tempdir())




