library(dpmr)


### Name: datapackage_init
### Title: Initialise a data package from a data frame, metadata list, and
###   source code file used to create the data set.
### Aliases: datapackage_init

### ** Examples

## Not run: 
##D # Create fake data
##D A <- B <- C <- sample(1:20, size = 20, replace = TRUE)
##D ID <- sort(rep('a', 20))
##D Data <- data.frame(ID, A, B, C)
##D 
##D # Initialise data package with barebones, automatically generated metadata
##D datapackage_init(df = Data, package_name = 'my-data-package')
##D 
##D # Initialise with user specified metadata
##D meta_list <- list(name = 'my-data-package',
##D                  title = 'A fake data package',
##D                  last_updated = Sys.Date(),
##D                  version = '0.1',
##D                  license = data.frame(type = 'PDDL-1.0',
##D                           url = 'http://opendatacommons.org/licenses/pddl/'),
##D                  sources = data.frame(name = 'Fake',
##D                           web = 'No URL, its fake.'))
##D 
##D  datapackage_init(df = Data, meta = meta_list)
## End(Not run)




