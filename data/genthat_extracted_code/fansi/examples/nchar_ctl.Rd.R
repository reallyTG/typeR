library(fansi)


### Name: nchar_ctl
### Title: ANSI Control Sequence Aware Version of nchar
### Aliases: nchar_ctl nchar_sgr nzchar_ctl nzchar_sgr

### ** Examples

nchar_ctl("\033[31m123\a\r")
## with some wide characters
cn.string <-  sprintf("\033[31m%s\a\r", "\u4E00\u4E01\u4E03")
nchar_ctl(cn.string)
nchar_ctl(cn.string, type='width')

## Remember newlines are not counted by default
nchar_ctl("\t\n\r")

## The 'c0' value for the `ctl` argument does
## not include newlines.
nchar_ctl("\t\n\r", ctl="c0")
nchar_ctl("\t\n\r", ctl=c("c0", "nl"))

## The _sgr flavor only treats SGR sequences as zero width

nchar_sgr("\033[31m123")
nchar_sgr("\t\n\n123")

## All of the following are Control Sequences
nzchar_ctl("\n\033[42;31m\033[123P\a")



