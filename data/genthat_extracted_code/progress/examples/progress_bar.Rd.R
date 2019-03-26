library(progress)


### Name: progress_bar
### Title: Progress bar in the terminal
### Aliases: progress_bar

### ** Examples


## We don't run the examples on CRAN, because they takes >10s
## altogether. Unfortunately it is hard to create a set of
## meaningful progress bar examples that also run quickly.
## Not run: 
##D 
##D ## Basic
##D pb <- progress_bar$new(total = 100)
##D for (i in 1:100) {
##D   pb$tick()
##D   Sys.sleep(1 / 100)
##D }
##D 
##D ## ETA
##D pb <- progress_bar$new(
##D   format = "  downloading [:bar] :percent eta: :eta",
##D   total = 100, clear = FALSE, width= 60)
##D for (i in 1:100) {
##D   pb$tick()
##D   Sys.sleep(1 / 100)
##D }
##D 
##D ## Elapsed time
##D pb <- progress_bar$new(
##D   format = "  downloading [:bar] :percent in :elapsed",
##D   total = 100, clear = FALSE, width= 60)
##D for (i in 1:100) {
##D   pb$tick()
##D   Sys.sleep(1 / 100)
##D }
##D 
##D ## Spinner
##D pb <- progress_bar$new(
##D   format = "(:spin) [:bar] :percent",
##D   total = 30, clear = FALSE, width = 60)
##D for (i in 1:30) {
##D   pb$tick()
##D   Sys.sleep(3 / 100)
##D }
##D 
##D ## Custom tokens
##D pb <- progress_bar$new(
##D   format = "  downloading :what [:bar] :percent eta: :eta",
##D   clear = FALSE, total = 200, width = 60)
##D f <- function() {
##D   for (i in 1:100) {
##D     pb$tick(tokens = list(what = "foo   "))
##D     Sys.sleep(2 / 100)
##D   }
##D   for (i in 1:100) {
##D     pb$tick(tokens = list(what = "foobar"))
##D     Sys.sleep(2 / 100)
##D   }
##D }
##D f()
##D 
##D ## Download (or other) rates
##D pb <- progress_bar$new(
##D   format = "  downloading foobar at :rate, got :bytes in :elapsed",
##D   clear = FALSE, total = NA, width = 60)
##D f <- function() {
##D   for (i in 1:100) {
##D     pb$tick(sample(1:100 * 1000, 1))
##D     Sys.sleep(2/100)
##D   }
##D   pb$tick(1e7)
##D   invisible()
##D }
##D f()
##D 
##D pb <- progress_bar$new(
##D   format = "  got :current rows at :tick_rate/sec",
##D   clear = FALSE, total = NA, width = 60)
##D f <- function() {
##D   for (i in 1:100) {
##D     pb$tick(sample(1:100, 1))
##D     Sys.sleep(2/100)
##D   }
##D   pb$terminate()
##D   invisible()
##D }
##D f()
##D 
## End(Not run)




