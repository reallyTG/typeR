library(RSuite)


### Name: rsuite_register_ci_adapter
### Title: Registers CI (continuous integration) adapter to use for
###   projects.
### Aliases: rsuite_register_ci_adapter

### ** Examples

ci_adapter <- ci_adapter_create_base("Own") # create your custom adapter
class(ci_adapter) <- c("ci_adapter_own", class(ci_adapter))

# register it
rsuite_register_ci_adapter(ci_adapter)

# unregister it
rsuite_unregister_ci_adapter("Own")




