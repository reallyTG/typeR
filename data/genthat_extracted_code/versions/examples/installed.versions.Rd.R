library(versions)


### Name: installed.versions
### Title: installed.versions
### Aliases: installed.versions

### ** Examples


# the versions of versions
installed.versions('versions')

# apply to multiple packages
installed.versions(c('stats', 'versions'))

# add a package that doesn't exist or isn't installed
# (returns NA for that one)
installed.versions(c('stats', 'versions', 'notapackage'))




