library(googlesheets)


### Name: gs_upload
### Title: Upload a file and convert it to a Google Sheet
### Aliases: gs_upload

### ** Examples

## Not run: 
##D write.csv(head(iris, 5), "iris.csv", row.names = FALSE)
##D iris_ss <- gs_upload("iris.csv")
##D iris_ss
##D gs_read(iris_ss)
##D file.remove("iris.csv")
##D gs_delete(iris_ss)
## End(Not run)




