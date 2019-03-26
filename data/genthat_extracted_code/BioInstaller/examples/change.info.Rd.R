library(BioInstaller)


### Name: change.info
### Title: Update biologly softwares infomation of system
### Aliases: change.info

### ** Examples

db <- sprintf('%s/.BioInstaller', tempdir())
set.biosoftwares.db(db)
change.info(name = 'demo', installed = 'yes', source.dir = '',
bin.dir = '', excutable.files = c('demo'), others.customer = 'demo')
unlink(db)



