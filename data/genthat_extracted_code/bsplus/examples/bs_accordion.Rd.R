library(bsplus)


### Name: bs_accordion
### Title: Accordion panel-group
### Aliases: bs_accordion bs_append.bsplus_accordion
###   bs_set_opts.bsplus_accordion

### ** Examples

bs_accordion(id = "meet_the_beatles") %>%
  bs_set_opts(panel_type = "success", use_heading_link = TRUE) %>%
  bs_append(title = "John Lennon", content = "Rhythm guitar, vocals") %>%
  bs_set_opts(panel_type = "info") %>%
  bs_append(title = "Paul McCartney", content = "Bass guitar, vocals")




