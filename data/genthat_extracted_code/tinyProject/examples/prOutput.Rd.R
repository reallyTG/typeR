library(tinyProject)


### Name: prBmp
### Title: Save plots as image files
### Aliases: prBmp prJpeg prPng prTiff prPdf prSvg prCairoPdf prCairoPs

### ** Examples

projectPath <- file.path(tempdir(), "test")
prInit(projectPath)

prPng("test")
plot(rnorm(100))
dev.off()
# The plot is saved in "output/test.png"
list.files(projectPath, recursive = TRUE, include.dirs = TRUE)

prPng("mysubdirectory/test")
plot(rnorm(100))
dev.off()
# The plot is saved in "output/mysubdirectory/test.png"
list.files(projectPath, recursive = TRUE, include.dirs = TRUE)




