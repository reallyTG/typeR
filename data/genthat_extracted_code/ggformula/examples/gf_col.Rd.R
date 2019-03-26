library(ggformula)


### Name: gf_col
### Title: Formula interface to geom_col()
### Aliases: gf_col

### ** Examples

SomeData <- data.frame(
  group = LETTERS[1:3],
  count = c(20, 25, 18)
)
gf_col(count ~ group, data = SomeData)

# A Pareto chart

if(require(dplyr) && require(mosaicData)) {
  HELPrct %>%
    group_by(substance) %>%
    summarise(count = n()) %>%
    ungroup() %>%
    dplyr::arrange(-count) %>%
    mutate(
      cumcount = cumsum(count),
      substance = reorder(substance, - count)
    ) %>%
    gf_col(count ~ substance, fill = "skyblue") %>%
    gf_point(cumcount ~ substance) %>%
    gf_line(cumcount ~ substance, group = 1) %>%
    gf_refine(
      scale_y_continuous(sec.axis = sec_axis( ~ . /nrow(HELPrct)))
    )
  }



