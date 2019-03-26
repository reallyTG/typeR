library(BioInstaller)


### Name: get.meta
### Title: Get meta information of BioInstaller collected sources, such as
###   database, GitHub source, non-GitHub source, web source
### Aliases: get.meta

### ** Examples

meta <- get.meta()
db_cfg_meta <- get.meta(config = 'db', value = 'cfg_meta')
db_meta_file <- get.meta(config = 'db_meta_file')
db_cfg_meta_parsed <- get.meta(value = 'cfg_meta', config = 'db', 
read.config.params = list(rcmd.parse = TRUE))



