library(fansi)


### Name: fansi_lines
### Title: Colorize Character Vectors
### Aliases: fansi_lines

### ** Examples

NEWS <- readLines(file.path(R.home('doc'), 'NEWS'))
writeLines(fansi_lines(NEWS[1:20]))
writeLines(fansi_lines(NEWS[1:20], step=8))



