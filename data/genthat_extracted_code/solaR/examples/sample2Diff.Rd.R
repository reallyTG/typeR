library(solaR)


### Name: C_sample2Diff
### Title: Small utilities for difftime objects.
### Aliases: diff2Hours char2diff sample2Hours P2E
### Keywords: utilities

### ** Examples

char2diff('min')
char2diff('2 s')

sample2Hours('s')
sample2Hours('30 m')

by1<-char2diff('10 min')
sample2Hours(by1)



