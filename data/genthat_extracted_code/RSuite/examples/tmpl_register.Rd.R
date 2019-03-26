library(RSuite)


### Name: tmpl_register
### Title: Registers the template specified with the path argument.
### Aliases: tmpl_register

### ** Examples

## No test: 
  # setup
  old_option_value <- getOption("rsuite.user_templ_path")
  tmpl_dir <- tempfile("user_templates_")
  dir.create(tmpl_dir, recursive = TRUE, showWarnings = FALSE)

  options(rsuite.user_templ_path = tmpl_dir)
  user_templ <- tempfile("usr_templ_")

  # initialize template from builtin
  tmpl_start(basename(user_templ), path = tempdir())
  # register it
  tmpl_register(user_templ)

  # clean up
  options(rsuite.user_templ_path = old_option_value)
  unlink(tmpl_dir, recursive = TRUE, force = TRUE)
  unlink(user_templ, recursive = TRUE, force = TRUE)
## End(No test)




