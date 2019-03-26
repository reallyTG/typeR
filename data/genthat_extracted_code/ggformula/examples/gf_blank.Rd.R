library(ggformula)


### Name: gf_blank
### Title: Formula interface to geom_blank()
### Aliases: gf_blank gf_frame

### ** Examples


gf_point((c(0,1)) ~ (c(0,5)))
gf_frame((c(0,1)) ~ (c(0,5)))
gf_blank((c(0,1)) ~ (c(0,5)))
# gf_blank() can be used to expand the view
gf_point((c(0,1)) ~ (c(0,5))) %>%
  gf_blank((c(0,3)) ~ (c(-2,7)))



