library(crsra)


### Name: crsra_import_course
### Title: Imports all the .csv files into one list consisting of all the
###   tables within the course.
### Aliases: crsra_import_course

### ** Examples

zip_file = system.file("extdata", "fake_course_7051862327916.zip",
package = "crsra")
bn = basename(zip_file)
bn = sub("[.]zip$", "", bn)
res = unzip(zip_file, exdir = tempdir(), overwrite = TRUE)
workdir = file.path(tempdir(), bn)
course_tables = crsra_import_course(workdir,
check_problems = FALSE)



