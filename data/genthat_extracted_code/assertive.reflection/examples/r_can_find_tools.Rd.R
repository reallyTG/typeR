library(assertive.reflection)


### Name: assert_r_can_find_tools
### Title: Can R find tools?
### Aliases: assert_r_can_build_translations assert_r_can_compile_code
###   assert_r_can_find_java assert_r_can_find_tools
###   r_can_build_translations r_can_compile_code r_can_find_java
###   r_can_find_tools

### ** Examples

r_can_find_tools(c("latex", "pdflatex"))
r_can_compile_code()
r_can_build_translations()
r_can_find_java()
assertive.base::dont_stop({
  assert_r_can_find_tools(c("latex", "pdflatex"))
  assert_r_can_compile_code()
  assert_r_can_build_translations()
  assert_r_can_find_java("64bit")
})



