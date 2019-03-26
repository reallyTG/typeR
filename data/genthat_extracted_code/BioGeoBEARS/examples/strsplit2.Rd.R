library(BioGeoBEARS)


### Name: strsplit2
### Title: String splitting shortcut
### Aliases: strsplit2

### ** Examples

test=1

# strsplit returns the results inside a list element
out = strsplit("ABC", split="")
out
# I.e....
out[[1]]

# If this is annoying/ugly in the code, use strsplit2:
out = strsplit2("ABC", split="")
out



