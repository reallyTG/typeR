## ---- echo=FALSE, message=FALSE------------------------------------------
library(rfm)
library(knitr)
library(kableExtra)
library(magrittr)
library(dplyr)
library(ggplot2)
library(DT)
library(grDevices)
library(RColorBrewer)
options(knitr.table.format = "html")
options(tibble.width = Inf)

## ----rfm_data_orders-----------------------------------------------------
rfm_data_orders

## ----rfm_table_order, eval=FALSE-----------------------------------------
#  analysis_date <- lubridate::as_date("2006-12-31", tz = "UTC")
#  rfm_result <- rfm_table_order(rfm_data_orders, customer_id, order_date, revenue, analysis_date)
#  rfm_result

## ----rfm_table_order2, eval=TRUE, echo=FALSE-----------------------------
analysis_date <- lubridate::as_date("2006-12-31", tz = "UTC")
rfm_result <- rfm_table_order(rfm_data_orders, customer_id, order_date, revenue, analysis_date)
rfm_result %>%
  use_series(rfm) %>%
  slice(1:10) %>%
  kable() %>%
  kable_styling()

## ----heatmap, fig.align='center', fig.width=8, fig.height=6--------------
rfm_heatmap(rfm_result)

## ----barchart, fig.align='center', fig.width=8, fig.height=6-------------
rfm_bar_chart(rfm_result)

## ----rfmhist, fig.align='center', fig.width=8, fig.height=6--------------
rfm_histograms(rfm_result)

## ----rfmorders, fig.align='center', fig.width=8, fig.height=6------------
rfm_order_dist(rfm_result)

## ----mr, fig.align='center', fig.width=7, fig.height=7-------------------
rfm_rm_plot(rfm_result)

## ----fm, fig.align='center', fig.width=7, fig.height=7-------------------
rfm_fm_plot(rfm_result)

## ----fr, fig.align='center', fig.width=7, fig.height=7-------------------
rfm_rf_plot(rfm_result)

## ----segments, echo=FALSE------------------------------------------------
segment <- c(
  "Champions", "Loyal Customers", "Potential Loyalist",
  "New Customers", "Promising", "Need Attention",
  "About To Sleep", "At Risk", "Can't Lose Them", "Hibernating",
  "Lost"
)
description <- c(
  "Bought recently, buy often and spend the most",
  "Spend good money. Responsive to promotions",
  "Recent customers, spent good amount, bought more than once",
  "Bought more recently, but not often",
  "Recent shoppers, but haven't spent much",
  "Above average recency, frequency & monetary values",
  "Below average recency, frequency & monetary values",
  "Spent big money, purchased often but long time ago",
  "Made big purchases and often, but long time ago",
  "Low spenders, low frequency, purchased long time ago",
  "Lowest recency, frequency & monetary scores"
)
recency <- c("4 - 5", "2 - 5", "3 - 5", "4 - 5", "3 - 4", "2 - 3", "2 - 3", "<= 2", "<= 1", "1 - 2", "<= 2")
frequency <- c("4 - 5", "3 - 5", "1 - 3", "<= 1", "<= 1", "2 - 3", "<= 2", "2 - 5", "4 - 5", "1 - 2", "<= 2")
monetary <- c("4 - 5", "3 - 5", "1 - 3", "<= 1", "<= 1", "2 - 3", "<= 2", "2 - 5", "4 - 5", "1 - 2", "<= 2")
segments <- tibble(
  Segment = segment, Description = description,
  R = recency, `F` = frequency, M = monetary
)
segments %>%
  kable() %>%
  kable_styling(full_width = TRUE, font_size = 12)

## ----criteria, echo=FALSE------------------------------------------------
rfm_segments <- rfm_result %>%
  use_series(rfm) %>%
  mutate(
    segment = case_when(
      (recency_score %>% between(4, 5)) & (frequency_score %>% between(4, 5)) &
        (monetary_score %>% between(4, 5))  ~ "Champions",
      (recency_score %>% between(2, 5)) & (frequency_score %>% between(3, 5)) &
        (monetary_score %>% between(3, 5)) ~ "Loyal Customers",
      (recency_score %>% between(3, 5)) & (frequency_score %>% between(1, 3)) &
        (monetary_score %>% between(1, 3)) ~ "Potential Loyalist",
      (recency_score %>% between(4, 5)) & (frequency_score == 1) &
        (monetary_score == 1) ~ "New Customers",
      (recency_score %>% between(3, 4)) & (frequency_score == 1) &
        (monetary_score == 1) ~ "Promising",
      (recency_score %>% between(2, 3)) & (frequency_score %>% between(2, 3)) &
        (monetary_score %>% between(2, 3)) ~ "Needs Attention",
      (recency_score %>% between(2, 3)) & (frequency_score <= 2) &
        (monetary_score <= 2) ~ "About To Sleep",
      (recency_score <= 2) & (frequency_score %>% between(2, 5)) &
        (monetary_score %>% between(2, 5)) ~ "At Risk",
      (recency_score == 1) & (frequency_score %>% between(4, 5)) &
        (monetary_score %>% between(4, 5)) ~ "Cant Lose Them",
      (recency_score %>% between(1, 2)) & (frequency_score %>% between(1, 2)) &
        (monetary_score %>% between(1, 2)) ~ "Hibernating",
      (recency_score <= 2) & (frequency_score <= 2) &
        (monetary_score <= 2) ~ "Lost",
      TRUE ~ "Others"
    )
  ) %>%
  select(
    customer_id, segment, rfm_score, transaction_count, recency_days,
    amount
  )

# use datatable
rfm_segments %>%
  datatable(
    filter = "top",
    options = list(pageLength = 5, autoWidth = TRUE),
    colnames = c(
      "Customer", "Segment", "RFM",
      "Orders", "Recency", "Total Spend"
    )
  )

## ----rfm_customers-------------------------------------------------------
rfm_segments %>%
  count(segment) %>%
  arrange(desc(n)) %>%
  rename(Segment = segment, Count = n)

## ----avg_recency, fig.align='center', fig.height=5, fig.width=6----------
data <- 
    rfm_segments %>%
    group_by(segment) %>%
    select(segment, recency_days) %>%
    summarize(median(recency_days)) %>%
    rename(segment = segment, avg_recency = `median(recency_days)`) %>%
    arrange(avg_recency) 

  n_fill <- nrow(data)

  ggplot(data, aes(segment, avg_recency)) +
    geom_bar(stat = "identity", fill = brewer.pal(n = n_fill, name = "Set1")) +
    xlab("Segment") + ylab("Median Recency") +
    ggtitle("Median Recency by Segment") +
    coord_flip() +
    theme(
      plot.title = element_text(hjust = 0.5)
    )

## ----avg_frequency, fig.align='center', fig.height=5, fig.width=6--------
data <- 
    rfm_segments %>%
    group_by(segment) %>%
    select(segment, transaction_count) %>%
    summarize(median(transaction_count)) %>%
    rename(segment = segment, avg_frequency = `median(transaction_count)`) %>%
    arrange(avg_frequency) 

n_fill <- nrow(data)

ggplot(data, aes(segment, avg_frequency)) +
    geom_bar(stat = "identity", fill = brewer.pal(n = n_fill, name = "Set1")) +
    xlab("Segment") + ylab("Median Frequency") +
    ggtitle("Median Frequency by Segment") +
    coord_flip() +
    theme(
      plot.title = element_text(hjust = 0.5)
    )

## ----avg_monetary, fig.align='center', fig.height=5, fig.width=6---------
data <- 
    rfm_segments %>%
    group_by(segment) %>%
    select(segment, amount) %>%
    summarize(median(amount)) %>%
    rename(segment = segment, avg_monetary = `median(amount)`) %>%
    arrange(avg_monetary) 

n_fill <- nrow(data)

ggplot(data, aes(segment, avg_monetary)) +
    geom_bar(stat = "identity", fill = brewer.pal(n = n_fill, name = "Set1")) +
    xlab("Segment") + ylab("Median Monetary Value") +
    ggtitle("Median Monetary Value by Segment") +
    coord_flip() +
    theme(
      plot.title = element_text(hjust = 0.5)
    )

