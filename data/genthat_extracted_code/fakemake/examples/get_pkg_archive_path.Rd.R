library(fakemake)


### Name: get_pkg_archive_path
### Title: Get a Package's Archive Path From the Package's DESCRIPTION
### Aliases: get_pkg_archive_path

### ** Examples

package_path <- file.path(tempdir(), "anRpackage")
usethis::create_package(path = package_path)
print(tarball <- get_pkg_archive_path(package_path))
file.exists(tarball)



