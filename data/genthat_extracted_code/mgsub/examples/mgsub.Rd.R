library(mgsub)


### Name: mgsub
### Title: Safe, multiple gsub
### Aliases: mgsub

### ** Examples

mgsub("hey, ho",pattern=c("hey","ho"),replacement=c("ho","hey"))
mgsub("developer",pattern=c("e","p"),replacement=c("p","e"))
mgsub("The chemical Dopaziamine is fake",
      pattern=c("dopa(.*?) ","fake"),
      replacement=c("mega\\1 ","real"),
      ignore.case=TRUE)



