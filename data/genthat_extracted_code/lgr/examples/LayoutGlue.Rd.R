library(lgr)


### Name: LayoutGlue
### Title: Format Log Events as Text via glue
### Aliases: LayoutGlue

### ** Examples

lg <- Logger$new("testlogger", appenders = AppenderConsole$new(), propagate = FALSE)
lg$appenders[[1]]$set_layout(LayoutGlue$new())
lg$fatal("test")


# All fields of the LogEvent are available, even custom ones
lg$appenders[[1]]$layout$set_fmt(
  "{logger$name} {level_name}({level}) {caller}: {toupper(msg)} {{custom: {custom}}}"
)
lg$fatal("test", custom = "foobar")





