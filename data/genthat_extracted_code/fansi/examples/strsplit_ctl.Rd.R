library(fansi)


### Name: strsplit_ctl
### Title: ANSI Control Sequence Aware Version of strsplit
### Aliases: strsplit_ctl strsplit_sgr

### ** Examples

strsplit_sgr("\033[31mhello\033[42m world!", " ")

## Next two examples allow splitting by newlines, which
## normally doesn't work as newlines are _Control Sequences_
strsplit_sgr("\033[31mhello\033[42m\nworld!", "\n")
strsplit_ctl("\033[31mhello\033[42m\nworld!", "\n", ctl=c("all", "nl"))



