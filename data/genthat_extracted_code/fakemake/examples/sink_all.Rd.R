library(fakemake)


### Name: sink_all
### Title: Divert Message And Output Stream to File
### Aliases: sink_all

### ** Examples

sink_path  <- file.path(tempdir(), "sink_all.txt")
sink_all(sink_path, {
         print("some output")
         warning("a warning")
         message("a message")
         print("some more output")
})
cat(readLines(sink_path), sep = "\n")



