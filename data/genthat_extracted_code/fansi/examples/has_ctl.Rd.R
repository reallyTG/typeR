library(fansi)


### Name: has_ctl
### Title: Checks for Presence of Control Sequences
### Aliases: has_ctl has_sgr

### ** Examples

has_ctl("hello world")
has_ctl("hello\nworld")
has_ctl("hello\nworld", "sgr")
has_ctl("hello\033[31mworld\033[m", "sgr")
has_sgr("hello\033[31mworld\033[m")
has_sgr("hello\nworld")



