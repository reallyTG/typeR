library(IsoriX)


### Name: options
### Title: Setting and displaying the options of the package
### Aliases: options options_IsoriX getOption_IsoriX

### ** Examples

OldOptions <- options_IsoriX()
OldOptions
getOption_IsoriX("example_maxtime")
options_IsoriX(example_maxtime = 30)
options_IsoriX()
options_IsoriX(example_maxtime = OldOptions$example_maxtime)
options_IsoriX()



