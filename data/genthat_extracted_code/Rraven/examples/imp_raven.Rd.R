library(Rraven)


### Name: imp_raven
### Title: Import 'Raven' selections
### Aliases: imp_raven

### ** Examples


#load data 
data(selection_files)

# set temporary directory
# setwd(tempdir())

#save 'Raven' selection tables in the temporary directory 
out <- lapply(1:2, function(x) 
writeLines(selection_files[[x]], con = names(selection_files)[x]))

## No test: 
#providing the name of the column with the sound file names
rvn.dat <- imp_raven(sound.file.col = "Begin.File", all.data = FALSE)

# View(rvn.dat)
## End(No test)




