library(warbleR)


### Name: consolidate
### Title: Consolidate (sound) files into a single folder
### Aliases: consolidate

### ** Examples

{ 
# First set empty folder
# setwd(tempdir())

# save wav file examples
data(list = c("Phae.long1", "Phae.long2", "Phae.long3", "Phae.long4", "selec.table"))

# create first folder
dir.create("folder1")
writeWave(Phae.long1, file.path("folder1","Phae.long1.wav"))
writeWave(Phae.long2, file.path("folder1","Phae.long2.wav"))

# create second folder
dir.create("folder2")
writeWave(Phae.long3, file.path("folder2","Phae.long3.wav"))
writeWave(Phae.long4, file.path("folder2","Phae.long4.wav"))

# consolidate in a single folder
consolidate()

# or if tempdir wa used
# consolidate(path = tempdir())
}




