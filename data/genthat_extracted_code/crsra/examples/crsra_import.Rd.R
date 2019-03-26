library(crsra)


### Name: crsra_import
### Title: Imports all the .csv files into one list consisting of all the
###   courses and all the tables within each course.
### Aliases: crsra_import

### ** Examples

zip_file = system.file("extdata", "fake_course_7051862327916.zip",
package = "crsra")
bn = basename(zip_file)
bn = sub("[.]zip$", "", bn)
res = unzip(zip_file, exdir = tempdir(), overwrite = TRUE)
example_import = crsra_import(workdir = tempdir(),
check_problems = FALSE)




