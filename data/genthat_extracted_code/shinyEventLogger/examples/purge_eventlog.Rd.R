library(shinyEventLogger)


### Name: purge_eventlog
### Title: Purging eventlog
### Aliases: purge_eventlog

### ** Examples

## No test: 

 demo_filelog <- system.file("shiny", "demoapp/events.log",
                             package = "shinyEventLogger")

 temp_file <- tempfile()
 file_conn <- base::file(temp_file)
 writeLines(readLines(con = demo_filelog), file_conn)
 close(file_conn)

 purge_eventlog(file = temp_file, min_build = 23)
## End(No test)



