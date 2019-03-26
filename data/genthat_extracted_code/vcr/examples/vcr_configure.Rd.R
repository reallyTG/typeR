library(vcr)


### Name: vcr_configure
### Title: Configuration
### Aliases: vcr_configure vcr_configure_reset vcr_configuration
###   vcr_config_defaults

### ** Examples

vcr_configure(dir = tempdir())
vcr_configure(dir = tempdir(), record = "all")
vcr_configuration()
vcr_config_defaults()
vcr_configure(tempdir(), ignore_localhost = TRUE)

# logging
vcr_configure(tempdir(), log = TRUE, 
  log_opts = list(file = file.path(tempdir(), "vcr.log")))
vcr_configure(tempdir(), log = TRUE, log_opts = list(file = "console"))
vcr_configure(tempdir(), log = TRUE,
 log_opts = list(
   file = file.path(tempdir(), "vcr.log"), 
   log_prefix = "foobar"
))
vcr_configure(tempdir(), log = FALSE)

# filter sensitive data
vcr_configure(tempdir(), 
  filter_sensitive_data = list(foo = "<bar>")
)
vcr_configure(tempdir(), 
  filter_sensitive_data = list(foo = "<bar>", hello = "<world>")
)



