library(lazyWeave)


### Name: lazy.file.start
### Title: Initiate New LaTeX, HTML, or Markdown Files
### Aliases: lazy.file.start

### ** Examples


#* lazy.file.start does not currently work with markdown documents
#* First, we set the lazyReportFormat option to "latex"
orig_option <- getOption("lazyReportFormat")
options(lazyReportFormat="latex")
lazy.file.start(docClass="report", 
  packages=c("pslatex", "palatino", "avant"),
  title="Report Name", author="Your Name")
 
#* Return the original option setting
options(lazyReportFormat=orig_option)
  



