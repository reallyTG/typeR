#!/usr/bin/Rscript --vanilla
is_wrong_os <- .Platform[["OS.type"]] == "windows" || grepl("^darwin",
                                                            R.version$os)
is_current_version <- compareVersion(paste(getRversion(), sep = "."),
                                     "3.4.0") >= 1
if (is_current_version && ! is_wrong_os) {
    is_failure <- function(result) {
        res <- RUnit::getErrors(result)
        names(res) <- tolower(names(res)) # soothe lintr
        sum_of_exceptions <- res[["nerr"]] + res[["nfail"]]
        fail <- as.logical(sum_of_exceptions)
        return(fail)
    }

    if (interactive()) {
        devtools::load_all(pkg = ".") # needed to use devtools' shim version of
        # base's system.file
        unit_dir <- system.file("inst", "runit_tests", package = "fakemake")
    } else {
        r_call <- commandArgs(trailingOnly = FALSE)
        require("fakemake", quietly = TRUE, character.only = TRUE) ||
            stop("package '", pkgname, "' not found")
        if (any(grepl("--file", r_call))) {
            unit_dir <- file.path("inst", "runit_tests")
        } else {
            unit_dir <- system.file("runit_tests", package = "fakemake")
        }
    }
    if (! dir.exists(unit_dir)) {
        stop("Can not find RUnit test directory ", unit_dir,
             ". Try to (re)install the package first.")
    }
    package_suite <- RUnit::defineTestSuite("fakemake_unit_test",
                                            dirs = unit_dir,
                                            testFileRegexp = "^.*\\.[rR]",
                                            testFuncRegexp = "^test_+")
    test_result <- RUnit::runTestSuite(package_suite)

    root <- tryCatch(rprojroot::find_root(rprojroot::is_r_package),
                     error = function(e) return(NULL))
    if (! is.null(root)) {
        log_dir <- file.path(root, "log")
        dir.create(log_dir, showWarnings = FALSE)
        file_name <- file.path(log_dir, "runit.log")
        html_file <- file.path(log_dir, "runit.html")
        RUnit::printHTMLProtocol(test_result, fileName = html_file)
        if (interactive()) {
            browseURL(paste0("file:", html_file))
        }
    } else {
        file_name <- ""
    }
    RUnit::printTextProtocol(test_result, showDetails = TRUE,
                             fileName = file_name)

    if (is_failure(test_result)) stop("RUnit failed. ", print(test_result))
}
