library(fansi)


### Name: substr_ctl
### Title: ANSI Control Sequence Aware Version of substr
### Aliases: substr_ctl substr2_ctl substr_sgr substr2_sgr

### ** Examples

substr_ctl("\033[42mhello\033[m world", 1, 9)
substr_ctl("\033[42mhello\033[m world", 3, 9)

## Width 2 and 3 are in the middle of an ideogram as
## start and stop positions respectively, so we control
## what we get with `round`

cn.string <- paste0("\033[42m", "\u4E00\u4E01\u4E03", "\033[m")

substr2_ctl(cn.string, 2, 3, type='width')
substr2_ctl(cn.string, 2, 3, type='width', round='both')
substr2_ctl(cn.string, 2, 3, type='width', round='start')
substr2_ctl(cn.string, 2, 3, type='width', round='stop')

## the _sgr variety only treat as special CSI SGR,
## compare the following:

substr_sgr("\033[31mhello\tworld", 1, 6)
substr_ctl("\033[31mhello\tworld", 1, 6)
substr_ctl("\033[31mhello\tworld", 1, 6, ctl=c('all', 'c0'))



