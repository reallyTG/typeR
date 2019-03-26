library(Rraven)


### Name: relabel_colms
### Title: Relabel columns to match the selection table format
### Aliases: relabel_colms

### ** Examples


# Load data
data(selection_files)

#save 'Raven' selection tables in the temporary directory 
writeLines(selection_files[[5]], con = names(selection_files)[5])

## No test: 
 
#'# import data to R
rvn.dat <- imp_raven(all.data = TRUE) 

names(rvn.dat)

# Select data for a single sound file
rvn.dat2 <-  relabel_colms(rvn.dat)

names(rvn.dat2)

# plus 1 additional column
rvn.dat2 <-  relabel_colms(rvn.dat, extra.cols.name = "selec.file", "Raven selection file")

names(rvn.dat2)

# plus 2 additional column 
rvn.dat2 <- relabel_colms(rvn.dat, extra.cols.name = c("selec.file", "View"), 
c("Raven selection file", "Raven view"))
 
names(rvn.dat2)
## End(No test)




