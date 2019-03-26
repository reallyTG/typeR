library(assertive.reflection)


### Name: assert_is_architect
### Title: Are you running R?
### Aliases: assert_is_architect assert_is_emacs assert_is_r
###   assert_is_r_alpha assert_is_r_beta assert_is_r_devel
###   assert_is_r_patched assert_is_r_release assert_is_r_release_candidate
###   assert_is_r_revised assert_is_r_stable assert_is_revo_r
###   assert_is_rstudio assert_is_rstudio_desktop assert_is_rstudio_server
###   assert_is_visual_studio is_architect is_emacs is_r is_r_alpha
###   is_r_beta is_r_devel is_r_patched is_r_release is_r_release_candidate
###   is_r_revised is_r_stable is_revo_r is_rstudio is_visual_studio

### ** Examples

# If this is FALSE, you really need to ditch that old copy of S-PLUS
is_r()
assertive.base::dont_stop(assert_is_r())
# Release, patched, devel, etc.
is_r_release()
is_r_patched()
is_r_devel()
is_r_alpha()
is_r_beta()
is_r_release_candidate()
is_r_revised()
switch(
  version$status,
  Patched                        = assert_is_r_patched(),
  "Under development (unstable)" = assert_is_r_devel(),
  alpha                          = assert_is_r_alpha(),
  beta                           = assert_is_r_beta(),
  RC                             = assert_is_r_release_candidate(),
  Revised                        = assert_is_r_revised(),
  assert_is_r_release()
)
# IDE
is_architect()
is_emacs()
is_visual_studio()
is_rstudio()
# Custom R distribution
is_revo_r()



