library(warbleR)


### Name: fix_extended_selection_table
### Title: Fix extended selection tables
### Aliases: fix_extended_selection_table

### ** Examples

{
# First set temporary folder
data(list = c("Phae.long1", "Phae.long2", "Phae.long3", "Phae.long4", "selec.table"))

# setwd(tempdir())

writeWave(Phae.long1,"Phae.long1.wav")
writeWave(Phae.long2,"Phae.long2.wav")
writeWave(Phae.long3,"Phae.long3.wav")
writeWave(Phae.long4,"Phae.long4.wav")

# create extended selection table
ext_st <- selection_table(selec.table, extended = TRUE, confirm.extended = FALSE)

# remove attributes
st <- as.data.frame(ext_st)

# check class
class(st)

# fix selection table
st <- fix_extended_selection_table(X = st, Y = ext_st)

# check class
class(st)
}



