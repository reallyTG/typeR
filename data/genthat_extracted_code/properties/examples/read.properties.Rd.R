library(properties)


### Name: read.properties
### Title: Read a Java Properties File for Use in RSB Applications
### Aliases: read.properties

### ** Examples

tf <- system.file("testFiles", "test0.properties", package = "properties")
read.properties(tf, fields = c("key2", "key3"))



