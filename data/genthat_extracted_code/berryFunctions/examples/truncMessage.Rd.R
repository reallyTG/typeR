library(berryFunctions)


### Name: truncMessage
### Title: truncate message parts
### Aliases: truncMessage
### Keywords: character

### ** Examples

truncMessage("hi")
message("listing name", truncMessage(       "hi"      ), ".")
message("listing name", truncMessage(paste0("hi",1:10)), ".")
truncMessage(paste0("hi",1:10), ntrunc=1)
truncMessage(paste0("hi",1:10), ntrunc=2, prefix="", midfix="")
truncMessage(paste0("hi",1:10), ntrunc=8, prefix="files _ ")




