library(BioInstaller)


### Name: get.info
### Title: Show biologly softwares infomation of system
### Aliases: get.info

### ** Examples

db <- sprintf('%s/.BioInstaller', tempdir())
set.biosoftwares.db(db)
change.info(name = 'bwa', installed = 'yes', source.dir = '',
bin.dir = '', excutable.files = c('demo'), others.customer = 'demo')
get.info('bwa')
unlink(db)



