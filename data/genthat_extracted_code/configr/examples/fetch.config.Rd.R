library(configr)


### Name: fetch.config
### Title: Fetch configuration file and generate a merged list
### Aliases: fetch.config

### ** Examples

links <- c(paste0('https://raw.githubusercontent.com/JhuangLab', 
'/BioInstaller/master/inst/extdata/config/db/db_annovar.toml'), 
paste0('https://raw.githubusercontent.com/JhuangLab/BioInstaller', 
'/master/inst/extdata/config/db/db_main.toml'), 
system.file('extdata', 'config.toml', package = 'configr'))
x <- fetch.config(links)



