library(warbleR)


### Name: selection_table
### Title: Create 'selection_table' and 'extended_selection_table' objects
### Aliases: selection_table

### ** Examples

{
# First set temporary folder
 # setwd(tempdir())

data(list = c("Phae.long1", "Phae.long2", "Phae.long3", "Phae.long4", "selec.table"))
writeWave(Phae.long1,"Phae.long1.wav")
writeWave(Phae.long2,"Phae.long2.wav")
writeWave(Phae.long3,"Phae.long3.wav")
writeWave(Phae.long4,"Phae.long4.wav")

# make selection table
st <- selection_table(X = selec.table)

is_selection_table(st)

#' # make extended selection table
st <- selection_table(X = selec.table, extended = TRUE, confirm.extended = FALSE)

is_extended_selection_table(st)

### make extended selection by song  
# create a song variable
selec.table$song <- as.numeric(selec.table$sound.files)

st <- selection_table(X = selec.table, extended = TRUE, confirm.extended = FALSE, by.song = "song")
}




