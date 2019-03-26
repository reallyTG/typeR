library(futile.options)


### Name: futile.options-package
### Title: A scoped options management framework
### Aliases: futile.options-package futile.options
### Keywords: package attribute logic

### ** Examples

  my.options <- OptionsManager('my.options', defaults=list(a=1,b=2))
  my.options(a=5, c=3)
  my.options('a')



