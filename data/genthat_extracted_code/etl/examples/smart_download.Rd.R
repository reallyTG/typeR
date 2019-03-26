library(etl)


### Name: smart_download
### Title: Download only those files that don't already exist
### Aliases: smart_download

### ** Examples

cars <- etl("mtcars")
urls <- c("https://raw.githubusercontent.com/beanumber/etl/master/etl.Rproj",
"https://www.reddit.com/robots.txt")
smart_download(cars, src = urls)
# won't download again if the files are already there
smart_download(cars, src = urls)
# use clobber to overwrite
smart_download(cars, src = urls, clobber = TRUE)



