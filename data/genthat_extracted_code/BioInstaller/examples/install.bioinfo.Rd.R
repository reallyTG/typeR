library(BioInstaller)


### Name: install.bioinfo
### Title: Download and install biology software or database
### Aliases: install.bioinfo

### ** Examples

db <- sprintf('%s/.BioInstaller', tempdir())
set.biosoftwares.db(db)
tryCatch(install.bioinfo('bwa', show.all.versions = TRUE), 
error = function(e) {
  message('Connecting Github failed. Please try it again later.')
})
unlink(db)



