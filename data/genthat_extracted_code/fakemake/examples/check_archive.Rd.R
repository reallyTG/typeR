library(fakemake)


### Name: check_archive
### Title: Check a Package Archive
### Aliases: check_archive

### ** Examples

## Not run: 
##D package_path <- file.path(tempdir(), "fakepack")
##D usethis::create_package(path = package_path)
##D file.copy(system.file("templates", "throw.R", package = "fakemake"),
##D           file.path(package_path, "R"))
##D roxygen2::roxygenize(package_path)
##D print(tarball <- get_pkg_archive_path(package_path))
##D devtools::build(pkg = package_path, path = package_path)
##D print(check_archive(tarball))
## End(Not run)



