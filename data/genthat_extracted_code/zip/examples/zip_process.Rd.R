library(zip)


### Name: zip_process
### Title: Class for an external zip process
### Aliases: zip_process

### ** Examples

dir.create(tmp <- tempfile())
write.table(iris, file = file.path(tmp, "iris.ssv"))
zipfile <- tempfile(fileext = ".zip")
zp <- zip_process()$new(zipfile, tmp)
zp$wait()
zp$get_exit_status()
zip_list(zipfile)



