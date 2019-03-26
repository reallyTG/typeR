library(fansi)


### Name: strip_ctl
### Title: Strip ANSI Control Sequences
### Aliases: strip_ctl strip_sgr

### ** Examples

string <- "hello\033k\033[45p world\n\033[31mgoodbye\a moon"
strip_ctl(string)
strip_ctl(string, c("nl", "c0", "sgr", "csi", "esc")) # equivalently
strip_ctl(string, "sgr")
strip_ctl(string, c("c0", "esc"))

## everything but C0 controls, we need to specify "nl"
## in addition to "c0" since "nl" is not part of "c0"
## as far as the `strip` argument is concerned
strip_ctl(string, c("all", "nl", "c0"))

## convenience function, same as `strip_ctl(ctl='sgr')`
strip_sgr(string)



