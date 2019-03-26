library(PkgsFromFiles)


### Name: pff_find_R_files_from_folder
### Title: Finds all R related files from a folder
### Aliases: pff_find_R_files_from_folder

### ** Examples

 my.dir <- dirname(system.file('extdata/Example_Script_1.R', package = 'PkgsFromFiles'))
 df.files <- pff_find_R_files_from_folder(my.dir)
 print(df.files)



