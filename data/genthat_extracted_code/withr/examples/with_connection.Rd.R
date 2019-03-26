library(withr)


### Name: with_connection
### Title: Connections which close themselves
### Aliases: with_connection local_connection

### ** Examples

with_connection(list(con = file("foo", "w")), {
  writeLines(c("foo", "bar"), con)
})

read_foo <- function() {
  readLines(local_connection(file("foo", "r")))
}
read_foo()



