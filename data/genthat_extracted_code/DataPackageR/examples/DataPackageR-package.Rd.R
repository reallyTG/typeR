library(DataPackageR)


### Name: DataPackageR-package
### Title: DataPackageR
### Aliases: DataPackageR-package

### ** Examples

# A simple Rmd file that creates one data object
# named "tbl".
if(rmarkdown::pandoc_available()){
f <- tempdir()
f <- file.path(f,"foo.Rmd")
con <- file(f)
writeLines("```{r}\n tbl = table(sample(1:10,1000,replace=TRUE)) \n```\n",con=con)
close(con)

# construct a data package skeleton named "MyDataPackage" and pass
# in the Rmd file name with full path, and the name of the object(s) it
# creates.

pname <- basename(tempfile())
datapackage_skeleton(name=pname,
   path=tempdir(),
   force = TRUE,
   r_object_names = "tbl",
   code_files = f)

# call build_package to run the "foo.Rmd" processing and
# build a data package.
package_build(file.path(tempdir(), pname), install = FALSE)

# "install" the data package
devtools::load_all(file.path(tempdir(), pname))

# read the data version
data_version(pname)

# list the data sets in the package.
data(package = pname)

# The data objects are in the package source under "/data"
list.files(pattern="rda", path = file.path(tempdir(),pname,"data"), full = TRUE)

# The documentation that needs to be edited is in "/R"
list.files(pattern="R", path = file.path(tempdir(), pname,"R"), full = TRUE)
readLines(list.files(pattern="R", path = file.path(tempdir(),pname,"R"), full = TRUE))
# view the documentation with
?tbl
}



