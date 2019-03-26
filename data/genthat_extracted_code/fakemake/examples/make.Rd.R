library(fakemake)


### Name: make
### Title: Mock the Unix Make Utility
### Aliases: make

### ** Examples

str(make_list <- provide_make_list("minimal"))
# build all
withr::with_dir(tempdir(), print(make("all.Rout", make_list)))
# nothing to be done
withr::with_dir(tempdir(), print(make("all.Rout", make_list)))
# forcing all.Rout
withr::with_dir(tempdir(), print(make("all.Rout", make_list, force = TRUE,
                                      recursive = FALSE)))
# forcing all.Rout recursively
withr::with_dir(tempdir(), print(make("all.Rout", make_list, force = TRUE)))

## Don't show: 
is_wrong_os <- .Platform[["OS.type"]] == "windows" || grepl("^darwin",
                                                            R.version$os)
is_current_version <- compareVersion(paste(getRversion(), sep = "."),
                                     "3.4.0") >= 1
if (is_current_version && ! is_wrong_os) {
withr::with_dir(tempdir(), {
                str(make_list <- provide_make_list(type = "minimal"))
                make(make_list[[1]][["target"]], make_list)

#% rerun
# need to sleep on fast machine as the file modification times are identical
# otherwise.
Sys.sleep(1)
src <- file.path(tempdir(), "src")
dir.create(src)
cat('print("foo")', file = file.path(src, "foo.R"))
cat('print("bar")', file = file.path(src, "bar.R"))
make_list[[4]]["code"] <- "lapply(list.files(src, full.names = TRUE),
                                  source)"
make_list[[4]]["prerequisites"] <- "list.files(src, full.names = TRUE)"

#% make with updated source files
expectation <- make_list[[4]][["target"]]
result <- make(make_list[[4]][["target"]], make_list)
print(result)
RUnit::checkTrue(identical(result, expectation))

#% rerun
# need to sleep on fast machine as the file modification times are identical
# otherwise.
Sys.sleep(1)
expectation <- NULL
result <- make(make_list[[4]][["target"]], make_list)
RUnit::checkTrue(identical(result, expectation))

#% touch source file and rerun
fakemake:::touch(file.path(src, "bar.R"))
expectation <- make_list[[4]][["target"]]
result <- make(make_list[[4]][["target"]], make_list)
RUnit::checkTrue(identical(result, expectation))
}
)
}
## End(Don't show)



