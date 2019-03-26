## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  fig.width = 6, fig.height = 4, fig.align = "center",
  collapse = TRUE,
  comment = "#>"
)

## ----data----------------------------------------------------------------
set.seed(2)
d <- purrr::map_dfr(
  letters,
  ~ data.frame(
      idx = 1:400,
      value = cumsum(runif(400, -1, 1)),
      type = .,
      flag = sample(c(TRUE, FALSE), size = 400, replace = TRUE),
      stringsAsFactors = FALSE
    )
)

## ----ggplot2-simple------------------------------------------------------
library(ggplot2)

ggplot(d) +
  geom_line(aes(idx, value, colour = type))

## ----ggplot2-filter------------------------------------------------------
library(dplyr, warn.conflicts = FALSE)

d_filtered <- d %>%
  group_by(type) %>% 
  filter(max(value) > 20) %>%
  ungroup()

ggplot(d_filtered) +
  geom_line(aes(idx, value, colour = type))

## ----gghighlight-simple--------------------------------------------------
library(gghighlight)

ggplot(d) +
  geom_line(aes(idx, value, colour = type)) +
  gghighlight(max(value) > 20)

## ----gghighlight-two-conds-----------------------------------------------
ggplot(d) +
  geom_line(aes(idx, value, colour = type)) +
  gghighlight(max(value) > 15, mean(flag) > 0.55)

## ----gghighlight-theme---------------------------------------------------
ggplot(d) +
  geom_line(aes(idx, value, colour = type)) +
  gghighlight(max(value) > 19) +
  theme_minimal()

## ----gghighlight-facet---------------------------------------------------
ggplot(d) +
  geom_line(aes(idx, value, colour = type)) +
  gghighlight(max(value) > 19) +
  theme_minimal() +
  facet_wrap(~ type)

## ----bar-----------------------------------------------------------------
p <- ggplot(iris, aes(Sepal.Length, fill = Species)) +
  geom_histogram() +
  gghighlight()

p

## ----bar-wrap------------------------------------------------------------
p + facet_wrap(~ Species)

## ----point---------------------------------------------------------------
set.seed(10)
d2 <- dplyr::sample_n(d, 20)

ggplot(d2, aes(idx, value)) +
  geom_point() +
  gghighlight(value > 0, label_key = type)

## ----predicate-example, eval=FALSE---------------------------------------
#  max(value) > 20

## ----numeric-highlight---------------------------------------------------
ggplot(d, aes(idx, value, colour = type)) +
  geom_line() +
  gghighlight(max(value), max_highlight = 5L)

## ----labels--------------------------------------------------------------
ggplot(d) +
  geom_line(aes(idx, value, colour = type)) +
  gghighlight(max(value) > 20, use_direct_label = FALSE)

## ----labels2-------------------------------------------------------------
ggplot(d) +
  geom_line(aes(idx, value, colour = type)) +
  gghighlight(max(value) > 20, label_params = list(size = 10))

## ----labels3-------------------------------------------------------------
p <- ggplot(d2, aes(idx, value)) +
  geom_point(size = 4) +
  gghighlight(value > 0, use_direct_label = FALSE)

# the filtered data
p$data

p + geom_label(aes(label = type),
               hjust = 1, vjust = 1, fill = "purple", colour = "white", alpha= 0.5)

