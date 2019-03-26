library(SQRL)


### Name: sqrlSource
### Title: Define New Data Sources
### Aliases: sqrlSource
### Keywords: database

### ** Examples

# Define a new source from a DSN.
sqrlSource("daedalus", dsn = "Knossos")

# Define another source as a copy of the former.
sqrlSource(icarus = "daedalus")

# Redefine an existing source by a connection string.
# (This example is for a Windows-system client.)
sqrlSource("icarus",
            driver = "PostgreSQL ANSI(x64)",
            server = "localhost",
            port = 5432,
            uid = "asterion",
            pwd = "moo")

# Define a new source by a connection string.
# (This example is for a GNU/Linux-system client,
#  and employs the <pwd> password placeholder.)
sqrlSource("knossos",
            "dbcname=Knossos;uid=theseus;pwd=<pwd>",
            "driver=/opt/teradata/client/16.10/lib64/tdata.so")

## Not run: 
##D # Define a new source from a configuration file.
##D sqrlSource(minos = "path/to/minos.config")
##D 
##D # Define a new source, ariadne, as a copy of the existing
##D # source, minos, then apply the configuration file conf.txt
##D # over that, and then set both the connection string and
##D # interface function name (parameter values) over those.
##D sqrlSource("ariadne",
##D             copy = "minos",
##D             config = "conf.txt",
##D             connection = "DSN=Knossos",
##D             interface = "a")
##D             
##D # Source names may conflict with those of preexisting
##D # R objects, provided that the config file defines a 
##D # conflict-free name for the source's interface function.
##D sqrlSource("c", "path/to/", "c.config")
## End(Not run)

# Review defined sources.
sqrlSources()

# Remove two of the sources.
sqrlSource("remove", c("daedalus", "knossos"))

# Remove another.
sqrlSource(icarus = NULL)



