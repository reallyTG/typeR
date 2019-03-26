library(Rraven)


### Name: fix_path
### Title: Modify sound file path in Raven's selection tables
### Aliases: fix_path

### ** Examples

{

# load warbleR for sound file examples
library(warbleR)

#load data 
data(list = c("Phae.long1", "Phae.long2", "Phae.long3", "Phae.long4", "selection_files"))

# set temporary directory
# setwd(tempdir())

# save sound files
writeWave(Phae.long1,"Phae.long1.wav")
writeWave(Phae.long2,"Phae.long2.wav")
writeWave(Phae.long3,"Phae.long3.wav")
writeWave(Phae.long4,"Phae.long4.wav")   
# save 'Raven' selection tables in the temporary directory
out <- lapply(1:2, function(x)
writeLines(selection_files[[x]], con = names(selection_files)[x]))

# try drag and drop selection files into Raven (shouldn't work)

# now fix files
fix_path(path = getwd(), 
sound.file.col = "Begin File", new.begin.path = "YOUR NEW LOCATION HERE")

# try drag and drop into Raven again (should work now)
}




