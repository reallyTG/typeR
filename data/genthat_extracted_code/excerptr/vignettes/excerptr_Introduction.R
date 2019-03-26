## ---- comment = ""-------------------------------------------------------
path <- system.file("tests", "files", "some_file.R", package = "excerptr")
cat(readLines(path), sep = "\n")

## ------------------------------------------------------------------------
excerptr::excerptr(file_name = path, run_pandoc = FALSE, output_path = tempdir())

## ---- comment = ""-------------------------------------------------------
cat(readLines(file.path(tempdir(), sub("\\.R$", ".md", basename(path)))), 
    sep = "\n")

## ------------------------------------------------------------------------
is_pandoc_installed <- nchar(Sys.which("pandoc")) > 0 &&
                              nchar(Sys.which("pandoc-citeproc")) > 0
is_pandoc_version_sufficient <- FALSE
if (is_pandoc_installed) {
    reference <- "1.12.3"
    version <- strsplit(system2(Sys.which("pandoc"), "--version", stdout = TRUE), 
                        split = " ")[[1]][2]
    if (utils::compareVersion(version, reference) >= 0)
        is_pandoc_version_sufficient <- TRUE
}
if (is_pandoc_version_sufficient) 
    excerptr::excerptr(file_name = path, pandoc_formats = "html", 
                       output_path = tempdir())

## ---- comment = ""-------------------------------------------------------
if (is_pandoc_version_sufficient) 
    cat(readLines(file.path(tempdir(), sub("\\.R$", ".html", basename(path)))), 
        sep = "\n")

## ---- echo = FALSE, results = "hide"-------------------------------------
if (is_pandoc_version_sufficient) 
    excerptr::excerptr(file_name = path, pandoc_formats = "html", 
                       output_path = file.path(rprojroot::find_root(rprojroot::is_r_package), 
                                               "inst", "tests", "files")
                       )

## ---- eval = FALSE-------------------------------------------------------
#  browseURL(file.path(tempdir(), sub("\\.R$", ".html", basename(path))))
#  

