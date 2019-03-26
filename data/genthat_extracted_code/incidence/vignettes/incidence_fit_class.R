## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>", 
  fig.width=7, 
  fig.height=5
)

## ----fit_dates-----------------------------------------------------------
library(outbreaks)
library(incidence)
dat <- ebola_sim$linelist$date_of_onset
i <- incidence(dat, interval = "week")
i
f <- fit(i[1:20])
f
plot(i, fit = f)

## ----get_info------------------------------------------------------------
get_info(f, "r")
get_info(f, "r.conf")
get_info(f, "doubling.conf")

## ----create_model--------------------------------------------------------
# ensure all dates have at least one incidence
i2 <- i[1:20]
i2 <- i2[apply(get_counts(i2), 1, min) > 0]
df <- as.data.frame(i2, long = TRUE)
df$dates.x <- get_dates(i2, position = "center", count_days = TRUE)
head(df)
lm1 <- stats::lm(log(counts) ~ dates.x, data = df)
lm1

## ----fit_model-----------------------------------------------------------
all.equal(f$model, lm1)

## ----make_info-----------------------------------------------------------
r <- stats::coef(lm1)["dates.x"]
r.conf <- stats::confint(lm1, "dates.x", 0.95)
new.data <- data.frame(dates.x = sort(unique(lm1$model$dates.x)))
pred     <- exp(stats::predict(lm1, newdata = new.data, interval = "confidence",
                               level = 0.95))
pred <- cbind.data.frame(new.data, pred)
info_list <- list(
  r = r,
  r.conf = r.conf,
  doubling = log(2) / r,
  doubling.conf = log(2) / r.conf,
  pred = pred
)
info_list

## ----combine-------------------------------------------------------------
origin <- min(get_dates(i2))
info_list$pred$dates <- origin + info_list$pred$dates.x
the_fit <- list(
  lm = lm1,
  info = info_list,
  origin = min(get_dates(i2))
)
class(the_fit) <- "incidence_fit"
the_fit
plot(i, fit = the_fit)

## ----nest----------------------------------------------------------------
l <- list(a = list(b = 1, c = 2),d = list(e = list(f = 3, g = 4), h = 5))
str(l)
l[[c("a", "b")]]
l[[c("d", "e", "f")]]

## ----incidence_fit_list--------------------------------------------------
fl <- fit_optim_split(i)
fl$fit
plot(i, fit = fl$fit)

## ----incidence_fit_list_str----------------------------------------------
str(fl$fit, max.level = 2)

## ----incidence_fit_methods-----------------------------------------------
methods(class = "incidence_fit_list")

## ----get_info_incidence_fit_list-----------------------------------------
get_info(fl$fit, "r")
get_info(fl$fit, "r.conf")

## ----get_doubling--------------------------------------------------------
get_info(fl$fit, "doubling.conf")
get_info(fl$fit, "doubling.conf", na.rm = FALSE)

## ----incidence_by_gender-------------------------------------------------
gen <- ebola_sim$linelist$gender
ig <- incidence(dat, interval = "week", group = gen)
plot(ig, border = "grey98")

## ----fit_gender----------------------------------------------------------
fg <- fit_optim_split(ig)
plot(ig, fit = fg$fit, border = "grey98", stack = FALSE)

## ----fit_gender_print----------------------------------------------------
fg$fit
str(fg$fit, max.level = 3)

## ----get_info_gender-----------------------------------------------------
get_info(fg$fit, "r.conf")

## ----get_fit-------------------------------------------------------------
str(get_fit(fg$fit), max.level = 2)

## ----incidence_fit_listify-----------------------------------------------
print(locs <- attributes(fg$fit)$locations)

for (i in seq_along(locs)) {
	locs[[i]] <- c("fit", locs[[i]])
}
print(locs)
fg.ifl <- fg
attributes(fg.ifl)$locations<- locs
class(fg.ifl) <- "incidence_fit_list"

## ----new_fit_list_print--------------------------------------------------
fg.ifl

## ----list_stuff----------------------------------------------------------
str(fg.ifl, max.level = 1)
fg.ifl$split
fg.ifl$df
fg.ifl$plot

