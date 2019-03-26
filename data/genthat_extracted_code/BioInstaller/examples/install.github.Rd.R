library(BioInstaller)


### Name: install.github
### Title: Install or download softwares from Github
### Aliases: install.github

### ** Examples

db <- sprintf('%s/.BioInstaller', tempdir())
set.biosoftwares.db(db)
tryCatch(install.github('bwa', show.all.versions = TRUE),
error = function(e) {
  message('Connecting Github failed. Please try it again later.')
})
unlink(db)



