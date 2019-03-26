library(AMR)


### Name: resistance_predict
### Title: Predict antimicrobial resistance
### Aliases: resistance_predict rsi_predict

### ** Examples

## Not run: 
##D # use it with base R:
##D resistance_predict(tbl = tbl[which(first_isolate == TRUE & genus == "Haemophilus"),],
##D                    col_ab = "amcl", col_date = "date")
##D 
##D # or use dplyr so you can actually read it:
##D library(dplyr)
##D tbl %>%
##D   filter(first_isolate == TRUE,
##D          genus == "Haemophilus") %>%
##D   resistance_predict(amcl, date)
## End(Not run)


# real live example:
library(dplyr)
septic_patients %>%
  # get bacteria properties like genus and species
  left_join_microorganisms("mo") %>%
  # calculate first isolates
  mutate(first_isolate =
           first_isolate(.,
                         "date",
                         "patient_id",
                         "mo",
                         col_specimen = NA,
                         col_icu = NA)) %>%
  # filter on first E. coli isolates
  filter(genus == "Escherichia",
         species == "coli",
         first_isolate == TRUE) %>%
  # predict resistance of cefotaxime for next years
  resistance_predict(col_ab = "cfot",
                     col_date = "date",
                     year_max = 2025,
                     preserve_measurements = TRUE,
                     minimum = 0)

# create nice plots with ggplot
if (!require(ggplot2)) {

  data <- septic_patients %>%
    filter(mo == "ESCCOL") %>%
    resistance_predict(col_ab = "amox",
                      col_date = "date",
                      info = FALSE,
                      minimum = 15)

  ggplot(data,
         aes(x = year)) +
    geom_col(aes(y = value),
             fill = "grey75") +
    geom_errorbar(aes(ymin = se_min,
                      ymax = se_max),
                  colour = "grey50") +
    scale_y_continuous(limits = c(0, 1),
                       breaks = seq(0, 1, 0.1),
                       labels = paste0(seq(0, 100, 10), "%")) +
    labs(title = expression(paste("Forecast of amoxicillin resistance in ",
                                  italic("E. coli"))),
         y = "%IR",
         x = "Year") +
    theme_minimal(base_size = 13)
}



