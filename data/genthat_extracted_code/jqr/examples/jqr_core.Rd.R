library(jqr)


### Name: jqr_new
### Title: JQ Streaming API
### Aliases: jqr_new jqr_feed

### ** Examples

program <- jqr_new(".[]")
jqr_feed(program, c("[123, 456]", "[77, 88, 99]"))
jqr_feed(program, c("[41, 234]"))
jqr_feed(program, "", finalize = TRUE)



