library(coveffectsplot)


### Name: forest_plot
### Title: Forest plot
### Aliases: forest_plot

### ** Examples

library(dplyr)

# Example 1

plotdata <- get_sample_data("forest-plot-table.csv")
plotdata <- plotdata %>%
  mutate(midlabel = format(round(mid,2), nsmall = 2),
         lowerlabel = format(round(lower,2), nsmall = 2),
         upperlabel = format(round(upper,2), nsmall = 2),
         LABEL = paste0(midlabel, " [", lowerlabel, "-", upperlabel, "]"))
param <- "BZD AUC"
plotdata <-  filter(plotdata,paramname==param)
plotdata$covname <- reorder(plotdata$covname,plotdata$upper,FUN =max)
plotdata$label <- reorder(plotdata$label,plotdata$scen)
covs <- c("WEIGHT","AGE")
plotdata <-  filter(plotdata,covname%in%covs)
forest_plot(plotdata,
            ref_legend_text = "Reference (vertical line)",
            area_legend_text = "Reference (vertical line)",
            xlabel = paste("Fold Change in", param, "Relative to Reference"),
            show_ref_area = FALSE,
            facet_formula = "covname~.",
            facet_scales = "free_y",
            facet_space = "free_y",
            show_table_facet_strip = FALSE,
            table_position = "right",
            plot_table_ratio = 4)

# Example 2

plotdata <- get_sample_data("forest-plot-table.csv")
plotdata <- plotdata %>%
  mutate(midlabel = format(round(mid,2), nsmall = 2),
         lowerlabel = format(round(lower,2), nsmall = 2),
         upperlabel = format(round(upper,2), nsmall = 2),
         LABEL = paste0(midlabel, " [", lowerlabel, "-", upperlabel, "]"))
param <- c("BZD AUC","BZD Cmax")
plotdata <-  filter(plotdata,paramname%in%param)
plotdata <-  filter(plotdata,covname%in%"WEIGHT")
plotdata$covname <- reorder(plotdata$covname,plotdata$upper,FUN =max)
plotdata$label <- reorder(plotdata$label,plotdata$scen)
forest_plot(plotdata,
            ref_legend_text = "Reference (vertical line)",
            area_legend_text = "Reference (vertical line)",
            xlabel = paste("Fold Change of Parameter", "Relative to Reference"),
            show_ref_area = FALSE,
            facet_formula = "covname~paramname",
            facet_scales = "free_y",
            facet_space = "free_y",
            x_facet_text_size = 10,
            y_facet_text_size = 10,
            y_label_text_size = 10,
            x_label_text_size = 10,
            facet_switch = "both",
            show_table_facet_strip = TRUE,
            table_position = "below",
            plot_table_ratio = 1)
## Not run: 
##D # Example 3
##D 
##D plotdata <- get_sample_data("forestplotdatacpidata.csv")
##D forest_plot(plotdata,
##D             ref_area = c(0.8, 1.2),
##D             x_facet_text_size = 12,
##D             y_facet_text_size = 12,
##D             y_label_text_size = 10,
##D             x_label_text_size = 10,
##D             table_text_size = 6,
##D             plot_table_ratio = 1.5,
##D             ref_legend_text = "Reference (vertical line)\n+/- 20% limits (colored area)",
##D             area_legend_text = "Reference (vertical line)\n+/- 20% limits (colored area)",
##D             xlabel = "Fold Change Relative to RHZE",
##D             facet_formula = "covname~paramname",
##D             table_position = "below")
##D 
##D # Example 4
##D plotdata <- get_sample_data("dataforest.csv")
##D plotdata <- plotdata %>%
##D   mutate(midlabel = format(round(mid,2), nsmall = 2),
##D          lowerlabel = format(round(lower,2), nsmall = 2),
##D          upperlabel = format(round(upper,2), nsmall = 2),
##D          LABEL = paste0(midlabel, " [", lowerlabel, "-", upperlabel, "]"))
##D plotdata <- plotdata %>%
##D   filter(covname%in%c("Weight"))
##D plotdata$label <- as.factor(as.character(plotdata$label))
##D plotdata$label <- factor(plotdata$label, c("36.2 kg","66 kg","110 kg"))
##D forest_plot(plotdata,
##D             ref_area = c(0.8, 1.2),
##D             x_facet_text_size = 13,
##D             y_facet_text_size = 13,
##D             ref_legend_text = "Reference (vertical line)\n+/- 20% limits (colored area)",
##D             area_legend_text = "Reference (vertical line)\n+/- 20% limits (colored area)",
##D             xlabel = "Fold Change Relative to Parameter",
##D             facet_formula = "covname~paramname",
##D             facet_switch = "both",
##D             facet_scales = "free",
##D             facet_space = "fixed",
##D             table_position = "below",
##D             plot_table_ratio = 1)
##D 
##D # Example 5
##D 
##D forest_plot(plotdata,
##D             ref_area = c(0.8, 1.2),
##D             x_facet_text_size = 13,
##D             y_facet_text_size = 13,
##D             ref_legend_text = "Reference (vertical line)\n+/- 20% limits (colored area)",
##D             area_legend_text = "Reference (vertical line)\n+/- 20% limits (colored area)",
##D             xlabel = "Fold Change Relative to Parameter",
##D             facet_formula = "covname~.",
##D             facet_switch = "both",
##D             facet_scales = "free",
##D             facet_space = "fixed",
##D             paramname_shape = TRUE,
##D             table_position = "below",
##D             plot_table_ratio = 1)
## End(Not run)



