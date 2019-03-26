library(pbapply)


### Name: pboptions
### Title: Creating Progress Bar and Setting Options
### Aliases: pboptions startpb setpb getpb closepb dopb pbtypes
### Keywords: IO utilities

### ** Examples

## increase sluggishness to admire the progress bar longer
sluggishness <- 0.01

## for loop
fun1 <- function() {
    pb <- startpb(0, 10)
    on.exit(closepb(pb))
    for (i in 1:10) {
        Sys.sleep(sluggishness)
        setpb(pb, i)
    }
    invisible(NULL)
}
## while loop
fun2 <- function() {
    pb <- startpb(0, 10-1)
    on.exit(closepb(pb))
    i <- 1
    while (i < 10) {
        Sys.sleep(sluggishness)
        setpb(pb, i)
        i <- i + 1
    }
    invisible(NULL)
}
## using original settings
fun1()
## resetting pboptions
opb <- pboptions(style = 1, char = ">")
## check new settings
getOption("pboptions")
## running again with new settings
fun2()
## resetting original
pboptions(opb)
## check reset
getOption("pboptions")
fun1()

## dealing with nested progress bars
## when only one the 1st one is needed
f <- function(x) Sys.sleep(sluggishness)
g <- function(x) pblapply(1:10, f)
tmp <- lapply(1:10, g) # undesirable
## here is the desirable solution
h <- function(x) {
    opb <- pboptions(type="none")
    on.exit(pboptions(opb))
    pblapply(1:10, f)
}
tmp <- pblapply(1:10, h)

## list available pb types
pbtypes()



