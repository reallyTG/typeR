library(Hmisc)


### Name: mdb.get
### Title: Read Tables in a Microsoft Access Database
### Aliases: mdb.get
### Keywords: manip IO file

### ** Examples

## Not run: 
##D # Read all tables in the Microsoft Access database Nwind.mdb
##D d <- mdb.get('Nwind.mdb')
##D contents(d)
##D for(z in d) print(contents(z))
##D # Just print the names of tables in the database
##D mdb.get('Nwind.mdb', tables=TRUE)
##D # Import one table
##D Orders <- mdb.get('Nwind.mdb', tables='Orders')
## End(Not run)



