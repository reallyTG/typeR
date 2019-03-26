library(BioInstaller)


### Name: install.nongithub
### Title: Install or download softwares from non-Github Web site
### Aliases: install.nongithub

### ** Examples

db <- sprintf('%s/.BioInstaller', tempdir())
set.biosoftwares.db(db)
tryCatch(install.nongithub('gmap', show.all.versions = TRUE),
error = function(e) {
  message('Connecting Gmap website failed. Please try it again later.')
})
unlink(db)



