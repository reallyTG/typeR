library(Hmisc)


### Name: Save
### Title: Faciliate Use of save and load to Remote Directories
### Aliases: Save Load
### Keywords: data file utilities

### ** Examples

## Not run: 
##D d <- data.frame(x=1:3, y=11:13)
##D options(LoadPath='../data/rda')
##D Save(d)   # creates ../data/rda/d.rda
##D Load(d)   # reads   ../data/rda/d.rda
##D Save(d, 'D')   # creates object D and saves it in .../D.rda
## End(Not run)



