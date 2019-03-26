library(mosaicData)


### Name: SAT
### Title: State by State SAT data
### Aliases: SAT
### Keywords: datasets

### ** Examples

data(SAT)
if (require(ggformula)) {
  gf_point(sat ~ expend, data = SAT, color = "blue", alpha = 0.5) %>%
    gf_lm()
  gf_text(sat ~ expend, data = SAT, label = ~ abbreviate(SAT$state, 3),
    inherit = FALSE)
} 



