testthat::context("Testing source files")
testthat::test_that("foo", {
                    old <- setwd(tempdir())
                    on.exit(setwd(old))
                        ml <- provide_make_list(type = "minimal")
                        make(ml[[1]][["target"]], ml)

                        src <- file.path(tempdir(), "src")
                        dir.create(src)
                        cat('print("foo")', file = file.path(src, "foo.R"))
                        cat('print("bar")', file = file.path(src, "bar.R"))
                        ml[[4]]["code"] <-
                            "lapply(list.files(src, full.names = TRUE), source)"
                        ml[[4]]["prerequisites"] <-
                            "list.files(src, full.names = TRUE)"
                        pre <- ml[[4]]["prerequisites"]
                        pre <- tryCatch(eval(parse(text = pre)),
                                        error = function(e) return(pre))
                        for (target in pre) {
                            index <- which(lapply(ml,
                                                  "[[", "target") == target)
                            if (identical(index, integer(0))) {
                                if (! file.exists(target)) {
                                    throw(paste0("There is no rule to make ",
                                                 target, "."))
                                } else {
                                    message("Prerequisite ", target, " found.")
                                }
                            }
                        }

                        #% make with updated source files
                        expectation <- ml[[4]][["target"]]
                        result <- make(ml[[4]][["target"]], ml)
                        testthat::expect_identical(result, expectation)
})
