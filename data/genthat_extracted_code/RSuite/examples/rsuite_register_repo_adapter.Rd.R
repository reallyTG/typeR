library(RSuite)


### Name: rsuite_register_repo_adapter
### Title: Registers repository adapter to use for projects.
### Aliases: rsuite_register_repo_adapter

### ** Examples

## No test: 
  repo_adapter <- repo_adapter_create_base("Own") # create your custom adapter
  class(repo_adapter) <- c("repo_adapter_own", class(repo_adapter))

  # register it
  rsuite_register_repo_adapter(repo_adapter)

  # unregister it
  rsuite_unregister_repo_adapter("Own")
## End(No test)




