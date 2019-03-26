library(MakefileR)


### Name: c.MakefileR_group
### Title: Concatenation of rules
### Aliases: +.MakefileR_group c.MakefileR_group

### ** Examples

c(make_group(sep = ""),
  make_group(make_comment("Dummy targets"),
             make_rule(".FORCE"), make_rule(".SILENT")),
  make_group(make_comment("Definitions"),
             make_def("A", "a")))

makefile() + (make_group() + make_comment("Definitions") + make_def("A", "a"))



