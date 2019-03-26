library(warbleR)


### Name: is_selection_table
### Title: Class 'selection_table': double-checked frequency/time
###   coordinates of selections
### Aliases: is_selection_table

### ** Examples

{
# First set temporary folder
data(list = c("Phae.long1", "Phae.long2", "Phae.long3", "Phae.long4", "selec.table"))

is_selection_table(selec.table)

# setwd(tempdir())

writeWave(Phae.long1,"Phae.long1.wav")
writeWave(Phae.long2,"Phae.long2.wav")
writeWave(Phae.long3,"Phae.long3.wav")
writeWave(Phae.long4,"Phae.long4.wav")

st <- selection_table(selec.table)

is_selection_table(st)

class(st)
}



