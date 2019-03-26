## ---- echo = FALSE-------------------------------------------------------
library <- function(...) {
  suppressWarnings(
    suppressPackageStartupMessages(base::library(..., quietly = TRUE))
  )
}

## ------------------------------------------------------------------------
library(magrittr)
library(dplyr)
library(ggplot2)
library(rdbnomics)

## ---- echo = FALSE-------------------------------------------------------
reorder_cols <- function(x) {
  cols <- c(
    "provider_code", "dataset_code", "dataset_name", "series_code",
    "series_name", "original_period", "period", "value", "@frequency"
  )

  if ("unit" %in% colnames(x)) {
    cols <- c(cols, "unit", "Unit")
  }

  if ("geo" %in% colnames(x)) {
    cols <- c(cols, "geo", "Country")
  }

  if ("freq" %in% colnames(x)) {
    cols <- c(cols, "freq", "Frequency")
  }

  cols_add <- setdiff(colnames(x), cols)
  cols <- c(cols, cols_add)

  cols <- cols[cols %in% colnames(x)]
  
  cols <- match(cols, colnames(x))

  dplyr::select(x, cols)
}

scale_colour_discrete <- function(...) {
  scale_color_brewer(palette = "Set1")
}

knitr::opts_chunk$set(dev.args = list(bg = "transparent"))

dbnomics <- function(legend_title = "Code") {
  list(
    scale_x_date(expand = c(0, 0)),
    xlab(""),
    ylab(""),
    guides(color = guide_legend(title = legend_title)),
    theme_bw(),
    theme(
      legend.position = "bottom", legend.direction = "vertical",
      legend.background = element_rect(fill = "transparent", colour = NA),
      legend.key = element_blank(),
      panel.background = element_rect(fill = "transparent", colour = NA),
      plot.background = element_rect(fill = "transparent", colour = NA),
      legend.title = element_blank()
    ),
    annotate(
      geom = "text", label = "DBnomics", 
      x = structure(Inf, class = "Date"), y = -Inf,
      hjust = 1.1, vjust = -0.4, col = "grey", 
      fontface = "italic"
    )
  )
}

display_table <- function(DT) {
  DT_ok <- FALSE
  if (
    "rmarkdown" %in% installed.packages()[, "Package"] &
    "DT" %in% installed.packages()[, "Package"]
  ) {
    if (rmarkdown::pandoc_available()) {
      if (rmarkdown::pandoc_version() >= numeric_version("1.12.3")) {
        DT_ok <- TRUE
      }
    }
  }

  if (DT_ok) {
    DT::datatable(
      DT,
      rownames = FALSE, options = list(pageLength = 5, scrollX = TRUE)
    )
  } else {
    dplyr::as.tbl(DT)
  }
}

## ---- eval = FALSE-------------------------------------------------------
#  df <- rdb(ids = 'AMECO/ZUTN/EA19.1.0.0.0.ZUTN') %>%
#    filter(!is.na(value))

## ---- eval = TRUE, echo = FALSE------------------------------------------
df <- rdbnomics:::rdbnomics_df001

## ---- echo = FALSE-------------------------------------------------------
df %>%
  reorder_cols() %>%
  display_table()

## ---- fig.align = 'center'-----------------------------------------------
ggplot(df, aes(x = period, y = value, color = series_code)) +
  geom_line(size = 2) +
  dbnomics()

## ---- eval = FALSE-------------------------------------------------------
#  df <- rdb(ids = c('AMECO/ZUTN/EA19.1.0.0.0.ZUTN', 'AMECO/ZUTN/DNK.1.0.0.0.ZUTN')) %>%
#    filter(!is.na(value))

## ---- eval = TRUE, echo = FALSE------------------------------------------
df <- rdbnomics:::rdbnomics_df002

## ---- echo = FALSE-------------------------------------------------------
df %>%
  arrange(series_code, period) %>%
  reorder_cols() %>%
  display_table()

## ---- fig.align = 'center'-----------------------------------------------
ggplot(df, aes(x = period, y = value, color = series_code)) +
  geom_line(size = 2) +
  dbnomics()

## ---- eval = FALSE-------------------------------------------------------
#  df <- rdb(ids = c('AMECO/ZUTN/EA19.1.0.0.0.ZUTN', 'Eurostat/une_rt_q/Q.SA.TOTAL.PC_ACT.T.EA19')) %>%
#    filter(!is.na(value))

## ---- eval = TRUE, echo = FALSE------------------------------------------
df <- rdbnomics:::rdbnomics_df003

## ---- echo = FALSE-------------------------------------------------------
df %>%
  arrange(series_code, period) %>%
  reorder_cols() %>%
  display_table()

## ---- fig.align = 'center'-----------------------------------------------
ggplot(df, aes(x = period, y = value, color = series_code)) +
  geom_line(size = 2) +
  dbnomics()

## ---- eval = FALSE-------------------------------------------------------
#  df <- rdb('IMF', 'CPI', mask = 'M.DE.PCPIEC_WT') %>%
#    filter(!is.na(value))

## ---- eval = TRUE, echo = FALSE------------------------------------------
df <- rdbnomics:::rdbnomics_df004

## ---- echo = FALSE-------------------------------------------------------
df %>%
  reorder_cols() %>%
  display_table()

## ---- fig.align = 'center'-----------------------------------------------
ggplot(df, aes(x = period, y = value, color = series_code)) +
  geom_step(size = 2) +
  dbnomics()

## ---- eval = FALSE-------------------------------------------------------
#  df <- rdb('IMF', 'CPI', mask = 'M.DE+FR.PCPIEC_WT') %>%
#    filter(!is.na(value))

## ---- eval = TRUE, echo = FALSE------------------------------------------
df <- rdbnomics:::rdbnomics_df005

## ---- echo = FALSE-------------------------------------------------------
df %>%
  arrange(series_code, period) %>%
  reorder_cols() %>%
  display_table()

## ---- fig.align = 'center'-----------------------------------------------
ggplot(df, aes(x = period, y = value, color = series_code)) +
  geom_step(size = 2) +
  dbnomics()

## ---- eval = FALSE-------------------------------------------------------
#  df <- rdb('IMF', 'CPI', mask = 'M..PCPIEC_WT') %>%
#    filter(!is.na(value)) %>%
#    arrange(desc(period), REF_AREA) %>%
#    head(100)

## ---- eval = TRUE, echo = FALSE------------------------------------------
df <- rdbnomics:::rdbnomics_df006

## ---- echo = FALSE-------------------------------------------------------
df %>%
  reorder_cols() %>%
  display_table()

## ---- eval = FALSE-------------------------------------------------------
#  df <- rdb('IMF', 'CPI', mask = 'M..PCPIEC_IX+PCPIA_IX') %>%
#    filter(!is.na(value)) %>%
#    group_by(INDICATOR) %>%
#    top_n(n = 50, wt = period)

## ---- eval = TRUE, echo = FALSE------------------------------------------
df <- ungroup(rdbnomics:::rdbnomics_df007)

## ---- echo = FALSE-------------------------------------------------------
df %>%
  reorder_cols() %>%
  display_table()

## ---- eval = FALSE-------------------------------------------------------
#  df <- rdb('AMECO', 'ZUTN', dimensions = list(geo = "ea19")) %>%
#    filter(!is.na(value))
#  # or
#  # df <- rdb('AMECO', 'ZUTN', dimensions = '{"geo": ["ea19"]}') %>%
#  #   filter(!is.na(value))

## ---- eval = TRUE, echo = FALSE------------------------------------------
df <- rdbnomics:::rdbnomics_df008

## ---- echo = FALSE-------------------------------------------------------
df %>%
  reorder_cols() %>%
  display_table()

## ---- fig.align = 'center'-----------------------------------------------
ggplot(df, aes(x = period, y = value, color = series_code)) +
  geom_line(size = 2) +
  dbnomics()

## ---- eval = FALSE-------------------------------------------------------
#  df <- rdb('AMECO', 'ZUTN', dimensions = list(geo = c("ea19", "dnk"))) %>%
#    filter(!is.na(value))
#  # or
#  # df <- rdb('AMECO', 'ZUTN', dimensions = '{"geo": ["ea19", "dnk"]}') %>%
#  #   filter(!is.na(value))

## ---- eval = TRUE, echo = FALSE------------------------------------------
df <- rdbnomics:::rdbnomics_df009

## ---- echo = FALSE-------------------------------------------------------
df %>%
  arrange(series_code, period) %>%
  reorder_cols() %>%
  display_table()

## ---- fig.align = 'center'-----------------------------------------------
ggplot(df, aes(x = period, y = value, color = series_code)) +
  geom_line(size = 2) +
  dbnomics()

## ---- eval = FALSE-------------------------------------------------------
#  df <- rdb('WB', 'DB', dimensions = list(country = c("DZ", "PE"), indicator = c("ENF.CONT.COEN.COST.ZS", "IC.REG.COST.PC.FE.ZS"))) %>%
#    filter(!is.na(value))
#  # or
#  # df <- rdb('WB', 'DB', dimensions = '{"country": ["DZ", "PE"], "indicator": ["ENF.CONT.COEN.COST.ZS", "IC.REG.COST.PC.FE.ZS"]}') %>%
#  #   filter(!is.na(value))

## ---- eval = TRUE, echo = FALSE------------------------------------------
df <- rdbnomics:::rdbnomics_df010

## ---- echo = FALSE-------------------------------------------------------
df %>%
  arrange(series_name, period) %>%
  reorder_cols() %>%
  display_table()

## ---- fig.align = 'center'-----------------------------------------------
ggplot(df, aes(x = period, y = value, color = series_name)) +
  geom_line(size = 2) +
  dbnomics()

## ---- eval = FALSE-------------------------------------------------------
#  df <- rdb_by_api_link("https://api.db.nomics.world/v22/series/WB/DB?dimensions=%7B%22country%22%3A%5B%22FR%22%2C%22IT%22%2C%22ES%22%5D%7D&q=IC.REG.PROC.FE.NO&observations=1&format=json&align_periods=1&offset=0&facets=0") %>%
#    filter(!is.na(value))

## ---- eval = TRUE, echo = FALSE------------------------------------------
df <- rdbnomics:::rdbnomics_df011

## ---- echo = FALSE-------------------------------------------------------
df %>%
  arrange(period, series_name) %>%
  reorder_cols() %>%
  display_table()

## ---- fig.align = 'center'-----------------------------------------------
ggplot(df, aes(x = period, y = value, color = series_name)) +
  geom_step(size = 2) +
  dbnomics()

## ---- eval = FALSE-------------------------------------------------------
#  df <- rdb_by_api_link("https://api.db.nomics.world/v22/series?series_ids=BOE%2F8745%2FLPMB23A%2CBOE%2F8745%2FLPMB26A&observations=1&format=json&align_periods=1") %>%
#    filter(!is.na(value))

## ---- eval = TRUE, echo = FALSE------------------------------------------
df <- rdbnomics:::rdbnomics_df012

## ---- echo = FALSE-------------------------------------------------------
df %<>%
  mutate(
    series_name = sapply(
      series_name,
      function(y) {
        paste0(
          paste0(
            strsplit(y, "approvals ")[[1]], collapse = "approvals\n"
          ),
          "\n"
        )
      }
    )
  )

## ---- echo = FALSE-------------------------------------------------------
df %>%
  arrange(period, series_name) %>%
  reorder_cols() %>%
  display_table()

## ---- fig.align = 'center'-----------------------------------------------
ggplot(df, aes(x = period, y = value, color = series_name)) +
  geom_line(size = 2) +
  scale_y_continuous(labels = function(x) { format(x, big.mark = " ") }) +
  dbnomics()

## ---- eval = FALSE-------------------------------------------------------
#  Error in open.connection(con, "rb") :
#    Could not resolve host: api.db.nomics.world

## ---- eval = FALSE-------------------------------------------------------
#  options(rdbnomics.use_readLines = TRUE)
#  
#  df1 <- rdb(ids = 'AMECO/ZUTN/EA19.1.0.0.0.ZUTN')
#  
#  df2 <- rdb(ids = c('AMECO/ZUTN/EA19.1.0.0.0.ZUTN', 'AMECO/ZUTN/DNK.1.0.0.0.ZUTN'))

## ---- eval = FALSE-------------------------------------------------------
#  df1 <- rdb(ids = 'AMECO/ZUTN/EA19.1.0.0.0.ZUTN', use_readLines = TRUE)
#  
#  df2 <- rdb(
#    ids = c('AMECO/ZUTN/EA19.1.0.0.0.ZUTN', 'AMECO/ZUTN/DNK.1.0.0.0.ZUTN'),
#    use_readLines = TRUE
#  )

## ---- eval = FALSE-------------------------------------------------------
#  dbnomics <- function(legend_title = "Code") {
#    list(
#      scale_x_date(expand = c(0, 0)),
#      xlab(""),
#      ylab(""),
#      guides(color = guide_legend(title = legend_title)),
#      theme_bw(),
#      theme(
#        legend.position = "bottom", legend.direction = "vertical",
#        legend.background = element_rect(fill = "transparent", colour = NA),
#        legend.key = element_blank(),
#        panel.background = element_rect(fill = "transparent", colour = NA),
#        plot.background = element_rect(fill = "transparent", colour = NA),
#        legend.title = element_blank()
#      ),
#      annotate(
#        geom = "text", label = "DBnomics",
#        x = structure(Inf, class = "Date"), y = -Inf,
#        hjust = 1.1, vjust = -0.4, col = "grey",
#        fontface = "italic"
#      )
#    )
#  }

