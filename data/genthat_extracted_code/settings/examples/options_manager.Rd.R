library(settings)


### Name: options_manager
### Title: Create a new options manager.
### Aliases: options_manager

### ** Examples

# create an options register
my_options <- options_manager(foo=1,bar=2,baz='bob')

### Retrieving options
my_options() # retrieve the full options list.
my_options('baz')
my_options('foo')

# When multiple options are retrieved, the result is a list
my_options('foo','baz')

### Setting global options
my_options(foo=3,baz='pete')
my_options()
### Reset options to default.
reset(my_options)
my_options()

### Limit the possible values for an option.
my_options <- options_manager( fu="bar",.allowed = list(fu=inlist("foo","bar")) )



