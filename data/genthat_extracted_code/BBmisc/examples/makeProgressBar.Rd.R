library(BBmisc)


### Name: makeProgressBar
### Title: Create a progress bar with estimated time.
### Aliases: makeProgressBar ProgressBar

### ** Examples

bar = makeProgressBar(max = 5, label = "test-bar")
for (i in 0:5) {
  bar$set(i)
  Sys.sleep(0.2)
}
bar = makeProgressBar(max = 5, label = "test-bar")
for (i in 1:5) {
  bar$inc(1)
  Sys.sleep(0.2)
}
# display errors properly (in next line)
## Not run: 
##D f = function(i) if (i>2) stop("foo")
##D bar = makeProgressBar(max = 5, label = "test-bar")
##D for (i in 1:5) {
##D   tryCatch ({
##D     f(i)
##D     bar$set(i)
##D   }, error = bar$error)
##D }
## End(Not run)



