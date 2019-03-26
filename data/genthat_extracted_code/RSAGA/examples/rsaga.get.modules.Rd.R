library(RSAGA)


### Name: rsaga.get.modules
### Title: Find SAGA libraries and modules
### Aliases: rsaga.get.modules rsaga.get.libraries rsaga.get.lib.modules
###   rsaga.module.exists rsaga.search.modules
### Keywords: interface spatial

### ** Examples

## Not run: 
##D # make sure that 'rsaga.env' can find 'saga_cmd.exe'
##D # before running this:
##D rsaga.get.libraries()
##D # list all modules in my favorite libraries:
##D rsaga.get.modules(c("io_grid", "grid_tools", "ta_preprocessor",
##D     "ta_morphometry", "ta_lighting", "ta_hydrology"))
##D # list *all* modules (quite a few!):
##D # rsaga.get.modules(interactive=TRUE)
##D 
##D # find modules that remove sink from DEMs:
##D rsaga.search.modules("sink")
##D # find modules that close gaps (no-data areas) in grids:
##D rsaga.search.modules("gap")
## End(Not run)



