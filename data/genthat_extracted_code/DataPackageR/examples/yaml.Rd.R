library(DataPackageR)


### Name: yml_find
### Title: Edit DataPackageR yaml configuration
### Aliases: yml_find yml_add_files yml_disable_compile yml_enable_compile
###   yml_add_objects yml_list_objects yml_list_files yml_remove_objects
###   yml_remove_files yml_write

### ** Examples

if(rmarkdown::pandoc_available()){
f <- tempdir()
f <- file.path(f,"foo.Rmd")
con <- file(f)
writeLines("```{r}\n tbl = table(sample(1:10,1000,replace=TRUE)) \n```\n",con=con)
close(con)
pname <- basename(tempfile())
datapackage_skeleton(name=pname,
   path = tempdir(),
   force = TRUE,
   r_object_names = "tbl",
   code_files = f)
yml <- yml_find(file.path(tempdir(),pname))
cat(yaml::as.yaml(yml))
yml <- yml_add_files(yml,"foo.Rmd")
yml_list_files(yml)
yml <- yml_disable_compile(yml,"foo.Rmd")
cat(yaml::as.yaml(yml))
yml <- yml_enable_compile(yml,"foo.Rmd")
cat(yaml::as.yaml(yml))
yml <- yml_add_objects(yml,"data1")
yml_list_objects(yml)
yml <- yml_remove_objects(yml,"data1")
yml <- yml_remove_files(yml,"foo.Rmd")
}



