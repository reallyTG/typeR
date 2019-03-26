library(xfun)


### Name: embed_file
### Title: Embed a file, multiple files, or directory on an HTML page
### Aliases: embed_file embed_dir embed_files

### ** Examples

logo = file.path(R.home("doc"), "html", "logo.jpg")
link = xfun::embed_file(logo, "R-logo.jpg", "Download R logo")
link
htmltools::browsable(link)



