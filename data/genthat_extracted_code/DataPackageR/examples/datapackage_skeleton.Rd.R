library(DataPackageR)


### Name: datapackage_skeleton
### Title: Create a Data Package skeleton for use with DataPackageR.
### Aliases: datapackage_skeleton datapackage.skeleton

### ** Examples

if(rmarkdown::pandoc_available()){
f <- tempdir()
f <- file.path(f,"foo.Rmd")
con <- file(f)
writeLines("```{r}\n tbl = table(sample(1:10,1000,replace=TRUE)) \n```\n",con=con)
close(con)
pname <- basename(tempfile())
datapackage_skeleton(name = pname,
   path = tempdir(),
   force = TRUE,
   r_object_names = "tbl",
   code_files = f)
   }



