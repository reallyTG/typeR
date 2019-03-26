library(tsibble)


### Name: slide2
### Title: Sliding window calculation over multiple inputs simultaneously
### Aliases: slide2 slide2_dfr slide2_dfc pslide pslide_dfr pslide_dfc
###   slide2_lgl slide2_chr slide2_int slide2_dbl pslide_lgl pslide_chr
###   pslide_int pslide_dbl

### ** Examples

x <- 1:5
y <- 6:10
z <- 11:15
lst <- list(x = x, y = y, z = z)
df <- as.data.frame(lst)
slide2(x, y, sum, .size = 2)
slide2(lst, lst, ~ ., .size = 2)
slide2(df, df, ~ ., .size = 2)
pslide(lst, ~ ., .size = 1)
pslide(list(lst, lst), ~ ., .size = 2)

###
# row-wise sliding over data frame
###

my_df <- data.frame(
  group = rep(letters[1:2], each = 8),
  x = c(1:8, 8:1),
  y = 2 * c(1:8, 8:1) + rnorm(16),
  date = rep(as.Date("2016-06-01") + 0:7, 2)
)

slope <- function(...) {
  data <- list(...)
  fm <- lm(y ~ x, data = data)
  coef(fm)[[2]]
}

my_df %>% 
  nest(-group) %>% 
  mutate(slope = purrr::map(data, ~ pslide_dbl(., slope, .size = 2))) %>% 
  unnest()
## window over 2 months
pedestrian %>% 
  filter(Sensor == "Southern Cross Station") %>% 
  index_by(yrmth = yearmonth(Date_Time)) %>% 
  nest(-yrmth) %>% 
  mutate(ma = slide_dbl(data, ~ mean(.$Count), .size = 2, .bind = TRUE))
# row-oriented workflow
## Not run: 
##D my_diag <- function(...) {
##D   data <- list(...)
##D   fit <- lm(Count ~ Time, data = data)
##D   tibble(fitted = fitted(fit), resid = residuals(fit))
##D }
##D pedestrian %>%
##D   filter_index("2015-01") %>%
##D   nest(-Sensor) %>%
##D   mutate(diag = purrr::map(data, ~ pslide_dfr(., my_diag, .size = 48)))
## End(Not run)



