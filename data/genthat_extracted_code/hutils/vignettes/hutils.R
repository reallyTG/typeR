## ----knitrOpts-----------------------------------------------------------
library(knitr)
suggested_packages <- c("geosphere", "nycflights13", "dplyr", "ggplot2", "microbenchmark")
opts_chunk$set(eval = all(vapply(suggested_packages, requireNamespace, quietly = TRUE, FUN.VALUE = FALSE)))

## ----loadPackages--------------------------------------------------------
tryCatch({
  library(geosphere)
  library(nycflights13)
  library(dplyr, warn.conflicts = FALSE)
  library(ggplot2)
  library(microbenchmark)
  library(data.table, warn.conflicts = FALSE)
  library(magrittr)
  library(hutils, warn.conflicts = FALSE)
}, 
# requireNamespace does not detect errors like
# package ‘dplyr’ was installed by an R version with different internals; it needs to be reinstalled for use with this R version
error = function(e) {
  opts_chunk$set(eval = FALSE)
})
options(digits = 4)

## ----aliases-------------------------------------------------------------
OR(OR(TRUE,
      stop("Never happens")),  ## short-circuits
   AND(FALSE,
       stop("Never happens")))  

## ----compare_if_else-----------------------------------------------------
my_check <- function(values) {
  all(vapply(values[-1], function(x) identical(values[[1]], x), logical(1)))
}

set.seed(2)
cnd <- sample(c(TRUE, FALSE, NA), size = 100e3, replace = TRUE)
yes <- sample(letters, size = 100e3, replace = TRUE)
no <- sample(letters, size = 100e3, replace = TRUE)
na <- sample(letters, size = 100e3, replace = TRUE)

microbenchmark(dplyr =  dplyr::if_else(cnd, yes, no, na),
               hutils = hutils::if_else(cnd, yes, no, na),
               check = my_check) %>%
  print

cnd <- sample(c(TRUE, FALSE, NA), size = 100e3, replace = TRUE)
yes <- sample(letters, size = 1, replace = TRUE)
no <- sample(letters, size = 100e3, replace = TRUE)
na <- sample(letters, size = 1, replace = TRUE)

microbenchmark(dplyr =  dplyr::if_else(cnd, yes, no, na),
               hutils = hutils::if_else(cnd, yes, no, na),
               check = my_check) %>%
  print

## ----compare_coalesce----------------------------------------------------
x <- sample(c(letters, NA), size = 100e3, replace = TRUE)
A <- sample(c(letters, NA), size = 100e3, replace = TRUE)
B <- sample(c(letters, NA), size = 100e3, replace = TRUE)
C <- sample(c(letters, NA), size = 100e3, replace = TRUE)

microbenchmark(dplyr =  dplyr::coalesce(x, A, B, C),
               hutils = hutils::coalesce(x, A, B, C),
               check = my_check) %>%
  print

## ----compare_coalesce_short_circuit_x------------------------------------
x <- sample(c(letters), size = 100e3, replace = TRUE)

microbenchmark(dplyr =  dplyr::coalesce(x, A, B, C),
               hutils = hutils::coalesce(x, A, B, C),
               check = my_check) %>%
  print

## ----compare_coalesce_short_circuit_A------------------------------------
x <- sample(c(letters, NA), size = 100e3, replace = TRUE)
A <- sample(c(letters), size = 100e3, replace = TRUE)

microbenchmark(dplyr =  dplyr::coalesce(x, A, B, C),
               hutils = hutils::coalesce(x, A, B, C),
               check = my_check) %>%
  print

## ----canonical_drop_DT---------------------------------------------------
DT <- data.table(A = 1:5, B = 1:5, C = 1:5)
DT[, A := NULL]

## ----drop_col_hutils-----------------------------------------------------
DT <- data.table(A = 1:5, B = 1:5, C = 1:5)
DT %>%
  drop_col("A") %>%
  drop_col("B")

# or
DT <- data.table(A = 1:5, B = 1:5, C = 1:5)
DT %>%
  drop_cols(c("A", "B"))

## ----drop_colr-----------------------------------------------------------
flights <- as.data.table(flights)

flights %>%
  drop_colr("time") %>%
  drop_colr("arr(?!_delay)", perl = TRUE)

## ----drop_constant_cols--------------------------------------------------
flights %>%
  .[origin == "JFK"] %>%
  drop_constant_cols

## ----drop_empty_cols-----------------------------------------------------
planes %>% 
  as.data.table %>% 
  .[!complete.cases(.)]

planes %>% 
  as.data.table %>% 
  .[!complete.cases(.)] %>% 
  # drops speed
  drop_empty_cols

## ----duplicated_rows-----------------------------------------------------
flights %>%
  # only the 'second' of the duplicates is returned
  .[duplicated(., by = c("origin", "dest"))]  

flights %>%
  # Both rows are returned and (by default)
  # duplicates are presented adjacently
  duplicated_rows(by = c("origin", "dest"))

## ----haversine_distance--------------------------------------------------
DT1 <- data.table(lat_orig = runif(1e5, -80, 80),
                  lon_orig = runif(1e5, -179, 179),
                  lat_dest = runif(1e5, -80, 80),
                  lon_dest = runif(1e5, -179, 179))

DT2 <- copy(DT1)

microbenchmark(DT1[, distance := haversine_distance(lat_orig, lon_orig,
                                                    lat_dest, lon_dest)],
               
               DT2[, distance := distHaversine(cbind(lon_orig, lat_orig),
                                               cbind(lon_orig, lat_orig))])
rm(DT1, DT2)

## ----mutate-other, results='asis'----------------------------------------
set.seed(1)
DT <- data.table(Fruit = sample(c("apple", "pear", "orange", "tomato", "eggplant"),
                                size = 20,
                                prob = c(0.45, 0.25, 0.15, 0.1, 0.05),
                                replace = TRUE),
                 Price = rpois(20, 10))

kable(mutate_other(DT, "Fruit", n = 3)[])

## ----iris-veriscolor-----------------------------------------------------
iris <- as.data.table(iris)
iris[Species %in% c("setosa", "versicolour")] %$%
  mean(Sepal.Length / Sepal.Width)

## ----iris-versicolor, error=TRUE-----------------------------------------
iris <- as.data.table(iris)
iris[Species %ein% c("setosa", "versicolour")] %$%
  mean(Sepal.Length / Sepal.Width)

## ----pin-----------------------------------------------------------------
identical(iris[grep("v", Species)],
          iris[Species %pin% "v"])

## ----pin-multi-----------------------------------------------------------
iris[Species %pin% c("ver", "vir")] %>%
  head

## ------------------------------------------------------------------------
DT <- data.table(x = 1:5,
                 y = letters[1:5],
                 AB = c(NA, TRUE, FALSE, TRUE, FALSE))
select_which(DT, anyNA, .and.dots = "y")

## ------------------------------------------------------------------------
dt <- data.table(y = !sample(0:1, size = 100, replace = TRUE), 
                 x = runif(100))
dt[, pred := predict(lm(y ~ x, data = .SD), newdata = .SD)]

dt[, auc(y, pred)]

## ----select_grep---------------------------------------------------------
flights %>%
  select_grep("arr")

## ----select_grep-and-----------------------------------------------------
flights %>%
  select_grep("arr", .and = "year", .but.not = "arr_time")

## ------------------------------------------------------------------------
RQ(dplyr, "dplyr must be installed")
RQ("dplyr", "dplyr needs installing", "dplyr installed.")

## ----ahull-1-------------------------------------------------------------
ggplot(data.table(x = c(0, 1, 2, 3, 4), y = c(0, 1, 2, 0.1, 0))) +
  geom_area(aes(x, y)) +
  geom_rect(data = ahull(, c(0, 1, 2, 3, 4), c(0, 1, 2, 0.1, 0)),
            aes(xmin = xmin,
                xmax = xmax,
                ymin = ymin,
                ymax = ymax),
            color = "red") 

## ----ahull-demos, fig.width = 8, fig.height = 6--------------------------
set.seed(101)
ahull_dt <-
  data.table(x = c(0:100) / 100,
             y = cumsum(rnorm(101, 0.05)))
ggplot(ahull_dt) +
  geom_area(aes(x, y)) + 
  geom_rect(data = ahull(ahull_dt), 
            aes(xmin = xmin, 
                xmax = xmax, 
                ymin = ymin, 
                ymax = ymax), 
            color = "red") + 
  geom_rect(data = ahull(ahull_dt,
                         incl_negative = TRUE), 
            aes(xmin = xmin, 
                xmax = xmax, 
                ymin = ymin, 
                ymax = ymax), 
            color = "blue") + 
  geom_rect(data = ahull(ahull_dt,
                         incl_negative = TRUE,
                         minH = 4), 
            aes(xmin = xmin, 
                xmax = xmax, 
                ymin = ymin, 
                ymax = ymax), 
            color = "green") + 
  geom_rect(data = ahull(ahull_dt,
                         incl_negative = TRUE,
                         minW = 0.25), 
            aes(xmin = xmin, 
                xmax = xmax, 
                ymin = ymin, 
                ymax = ymax), 
            color = "white",
            fill = NA)



## ----weighted_quantile-ex------------------------------------------------
x <- 1:10
w <- c(rep(1, 5), rep(2, 5))
quantile(x, prob = c(0.25, 0.75), names = FALSE)

weighted_quantile(x, w, p = c(0.25, 0.75))

## ----mutate_ntile-ex-----------------------------------------------------
flights %>%
  as.data.table %>%
  .[, .(year, month, day, origin, dest, distance)] %>%
  mutate_ntile(distance, n = 5L)


## ----mutate_ntile-ex-charonly--------------------------------------------
flights %>%
  as.data.table %>%
  .[, .(year, month, day, origin, dest, distance)] %>%
  mutate_ntile(distance, n = 5L)

## ----mutate_ntile-ex-2---------------------------------------------------
flights %>%
  as.data.table %>%
  mutate_ntile("distance",
               n = 5L,
               character.only = TRUE) %>%
  .[, dep_delay := coalesce(dep_delay, 0)] %>%
  .[, .(avgDelay = mean(dep_delay)), keyby = "distanceQuintile"]


## ----longest-affix-------------------------------------------------------
trim_common_affixes(c("CurrentHousingCosts(weekly)",
                      "CurrentFuelCosts(weekly)"))

