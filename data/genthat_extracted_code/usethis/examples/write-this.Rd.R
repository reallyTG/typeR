library(usethis)


### Name: write-this
### Title: Write into or over a file
### Aliases: write-this write_union write_over
### Keywords: internal

### ** Examples

## Don't show: 
.old_wd <- setwd(tempdir())
## End(Don't show)
write_union("a_file", letters[1:3])
readLines("a_file")
write_union("a_file", letters[1:5])
readLines("a_file")

write_over("another_file", letters[1:3])
readLines("another_file")
write_over("another_file", letters[1:3])

## Not run: 
##D ## will error if user isn't present to approve the overwrite
##D write_over("another_file", letters[3:1])
## End(Not run)

## clean up
file.remove("a_file", "another_file")
## Don't show: 
setwd(.old_wd)
## End(Don't show)



