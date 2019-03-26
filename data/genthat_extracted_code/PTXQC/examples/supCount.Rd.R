library(PTXQC)


### Name: supCount
### Title: Compute shortest prefix length which makes all strings in a
###   vector uniquely identifyable.
### Aliases: supCount

### ** Examples

  supCount(c("abcde...", "abcd...", "abc..."))  ## 5

  x = c("doubled", "doubled", "aLongDummyString")
  all( substr(x, 1, supCount(x)) == x )   
  ## TRUE (no unique prefix due to duplicated entries)




