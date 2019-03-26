library(ggformula)


### Name: gf_labs
### Title: Non-layer functions for gf plots
### Aliases: gf_labs gf_lims gf_refine

### ** Examples

if (require(mosaicData)) {
gf_dens( ~ cesd, color = ~ substance, size = 1.5, data = HELPrct) %>%
gf_labs(
  title = "Center for Epidemiologic Studies Depression measure",
  subtitle = "(at baseline)",
  color = "Abused substance: ",
  x = "CESD score",
  y = "",
  caption = "Source: HELPrct"
) %>%
  gf_theme(theme_classic()) %>%
  gf_theme(
    axis.text.y = element_blank(),
    legend.position = "top",
    plot.title = element_text(hjust = 0.5, color = "navy"),
    plot.subtitle = element_text(hjust = 0.5, color = "navy", size = 12))
}
gf_point(eruptions ~ waiting, data = faithful, alpha = 0.5)
gf_point(eruptions ~ waiting, data = faithful, alpha = 0.5) %>%
  gf_lims(x = c(65, NA), y = c(3, NA))

# modify scales using gf_refine()
gf_jitter(Sepal.Length ~ Sepal.Width, color = ~ Species, data = iris) %>%
  gf_refine(scale_color_brewer(type = "qual", palette = 3)) %>%
  gf_theme(theme_bw())

gf_jitter(Sepal.Length ~ Sepal.Width, color = ~ Species, data = iris) %>%
  gf_refine(scale_color_manual(values = c("red", "navy", "limegreen"))) %>%
  gf_theme(theme_bw())




