library(processx)


### Name: run
### Title: Run external command, and wait until finishes
### Aliases: run

### ** Examples

## Different examples for Unix and Windows
## Not run: 
##D if (.Platform$OS.type == "unix") {
##D   run("ls")
##D   system.time(run("sleep", "10", timeout = 1,
##D     error_on_status = FALSE))
##D   system.time(
##D     run(
##D       "sh", c("-c", "for i in 1 2 3 4 5; do echo $i; sleep 1; done"),
##D       timeout = 2, error_on_status = FALSE
##D     )
##D   )
##D } else {
##D   run("ping", c("-n", "1", "127.0.0.1"))
##D   run("ping", c("-n", "6", "127.0.0.1"), timeout = 1,
##D     error_on_status = FALSE)
##D }
## End(Not run)



