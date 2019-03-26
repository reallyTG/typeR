library(marmap)


### Name: subsetSQL
### Title: Creating and querying local SQL database for bathymetric data
### Aliases: subsetSQL setSQL

### ** Examples

# load NW Atlantic data
data(nw.atlantic)

# write data to disk as a comma-separated text file
write.table(nw.atlantic, "NW_Atlantic.csv", sep=",", quote=FALSE, row.names=FALSE)

## Not run: 
##D # prepare SQL database
##D setSQL(bathy="NW_Atlantic.csv")
##D 
##D # uses data from the newly-created SQL database:
##D subsetSQL(min_lon=-70,max_lon=-50,
##D              min_lat=35, max_lat=41) -> test
##D 
##D # visualize the results (of class bathy)
##D summary(test)
##D 
##D # remove temporary database and CSV files
##D system("rm bathy_db") # remove file, for unix-like systems
##D system("rm NW_Atlantic.csv") # remove file, for unix-like systems
## End(Not run)



