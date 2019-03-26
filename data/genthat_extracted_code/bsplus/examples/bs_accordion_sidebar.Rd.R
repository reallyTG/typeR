library(bsplus)


### Name: bs_accordion_sidebar
### Title: Accordion-sidebar panel-group
### Aliases: bs_accordion_sidebar use_bs_accordion_sidebar
###   bs_append.bsplus_accordion_sidebar
###   bs_set_opts.bsplus_accordion_sidebar

### ** Examples

bs_accordion_sidebar(id = "meet_the_beatles") %>%
  bs_append(
    title_side = "John Lennon",
    content_side = "Rhythm guitar, vocals",
    content_main = "Dear Prudence"
  ) %>%
  bs_append(
    title_side = "Paul McCartney",
    content_side = "Bass guitar, vocals",
    content_main = "Blackbird"
  )
## Not run: 
##D use_bs_accordion_sidebar()
## End(Not run)



