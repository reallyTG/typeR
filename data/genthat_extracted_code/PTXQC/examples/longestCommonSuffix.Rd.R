library(PTXQC)


### Name: longestCommonSuffix
### Title: Like longestCommonPrefix(), but on the suffix.
### Aliases: longestCommonSuffix

### ** Examples


 longestCommonSuffix(c("123.ABC", "45677.ABC", "BC"))  ## "BC"
 longestCommonSuffix(c("123.ABC", "", "BC"))           ## ""
 longestCommonSuffix(c("123.ABC", "45677.ABC"))        ## ".ABC"
 longestCommonSuffix(c("nothing", "in", "common"))     ## ""
 



