library(futile.options)


### Name: OptionsManager
### Title: Futile options management
### Aliases: OptionsManager resetOptions resetOptions.default
###   resetOptions.character updateOptions updateOptions.default
###   updateOptions.character options.manager reset.options
### Keywords: array

### ** Examples

  my.options <- OptionsManager('my.options', default=list(a=2,b=3))
  my.options(c=4,d='hello')
  my.options('b')
  my.options('c')

  resetOptions(my.options)
  my.options('c')

  updateOptions(my.options, paste('key',1,sep='.'), 10)
  my.options('key.1')



