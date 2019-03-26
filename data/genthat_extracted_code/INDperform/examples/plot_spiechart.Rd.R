library(INDperform)


### Name: plot_spiechart
### Title: Create score-based spie chart
### Aliases: plot_spiechart

### ** Examples

# Using the Baltic Sea demo data in this package
scores_tbl <- scoring(trend_tbl = model_trend_ex,
  mod_tbl = all_results_ex, press_type = press_type_ex)
summary_tbl <- summary_sc(scores_tbl)
p <- plot_spiechart(summary_tbl)
p$TZA

## No test: 
 # Show all spiecharts together
 gridExtra::grid.arrange(grobs = p)

# To modify the plot
p <- plot_spiechart(summary_tbl, col_crit8_11 = c("black",
  "thistle4"), col_press_type = RColorBrewer::brewer.pal(3,
  name = "Accent"), lab_size = 4, title_size = 4)
gridExtra::grid.arrange(grobs = p)

# Remove pressure-independent criteria for the plot (e.g.
# management) (easiest in the score tibble)
scores_tbl$C11 <- NULL
summary_tbl <- summary_sc(scores_tbl)
p <- plot_spiechart(summary_tbl)
gridExtra::grid.arrange(grobs = p)

# Exclude additionally one pressure-specific criterion
 # (e.g. sensitivity C9) (easiest by removing columns
 # in the first list of the summary)
summary_tbl[[1]] <- summary_tbl[[1]][ ,
  ! names(summary_tbl[[1]]) %in% c("C9", "C9_in%")]
p <- plot_spiechart(summary_tbl)
gridExtra::grid.arrange(grobs = p)
## End(No test)



