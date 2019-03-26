library(pbapply)


### Name: timerProgressBar
### Title: Timer Progress Bar
### Aliases: timerProgressBar setTimerProgressBar getTimerProgressBar
###   getTimeAsString
### Keywords: utilities

### ** Examples

## increase sluggishness to admire the progress bar longer
sluggishness <- 0.02

test_fun <- function(...)
{
    pb <- timerProgressBar(...)
    on.exit(close(pb))
    for (i in seq(0, 1, 0.05)) {
        Sys.sleep(sluggishness)
        setTimerProgressBar(pb, i)
    }
    invisible(NULL)
}

## check the different styles
test_fun(width = 35, char = "+", style = 1)
test_fun(style = 2)
test_fun(width = 50, char = ".", style = 3)
test_fun(style = 4)
test_fun(width = 35, char = "[=-]", style = 5)
test_fun(width = 50, char = "{*.}", style = 6)

## no bar only percent and elapsed
test_fun(width = 0, char = "    ", style = 6)

## this should produce a progress bar based on min_time
(elapsed <- system.time(test_fun(width = 35, min_time = 0))["elapsed"])
## this should not produce a progress bar based on min_time
system.time(test_fun(min_time = 2 * elapsed))["elapsed"]

## time formatting
getTimeAsString(NULL)
getTimeAsString(15)
getTimeAsString(65)
getTimeAsString(6005)

## example usage of getTimeAsString, use sluggishness <- 1
n <- 10
t0 <- proc.time()[3]
ETA <- NULL
for (i in seq_len(n)) {
    cat(i, "/", n, "- ETA:", getTimeAsString(ETA))
    flush.console()
    Sys.sleep(sluggishness)
    dt <- proc.time()[3] - t0
    cat(" - elapsed:", getTimeAsString(dt), "\n")
    ETA <- (n - i) * dt / i
}



