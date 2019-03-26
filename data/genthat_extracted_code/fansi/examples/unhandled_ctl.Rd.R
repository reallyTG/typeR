library(fansi)


### Name: unhandled_ctl
### Title: Identify Unhandled ANSI Control Sequences
### Aliases: unhandled_ctl

### ** Examples

string <- c(
  "\033[41mhello world\033[m", "foo\033[22>m", "\033[999mbar",
  "baz \033[31#3m", "a\033[31k", "hello\033m world"
)
unhandled_ctl(string)



