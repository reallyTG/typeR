library(exams)


### Name: nops_scan
### Title: Read Scanned NOPS Exams
### Aliases: nops_scan
### Keywords: utilities

### ** Examples

## scanned example images stored in exams package
img <- dir(system.file("nops", package = "exams"), pattern = "nops_scan",
  full.names = TRUE)

## read content
res <- nops_scan(img, file = FALSE)
writeLines(res)



