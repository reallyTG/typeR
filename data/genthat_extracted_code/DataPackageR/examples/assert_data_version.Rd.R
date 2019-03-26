library(DataPackageR)


### Name: assert_data_version
### Title: Assert that a data version in a data package matches an
###   expectation.
### Aliases: assert_data_version

### ** Examples

if(rmarkdown::pandoc_available()){
f <- tempdir()
f <- file.path(f, "foo.Rmd")
con <- file(f)
writeLines("```{r}\n tbl = table(sample(1:10,1000,replace=TRUE)) \n```\n",con = con)
close(con)
pname <- basename(tempfile())
datapackage_skeleton(name = pname,
   path=tempdir(),
   force = TRUE,
   r_object_names = "tbl",
   code_files = f)
package_build(file.path(tempdir(),pname), install = FALSE)

devtools::load_all(file.path(tempdir(),pname))

assert_data_version(data_package_name = pname,version_string = "0.1.0",acceptable = "equal")
}



