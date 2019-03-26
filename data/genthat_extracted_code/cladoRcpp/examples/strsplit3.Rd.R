library(cladoRcpp)


### Name: strsplit3
### Title: String splitting shortcut
### Aliases: strsplit3

### ** Examples


# strsplit returns the results inside a list element
out = strsplit("ABC", split="")
out
# I.e....
out[[1]]

# If this is annoying/ugly in the code, use strsplit3:
out = strsplit3("ABC", split="")
out




