library(billboarder)


### Name: bb_labs
### Title: Quickly set title, axis labels and caption
### Aliases: bb_labs

### ** Examples

data("prod_par_filiere")

billboarder() %>%
  bb_barchart(data = prod_par_filiere[, c("annee", "prod_hydraulique")], color = "#102246") %>%
  bb_legend(show = FALSE) %>% 
  bb_labs(title = "French hydraulic production", 
          y = "production (in terawatt-hours)",
          caption = "Data source: RTE (https://opendata.rte-france.com)")




