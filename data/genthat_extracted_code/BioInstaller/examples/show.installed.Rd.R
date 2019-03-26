library(BioInstaller)


### Name: show.installed
### Title: Show all installed bio-softwares in system
### Aliases: show.installed

### ** Examples

db <- sprintf('%s/.BioInstaller', tempdir())
set.biosoftwares.db(db)
change.info(name = 'bwa', installed = 'yes', source.dir = '',
bin.dir = '', excutable.files = c('demo'), others.customer = 'demo')
show.installed()
unlink(db)



