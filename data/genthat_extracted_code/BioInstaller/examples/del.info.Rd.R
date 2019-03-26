library(BioInstaller)


### Name: del.info
### Title: Delete biologly softwares infomation of system
### Aliases: del.info

### ** Examples

db <- sprintf('%s/.BioInstaller', tempdir())
set.biosoftwares.db(db)
change.info(name = 'bwa', installed = 'yes', source.dir = '',
bin.dir = '', excutable.files = c('demo'), others.customer = 'demo')
del.info('bwa')
unlink(db)



