library(rappdirs)


### Name: app_dir
### Title: Convenience wrapper for getting app dirs.
### Aliases: app_dir

### ** Examples

ggplot2_app <- app_dir("ggplot2", "hadley")
ggplot2_app$cache()
ggplot2_app$log()
ggplot2_app$data()
ggplot2_app$config()
ggplot2_app$site_config()
ggplot2_app$site_data()



