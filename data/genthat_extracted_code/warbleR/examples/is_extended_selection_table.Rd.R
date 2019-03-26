library(warbleR)


### Name: is_extended_selection_table
### Title: Class 'extended_selection_table': selection table containing
###   wave objects
### Aliases: is_extended_selection_table

### ** Examples

{
# First set temporary folder
data(list = c("Phae.long1", "Phae.long2", "Phae.long3", "Phae.long4", "selec.table"))

is_extended_selection_table(selec.table)

# setwd(tempdir())

writeWave(Phae.long1,"Phae.long1.wav")
writeWave(Phae.long2,"Phae.long2.wav")
writeWave(Phae.long3,"Phae.long3.wav")
writeWave(Phae.long4,"Phae.long4.wav")

st <- selection_table(selec.table, extended = TRUE, confirm.extended = FALSE)

is_extended_selection_table(st)

class(st)
}



