library(PTXQC)


### Name: delLCS
### Title: Removes the longest common suffix (LCS) from a vector of
###   strings.
### Aliases: delLCS

### ** Examples

delLCS(c("TK12345_H1"))                     ## ""
delLCS(c("TK12345_H1", "TK12345_H2"))       ## "TK12345_H1" "TK12345_H2" 
delLCS(c("TK12345_H1", "TK12!45_H1"))       ## "TK123"    "TK12!" 
 



