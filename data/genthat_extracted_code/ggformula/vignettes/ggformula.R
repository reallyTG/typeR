## ----setup, include = FALSE----------------------------------------------
have_packages <-
  require(ggformula) &&
  require(dplyr) &&
  require(ggplot2) &&
  require(mosaicData) &&
  require(maps) &&
  requireNamespace("mosaicModel") &&
  requireNamespace("mosaic") 
  

knitr::opts_chunk$set(
  fig.show = "hold",
  fig.align = "center",
  out.width = "45%",
  eval = have_packages
)
theme_set(theme_light())

## ---- eval = ! have_packages, echo = FALSE, results = 'asis'-------------
#  cat(
#  "
#  ## Warning: Missing packages
#  
#  Because one or more of
#  `ggformula`, `ggplot2`, `dplyr`, `mosaic`, `mosaicData`, `mosaicModel`,
#  and `maps`, appears to be missing, this vignette is compiling
#  without executing any code.
#  
#  "
#  )

## ---- plottype, eval = FALSE---------------------------------------------
#  gf_plottype(formula, data = mydata)

## ---- simple-example-----------------------------------------------------
library(ggformula)
gf_point(mpg ~ hp, data = mtcars)

## ---- mapping-setting----------------------------------------------------
gf_point(mpg ~ hp, color = ~ cyl, size = ~ carb, alpha = 0.50, data = mtcars) 

## ---- on-the-fly---------------------------------------------------------
library(dplyr)
gf_point(mpg ~ hp,  color = ~ factor(cyl), size = ~ carb, alpha = 0.75, data = mtcars)
gf_point(mpg ~ hp,  color = ~ cylinders, size = ~ carb, alpha = 0.75, 
         data = mtcars %>% mutate(cylinders = factor(cyl)))

## ----Runners, fig.show = "hold", out.width = "30%", warning=FALSE--------
data(Runners, package = "mosaicModel")
Runners <- Runners %>% filter( ! is.na(net))
gf_density( ~ net, data = Runners)
gf_density( ~ net,  fill = ~ sex,  alpha = 0.5, data = Runners)
# gf_dens() is similar, but there is no line at bottom/sides, and it is not "fillable"
gf_dens( ~ net, color = ~ sex, alpha = 0.7, data = Runners)    

## ---- dens---------------------------------------------------------------
# less smoothing
gf_dens( ~ net, color = ~ sex, alpha = 0.7, data = Runners, adjust = 0.25)  
# more smoothing
gf_dens( ~ net, color = ~ sex, alpha = 0.7, data = Runners, adjust = 4)     

## ----position, fig.show = "hold", warning=FALSE--------------------------
gf_density( ~ net, fill = ~ sex, color = NA, position = "stack", data = Runners)
gf_density( ~ net, fill = ~ sex, color = NA, position = "fill", data = Runners, adjust = 2)

## ----facets, fig.show = "hold", warning=FALSE----------------------------
gf_density_2d(net ~ age, data = Runners) %>% gf_facet_grid( ~ sex)
# the dot here is a bit strange, but required to make a valid formula
gf_density_2d(net ~ age, data = Runners) %>% gf_facet_grid( sex ~ .)
gf_density_2d(net ~ age, data = Runners) %>% gf_facet_wrap( ~ year)
gf_density_2d(net ~ age, data = Runners) %>% gf_facet_grid(start_position ~ sex)

## ---- facets02, out.width = "95%", fig.width = 6, fig.height = 3.5-------

gf_ribbon(low_temp + high_temp ~ date | city ~ year, data = Weather, alpha = 0.3) 

gf_linerange(low_temp + high_temp ~ date | city ~ year, color = ~ avg_temp, data = Weather) %>%
  gf_refine(scale_colour_gradientn(colors = rev(rainbow(5))))

## ---- facets03, out.width = "95%", fig.width = 6, fig.height = 3.5-------

gf_ribbon(low_temp + high_temp ~ date | city ~ ., data = Weather, alpha = 0.3) 

gf_linerange(low_temp + high_temp ~ date, color = ~ avg_temp, data = Weather) %>%
  gf_refine(scale_colour_gradientn(colors = rev(rainbow(5)))) %>%
  gf_facet_grid(city ~ year, scales = "free_x")

## ---- jitter-------------------------------------------------------------
gf_point(age ~ sex, alpha = 0.05, data = Runners)
gf_jitter(age ~ sex, alpha = 0.05, data = Runners)

## ----boxplot, fig.show = "hold", warning = FALSE-------------------------
gf_boxplot(net ~ sex, color = "red", data = Runners)
gf_boxplot(net ~ sex, color = ~ start_position, data = Runners)

## ---- boxplot02----------------------------------------------------------
gf_boxplot(net ~ year, data = Runners)

## ---- boxplot03----------------------------------------------------------
gf_boxplot(net ~ year, group = ~ year, data = Runners)

## ---- factors, fig.keep = 1, fig.width = 5, echo = TRUE------------------
# add a new variable to the data
Runners$the_year <- as.character(Runners$year)               # in base R
Runners <- Runners %>% mutate(the_year = as.character(year)) # in dplyr
gf_boxplot(net ~ the_year, color = ~ sex, data = Runners)

# or do it on the fly
gf_boxplot(net ~ factor(year), color = ~ sex, data = Runners)

## ----density2d-hex, fig.show = "hold"------------------------------------
gf_density_2d(net ~ age, data = Runners)
gf_hex(net ~ age, data = Runners)

## ---- births01-----------------------------------------------------------
library(mosaicData)
gf_point(births ~ date, data = Births78)

## ---- births03-----------------------------------------------------------
gf_line(births ~ date, color = ~ wday, data = Births78)

## ----paths, fig.show = "hold", out.width = "30%"-------------------------
Weather %>%
  filter(month == 5, year == 2017, city == "Chicago") %>%
  gf_path(high_temp ~ low_temp | city ~ year, color = ~ day) %>%
  gf_refine(scale_color_viridis_c(option = "C", begin = 0.2, end = 0.8))
Weather %>%
  filter(month == 5, year == 2017, city == "Chicago") %>%
  gf_line(high_temp ~ low_temp | city ~ year, color = ~ day) %>%
  gf_refine(scale_color_viridis_c(option = "C", begin = 0.2, end = 0.8))

## ---- weather------------------------------------------------------------
Temps <-
  Weather %>%
  filter(month <= 4, year <= 2016, city == "Chicago")

gf_pointrange(avg_temp + low_temp + high_temp  ~ date, color = ~ avg_temp, data = Temps) %>%
    gf_refine(scale_color_gradientn(colors = c("blue", "green", "orange", "red")))

gf_ribbon(low_temp + high_temp  ~ date, color = "navy", alpha = 0.3, data = Temps)

## ---- KidsFeet-----------------------------------------------------------
gf_point(length ~ sex, color = ~ domhand, data = KidsFeet,
         position = position_jitterdodge(jitter.width = 0.2, dodge.width = 0.4))

## ---- stats--------------------------------------------------------------
gf_bar( ~ age, data = HELPrct, stat = "bin")

## ------------------------------------------------------------------------
gf_point(length ~ width, data = KidsFeet, color = ~ sex) %>%
  gf_lm()
gf_point(births ~ date, color = ~wday,
         data = mosaicData::Births, alpha = 0.25) %>%
  gf_smooth()

## ------------------------------------------------------------------------
gf_point(length ~ width | sex, data = KidsFeet, color = ~ sex) %>%
  gf_lm(interval = "prediction", fill = "red") %>%
  gf_lm(interval = "confidence", fill = "navy")

## ---- stats02------------------------------------------------------------
gf_jitter(length ~ sex, color = ~ domhand, data = KidsFeet,
          width = 0.1, height = 0) %>%
  gf_line(length ~ sex, color = ~ domhand, data = KidsFeet,
          group = ~ domhand, stat="summary")

## ---- stats03, eval = utils::packageVersion("ggplot2") > "2.2.1"---------
gf_jitter(length ~ sex, color = ~ domhand, data = KidsFeet,
          width = 0.1, height = 0, alpha = 0.3) %>%
  gf_pointrange(length + stat(ymin) + stat(ymax) ~ sex, 
                color = ~ domhand, data = KidsFeet, 
                group = ~ domhand, stat="summary")

## ---- stats04, eval = utils::packageVersion("ggplot2") > "2.2.1"---------
gf_point(length ~ sex, color = ~ domhand, data = KidsFeet,
          width = 0.1, height = 0, alpha = 0.5,
          position = position_jitterdodge(jitter.width = 0.2, dodge.width = 0.3)) %>%
  gf_pointrange(length + stat(ymin) + stat(ymax) ~ sex, 
                color = ~ domhand, data = KidsFeet, 
                group = ~ domhand, stat="summary",
                fun.y = median, fun.ymin = min, fun.ymax = max,
                position = position_dodge(width = 0.6))

## ---- functions----------------------------------------------------------
gf_function(fun = sqrt, xlim = c(0, 10)) %>%
  gf_fun(2 + 3 * cos(10 * x) ~ x, color = "red", n = 800)
f <- makeFun(lm(totalbill ~ poly(month, 2), data = mosaicData::Utilities))
gf_point(totalbill ~ month, data = mosaicData::Utilities, alpha = 0.6) %>%
  gf_fun(f(m) ~ m, color = "red")

## ---- layers-------------------------------------------------------------
gf_histogram( ~ age, data = Runners, alpha = 0.3, fill = "navy") %>%
  gf_freqpoly( ~ age)

## ---- layers02-----------------------------------------------------------
gf_density_2d(net ~ age, data = Runners) %>%
  gf_point(net ~ age, alpha = 0.01) 

## ---- fig.width = 6, fig.height = 3, out.width = "75%"-------------------
if (require(maps) && require(dplyr)) {
  US <- map_data("state") %>%
    dplyr::mutate(name_length = nchar(region))
  States <- US %>%
    dplyr::group_by(region) %>%
    dplyr::summarise(lat = mean(range(lat)), long = mean(range(long))) %>%
    dplyr::mutate(name = abbreviate(region, 3))

  gf_polygon(lat ~ long, data = US, group = ~ group,
             fill = ~ name_length, color = "white") %>%
  gf_text(lat ~ long, label = ~ name, data = States,
    color = "gray70", inherit = FALSE) %>%
  gf_refine(mosaic::theme_map())
}

## ---- fig.width = 6, fig.height = 3, out.width = "75%"-------------------
if (require(maps) && require(dplyr) && require(sf) && require(purrr)) {
  USshape <- 
    sf::st_as_sf(maps::map('state', plot = FALSE, fill = TRUE)) %>%
    dplyr::mutate(
      name_length = nchar(ID),
      centroid = purrr::map(geometry, st_centroid),
      coords_x = purrr::map_dbl(centroid, 1),
      coords_y = purrr::map_dbl(centroid, 2)
    ) 
    
  gf_sf(fill = ~ factor(name_length), color = "white", data = USshape, alpha = 0.5) %>%
    gf_sf(data = sf::st_centroid(USshape), color = "white", alpha = 0.5, size = 3) %>%
    gf_text(coords_y ~ coords_x, label = ~ ID, color = "gray20", size = 2) %>%
    gf_labs(x = "", y = "") %>%
    gf_refine(mosaic::theme_map(), theme_bw()) %>%
    gf_labs(fill = "name length")
}

## ------------------------------------------------------------------------
gf_ash( ~ age, data = HELPrct, binwidth = 2) %>%
  gf_dhistogram( ~ age, data = HELPrct, binwidth = 2, alpha = 0.3) 
gf_ash( ~ age, data = HELPrct, binwidth = 10) %>% 
  gf_dhistogram( ~ age, data = HELPrct, binwidth = 2, alpha = 0.3) 

## ------------------------------------------------------------------------
gf_dist("pois", lambda = 5)
gf_dist("pois", lambda = 5, kind = "cdf")
gf_dist("gamma", shape = 3, rate = 4, geom = "area")
gf_dist("gamma", shape = 3, rate = 4, geom = "area", fill = ~ (x <= 1))
gf_dist("gamma", shape = 3, rate = 4, kind = "cdf")

## ------------------------------------------------------------------------
# size is used by the binomial distribution functions and when plotting
gf_dist("binom", size = 20, prob = 0.25, plot_size = 3)
gf_dist("binom", params = list(size = 20, prob = 0.25), size = 3)

## ------------------------------------------------------------------------
x <- rgamma(1000, shape = 2, rate = 5)
gf_dhistogram( ~ x, alpha = 0.3) %>%
  gf_fitdistr(dist = "dnorm", color = ~ "Normal") %>% 
  gf_fitdistr(dist = "dgamma", color = ~ "Gamma") %>%
  gf_fitdistr(dist = "dweibull", color = ~ "Weibull")

## ---- themes-------------------------------------------------------------
gf_histogram( ~ age, data = Runners, alpha = 0.2, fill = "navy",
              binwidth = 5) %>%
  gf_freqpoly( ~ age, binwidth = 5) %>%
  gf_labs(x = "age (years)", title = "Age of runners") %>%
  gf_lims(x = c(20, 80)) %>%
  gf_theme(theme = theme_minimal())

gf_histogram( ~ age, data = Runners, alpha = 0.5, fill = "white",
              binwidth = 5) %>%
  gf_freqpoly( ~ age, color = "skyblue", binwidth = 5, size = 1.5) %>%
  gf_labs(x = "age (years)", title = "Age of runners") %>%
  gf_lims(x = c(20, 80)) %>%
  gf_theme(theme = theme_dark())

## ------------------------------------------------------------------------
gf_histogram( ~ age, data = Runners, alpha = 0.5, fill = "skyblue", color = "navy",
              binwidth = 5, 
              xlab = "age (years)", title = "Age of runners"
              ) 

