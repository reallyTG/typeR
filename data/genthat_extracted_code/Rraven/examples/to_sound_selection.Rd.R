library(Rraven)


### Name: to_sound_selection
### Title: Convert Raven's selection files into sound selection files
### Aliases: to_sound_selection

### ** Examples

{

#load data 
data(selection_files)

# set temporary directory
# setwd(tempdir())

# save 'Raven' selection tables in the temporary directory
out <- lapply(1:2, function(x)
writeLines(selection_files[[x]], con = names(selection_files)[x]))

# try drag and drop selection files into Raven (shouldn't work)

# now convert files
to_sound_selection(sound.file.path = getwd(), 
sound.file.col = "Begin Path")

# try drag and drop into Raven again (should work now)
}




