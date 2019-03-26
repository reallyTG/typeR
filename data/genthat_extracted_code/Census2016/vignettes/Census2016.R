## ----knitrOpts-----------------------------------------------------------
library(knitr)
pkgs_suggested <- c("magrittr", 
                    "ggplot2", 
                    "scales",
                    "ggrepel")
suggested_packages_usable <-
  all(vapply(pkgs_suggested, requireNamespace, logical(1), quietly = TRUE))

knitr::opts_chunk$set(eval = suggested_packages_usable,
                      # dev = "png",
                      fig.width = 8,
                      fig.height = 6)

## ----loadPackages--------------------------------------------------------
library(magrittr)
library(data.table)
library(Census2016)
library(ggplot2)
library(scales)
library(ggrepel)

## ----data.kable----------------------------------------------------------
data.kable <- function(DT) {
  current_knitr.kable.NA <- options("knitr.kable.NA")
  options(knitr.kable.NA = '...')
  on.exit(options(knitr.kable.NA = current_knitr.kable.NA))
  if (nrow(DT) > 50) {
    middle_row <- as.data.table(matrix(nrow = 1, ncol = ncol(DT)))
    setnames(middle_row, seq_along(middle_row), names(DT))
    DT_topn <- rbind(head(DT),
                     middle_row,
                     tail(DT))
    kable(DT_topn, format.args = list(big.mark = ","))
  } else {
    kable(DT, format.args = list(big.mark = ","))
  }
}


## ----packageData, include=FALSE------------------------------------------
packageData <- data(package = "Census2016")
.CensusDataTables <- as.data.frame(packageData$results)

## ----income-vs-mortgage--------------------------------------------------
Census2016_wide_by_SA2_year %>%
  .[year == 2016] %>%
  .[, .(sa2_name, persons, median_household_income, median_annual_mortgage)] %>%
  .[order(median_annual_mortgage)] %>%
  data.kable

## ----income-vs-mortgage-chart--------------------------------------------
Census2016_wide_by_SA2_year %>%
  .[year == 2016] %>%
  .[, .(sa2_name, persons, median_household_income, median_annual_mortgage)] %>%
  .[median_annual_mortgage > 0] %>%
  .[, mortgage_less_income := median_annual_mortgage - median_household_income] %>%
  .[, text := NA_character_] %>%
  .[, color := "black"] %>%
  .[order(mortgage_less_income)] %>%
  .[.N:1 <= 5, text := sa2_name] %>%
  .[.N:1 <= 5, color := "red"] %>%
  .[1:.N <= 5, text := sa2_name] %>%
  .[1:.N <= 5, color := "blue"] %>%
  ggplot(aes(x = median_household_income,
             y = median_annual_mortgage,
             size = persons,
             alpha = persons,
             color = color)) +
  geom_point() + 
  scale_color_identity() +
  scale_size(labels = comma) +
  scale_alpha_continuous(labels = comma,
                         range = c(0, 0.5)) +
  scale_x_continuous("Median annual household income", labels = dollar) + 
  scale_y_continuous("Median annual mortgage", labels = dollar) + 
  geom_label_repel(aes(label = text),
                   alpha = 1,
                   na.rm = TRUE) + 
  ggtitle("High-income households live alongside high-mortgage households",
          subtitle = paste0("SA2s, 2016 with 5 highest (red) or lowest (blue)",
                            " nonzero mortgage relative to income"))

## ----languages-spoken-by-year--------------------------------------------
languages_spoken_by_year <-
  Census2016_languages %>%
  .[, .(persons = sum(persons)), keyby = .(language, year)] %>%
  setorder(-year, -persons) %>%
  .[]

languages_spoken_by_year %>%
  # Examine the top six languages,
  # leave the others unlabelled and grey
  .[language %in% languages_spoken_by_year$language[1:6],
    Language := language] %>%
  .[year == 2016, text := Language] %>%
  .[, Language := reorder(Language, -persons)] %>%
  ggplot(aes(x = year,
             y = persons,
             group = language,
             color = Language, 
             label = text)) + 
  geom_line() +
  scale_y_continuous(label = comma) +
  geom_text_repel(na.rm = TRUE,
                  fontface = "bold",
                  force = 1.5,
                  nudge_x = 0.5)
  

## ----see-question-numeric, fig.height=3----------------------------------
see_question(3)

## ----see-question-ancestory----------------------------------------------
see_question(Census2016_ancestories)

