library(Rclean)


### Name: write.code
### Title: write.code - Write code to disk. OUTPUT = Writes out code from
###   an object to a specified file.
### Aliases: write.code

### ** Examples

 data(prov_json)
 options(prov.json = prov_json)
 some.code <- c("x <- 1", "y <- x + 1")
 write.code(some.code) # copies to clipboard by default



