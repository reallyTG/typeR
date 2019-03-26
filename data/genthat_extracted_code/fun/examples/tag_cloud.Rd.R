library(fun)


### Name: tag_cloud
### Title: Creating Tag Cloud in R (with Flash and JavaScript)
### Aliases: tag_cloud
### Keywords: dynamic file

### ** Examples

data(tagData)
htmlFile = paste(tempfile(), ".html", sep = "")
if (file.create(htmlFile)) {
    tag_cloud(tagData, htmlFile)
    if (!interactive()) 
        browseURL(htmlFile)
}



