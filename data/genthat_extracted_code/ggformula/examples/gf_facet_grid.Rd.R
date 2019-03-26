library(ggformula)


### Name: gf_facet_wrap
### Title: Add facets to a plot
### Aliases: gf_facet_wrap gf_facet_grid

### ** Examples

if (require(mosaicData)) {
  gf_histogram(~ avg_drinks, data = HELPrct) %>%
    gf_facet_grid(~ substance)
  gf_histogram(~ avg_drinks, data = HELPrct) %>%
    gf_facet_grid(~ substance, scales = "free")
  gf_histogram(~ avg_drinks, data = HELPrct) %>%
    gf_facet_grid(~ substance, scales = "free", space = "free")
  gf_line(births ~ date, data = Births, color = ~ wday) %>%
    gf_facet_wrap( ~ year, scales = "free_x", nrow = 5) %>%
    gf_theme(axis.title.x = element_blank(),
             axis.text.x=element_blank(), axis.ticks.x=element_blank()) %>%
    gf_labs(color = "Day")
}




