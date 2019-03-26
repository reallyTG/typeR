library(RSuite)


### Name: rc_adapter_remove_admins
### Title: Remove all RC related administrative entries from folder tree at
###   dir.
### Aliases: rc_adapter_remove_admins

### ** Examples

# create you own RC adapter
rc_adapter_create_own <- function() {
  result <- rc_adapter_create_base("Own")
  class(result) <- c("rc_adapter_own", class(result))
  return(result)
}

#' @export
rc_adapter_remove_admins.rc_adapter_own <- function(rc_adapter, dir) {
  # ... unlink RC administrative folders from dir (like .svn or .git) ...
}




