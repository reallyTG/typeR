## ------------------------------------------------------------------------
str(fakemake::provide_make_list("minimal", clean_sink = TRUE))

## ------------------------------------------------------------------------
ml <- fakemake::provide_make_list("minimal", clean_sink = TRUE)

## ------------------------------------------------------------------------
withr::with_dir(tempdir(), print(fakemake::make("all.Rout", ml)))

## ------------------------------------------------------------------------
show_file_mtime <- function(files = list.files(tempdir(), full.names = TRUE,
                                               pattern = "^.*\\.Rout")) {
    return(file.info(files)["mtime"])
}
show_file_mtime()

## ------------------------------------------------------------------------
# ensure the modification time would change if the files were recreated
Sys.sleep(1)
withr::with_dir(tempdir(), print(fakemake::make("all.Rout", ml)))
show_file_mtime()

## ------------------------------------------------------------------------
fakemake::touch(file.path(tempdir(), "b1.Rout"))
withr::with_dir(tempdir(), print(fakemake::make("all.Rout", ml)))
show_file_mtime()

## ---- echo = FALSE-------------------------------------------------------
# touch should do the job...
Sys.sleep(1)

## ------------------------------------------------------------------------
fakemake::touch(file.path(tempdir(), "a1.Rout"))
withr::with_dir(tempdir(), print(fakemake::make("all.Rout", ml)))
show_file_mtime()

## ------------------------------------------------------------------------
withr::with_dir(tempdir(), print(fakemake::make("all.Rout", ml, force = TRUE)))

## ------------------------------------------------------------------------
withr::with_dir(tempdir(), print(fakemake::make("all.Rout", ml, force = TRUE,
                                                recursive = FALSE)))

## ------------------------------------------------------------------------
i <- which(sapply(ml, "[[", "target") == "all.Rout")
ml[[i]]["alias"] <- "all"
withr::with_dir(tempdir(), print(fakemake::make("all", ml, force = TRUE)))

## ------------------------------------------------------------------------
cat(readLines(file.path(tempdir(), "b1.Rout")), sep = "\n")

## ------------------------------------------------------------------------
i <- which(sapply(ml, "[[", "target") == "b1.Rout")
ml[[i]]["code"]  <- paste(ml[[i]]["code"],
                      "cat('hello, world\n', file = \"b1.Rout\")",
                      "print(\"foobar\")",
                      sep = ";")
withr::with_dir(tempdir(), print(fakemake::make("b1.Rout", ml, force = TRUE)))
cat(readLines(file.path(tempdir(), "b1.Rout")), sep = "\n")

## ------------------------------------------------------------------------
ml[[i]]["sink"] <- "b1.txt"
withr::with_dir(tempdir(), print(fakemake::make("b1.Rout", ml, force = TRUE)))

## ------------------------------------------------------------------------
cat(readLines(file.path(tempdir(), "b1.Rout")), sep = "\n")
cat(readLines(file.path(tempdir(), "b1.txt")), sep = "\n")

## ------------------------------------------------------------------------
i <- which(sapply(ml, "[[", "target") == "a1.Rout")
ml[[i]]["code"]

## ------------------------------------------------------------------------
cat(readLines(file.path(tempdir(), "a1.Rout")), sep = "\n")

## ------------------------------------------------------------------------
ml[[i]]["code"]  <- NULL
withr::with_dir(tempdir(), print(fakemake::make("a1.Rout", ml, force = TRUE)))

## ------------------------------------------------------------------------
file.size(file.path(tempdir(), "a1.Rout"))

## ------------------------------------------------------------------------
ml[[i]][".PHONY"]  <- TRUE
withr::with_dir(tempdir(), print(fakemake::make("a1.Rout", ml)))

## ----create_package, results = "hide", message = FALSE-------------------
pkg_path <- file.path(tempdir(), "fakepack")
unlink(pkg_path, force = TRUE, recursive = TRUE)
usethis::create_package(pkg_path)

## ------------------------------------------------------------------------
file.copy(system.file("templates", "throw.R", package = "fakemake"),
          file.path(pkg_path, "R"))

## ------------------------------------------------------------------------
ml <- fakemake::provide_make_list("standard")

## ----fig.width = 6.8, fig.height = 6.8-----------------------------------
withr::with_dir(pkg_path, fakemake::visualize(ml))

## ----fig.width = 6.8, fig.height = 6.8-----------------------------------
withr::with_dir(pkg_path, fakemake::visualize(ml, root = "log/check.Rout"))

## ------------------------------------------------------------------------
index <- which(sapply(ml, function(x) x["alias"] == "build"))
ml[[index]]

## ------------------------------------------------------------------------
index <- which(sapply(ml, function(x) x["alias"] == "testthat"))
ml[[index]][["prerequisites"]]

## ---- warning = FALSE, message = FALSE-----------------------------------
withr::with_dir(pkg_path, print(fakemake::make("check", ml)))

## ------------------------------------------------------------------------
list.files(file.path(pkg_path, "log"))

## ------------------------------------------------------------------------
cat(readLines(file.path(pkg_path, "log", "roxygen2.Rout")), sep = "\n")

## ------------------------------------------------------------------------
system.time(suppressMessages(withr::with_dir(pkg_path,
                                             print(fakemake::make("check",
                                                                  ml)))))

## ------------------------------------------------------------------------
cat(readLines(file.path(pkg_path, "log", "covr.Rout")), sep = "\n")

## ------------------------------------------------------------------------
dir.create(file.path(pkg_path, "tests", "testthat"), recursive = TRUE)
file.copy(system.file("templates", "testthat.R", package = "fakemake"),
          file.path(pkg_path, "tests"))
file.copy(system.file("templates", "test-throw.R", package = "fakemake"),
          file.path(pkg_path, "tests", "testthat"))


## ----fig.width = 6.8, fig.height = 6.8-----------------------------------
withr::with_dir(pkg_path, fakemake::visualize(ml))

## ---- warning = FALSE, message = FALSE-----------------------------------
withr::with_dir(pkg_path, print(fakemake::make("build", ml)))

## ------------------------------------------------------------------------
cat(readLines(file.path(pkg_path, "log", "covr.Rout")), sep = "\n")

