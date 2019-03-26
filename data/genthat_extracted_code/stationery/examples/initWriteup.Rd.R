library(stationery)


### Name: initWriteup
### Title: Create skeleton for a report or guide.
### Aliases: initWriteup

### ** Examples

tdir <- tempdir()
cat("Will Create All Doc Types in Temp Dir:\n ", tdir, "\n")

doctype <- c("rmd2html-guide", "rmd2pdf-report",
          "rnw2pdf-guide-knit", "rnw2pdf-guide-sweave",
          "rmd2pdf-guide", "rnw2pdf-report-knit",
          "rnw2pdf-report-sweave", "rnw2pdf-slides-sweave")
folders <- vapply(doctype, function(x){
               initWriteup(x, dir = file.path(tdir, "todaytest", x))},
           character(1))
folders
list.files(file.path(tdir, "todaytest"), recursive = TRUE)
## Compile one example in the rnw2pdf-report-sweave folder
list.files(file.path(tdir, "todaytest/rnw2pdf-report-sweave"))
## No test: 
## requires pdflatex on system
rnw2pdf("skeleton.Rnw", wd = file.path(tdir, "todaytest/rnw2pdf-report-sweave"),
         engine = "Sweave")
## Check the pdf was created
list.files(file.path(tdir, "todaytest/rnw2pdf-report-sweave"))
if(interactive()) browseURL(file.path(tdir, "todaytest/rnw2pdf-report-sweave", "skeleton.pdf"))
unlink(file.path(tdir, "todaytest"), recursive = TRUE)
## End(No test)



