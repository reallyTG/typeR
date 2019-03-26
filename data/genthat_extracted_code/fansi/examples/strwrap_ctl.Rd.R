library(fansi)


### Name: strwrap_ctl
### Title: ANSI Control Sequence Aware Version of strwrap
### Aliases: strwrap_ctl strwrap2_ctl strwrap_sgr strwrap2_sgr

### ** Examples

hello.1 <- "hello \033[41mred\033[49m world"
hello.2 <- "hello\t\033[41mred\033[49m\tworld"

strwrap_ctl(hello.1, 12)
strwrap_ctl(hello.2, 12)

## In default mode strwrap2_ctl is the same as strwrap_ctl
strwrap2_ctl(hello.2, 12)

## But you can leave whitespace unchanged, `warn`
## set to false as otherwise tabs causes warning
strwrap2_ctl(hello.2, 12, strip.spaces=FALSE, warn=FALSE)

## And convert tabs to spaces
strwrap2_ctl(hello.2, 12, tabs.as.spaces=TRUE)

## If your display has 8 wide tab stops the following two
## outputs should look the same
writeLines(strwrap2_ctl(hello.2, 80, tabs.as.spaces=TRUE))
writeLines(hello.2)

## tab stops are NOT auto-detected, but you may provide
## your own
strwrap2_ctl(hello.2, 12, tabs.as.spaces=TRUE, tab.stops=c(6, 12))

## You can also force padding at the end to equal width
writeLines(strwrap2_ctl("hello how are you today", 10, pad.end="."))

## And a more involved example where we read the
## NEWS file, color it line by line, wrap it to
## 25 width and display some of it in 3 columns
## (works best on displays that support 256 color
## SGR sequences)

NEWS <- readLines(file.path(R.home('doc'), 'NEWS'))
NEWS.C <- fansi_lines(NEWS, step=2)  # color each line
W <- strwrap2_ctl(NEWS.C, 25, pad.end=" ", wrap.always=TRUE)
writeLines(c("", paste(W[1:20], W[100:120], W[200:220]), ""))



