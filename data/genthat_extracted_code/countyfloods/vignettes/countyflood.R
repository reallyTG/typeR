## ----echo = FALSE--------------------------------------------------------
not_cran <- Sys.getenv("NOT_CRAN") == "true"
if (!not_cran) {
   knitr::opts_chunk$set(eval = FALSE)
    msg <- paste("Note: Examples in this vignette are set to not run on CRAN. If you would",
                 "like to build this vignette locally, you can do so by first setting the",
                 "environmental variable 'NOT_CRAN' to 'true' on your computer and then ",
                 "rebuilding the vignette.")
    msg <- paste(strwrap(msg), collapse="\n")
    message(msg)
}

## ----echo = FALSE--------------------------------------------------------
library(countyfloods)

## ------------------------------------------------------------------------
get_county_cd(state = c("Georgia", "Alabama"))

## ----message = FALSE-----------------------------------------------------
library(dplyr)
get_gages("12086", start_date = "1988-01-01", end_date = "2015-01-01") %>%
  slice(1:5)

## ----message = FALSE-----------------------------------------------------
va_gages <- get_county_cd("Virginia") %>%
   get_gages(start_date = "2015-01-01", end_date = "2015-12-31")
head(va_gages)

## ------------------------------------------------------------------------
southampton_gages <- get_gages("51175", start_date = "1999-01-01",
                                end_date = "1999-12-31")
southampton_data <- get_flow_data(southampton_gages, start_date = "1999-01-01",
                                  end_date = "1999-12-31")

## ------------------------------------------------------------------------
head(southampton_data)

## ----fig.width = 7, fig.height = 3.25------------------------------------
library(ggplot2)
ggplot(southampton_data, aes(x = date, y = discharge, color = site_no)) + 
  geom_line() + theme_classic() + 
  labs(y = "mean daily flow (cubic ft / s)", color = "gage site #")

## ------------------------------------------------------------------------
va_nws <- find_nws(site_no = va_gages$site_no, type = "moderate")
head(va_nws)
summary(va_nws$flood_val)

## ------------------------------------------------------------------------
va_q2 <- find_q2(site_no = va_gages$site_no)
head(va_q2)
summary(va_q2$flood_val)

## ----fig.width = 4.25, fig.height = 3.5, fig.align = "center"------------
va_flood_stage <- va_nws %>%
  rename(flood_nws = flood_val) %>%
  inner_join(va_q2, by = "site_no") %>%
  rename(flood_q2 = flood_val)
ggplot(va_flood_stage, aes(x = flood_q2, y = flood_nws)) + 
  geom_point(alpha = 0.5) + 
  geom_abline(aes(intercept = 0, slope = 1), linetype = 3) + 
  geom_smooth(method = "lm", se = FALSE) + 
  scale_x_log10(labels = scales::comma) + scale_y_log10(labels = scales::comma) + 
  labs(x = "Streamflow threshold for\nflood based on USGS Q2",
       y = "Streamflow threshold for flood based\non NWS flood height thresholds") + 
  theme_classic() + 
  expand_limits(x = c(min(va_flood_stage$flood_q2, va_flood_stage$flood_nws),
                      max(va_flood_stage$flood_q2, va_flood_stage$flood_nws)),
                y = c(min(va_flood_stage$flood_q2, va_flood_stage$flood_nws),
                      max(va_flood_stage$flood_q2, va_flood_stage$flood_nws)))

## ------------------------------------------------------------------------
southampton_q2 <- find_q2(site_no = southampton_gages$site_no)
southampton_data <- southampton_data %>% 
  left_join(southampton_q2, by = "site_no") %>% 
  select(-years) %>% 
  mutate(flood = discharge >= flood_val)
head(southampton_data)

## ----fig.width = 7, fig.height = 3.25------------------------------------
library(ggplot2)
ggplot(southampton_data, aes(x = date, y = discharge)) + 
  geom_line() + theme_classic() + 
  geom_point(aes(color = flood), alpha = 0.5, size = 1.2) + 
  facet_wrap(~ site_no, ncol = 1) +
  geom_hline(data = southampton_q2, aes(yintercept = flood_val),
             linetype = 3) +
  labs(y = "mean daily flow (cubic ft / s)", color = "Flood status")

## ------------------------------------------------------------------------
va_counties <- get_county_cd("Virginia")
va_flow_data <- get_flow_data(va_gages, start_date = "2015-01-01",
                              end_date = "2015-12-31")
va_floods <- flood_analysis(flow_data = va_flow_data, peaks = va_q2, 
                            gages = va_gages, county_cd = va_counties,
                            threshold = "Q2")
head(va_floods, 3)

## ----fig.width = 6, fig.height = 3.5, fig.align = "center", message = FALSE----
ggplot(va_floods, aes(x = max_peak, fill = flood)) + 
  geom_histogram()

## ------------------------------------------------------------------------
va_county_stats <- county_aggregates(flood_stats = va_floods)
head(va_county_stats)

## ----message = FALSE-----------------------------------------------------
va_floods <- run_flood(state = "Virginia", start_date = "2015-01-01",
                       end_date = "2015-12-31", threshold = "Q2",
                       output = "gage")
head(va_floods)

## ----message = FALSE-----------------------------------------------------
fl_floods <- run_flood(state = "Florida", start_date = "2004-01-01",
                       end_date = "2004-12-31", threshold = "Q2",
                       output = "county")
head(fl_floods)

## ----fig.width = 8, fig.height = 3.5, fig.align = "center", message = FALSE----
map_flood(va_floods) 

## ----fig.height = 3, fig.width = 4.5, fig.align = "center", message = FALSE----
map_flood(fl_floods)
map_flood(fl_floods, category = "major")

## ----message = FALSE-----------------------------------------------------
county_cd <- c(rep("51013", 5), rep("51107", 5), rep("51059", 5))
start_date <- rep(c("2010-04-01", "2011-04-01", "2012-04-01", "2013-04-01", "2014-04-01"), 3)
end_date <- rep(c("2010-04-30", "2011-04-30", "2012-04-30", "2013-04-30", "2014-04-30"), 3)
input_df <- data.frame(county_cd = county_cd, start_date = start_date, end_date = end_date, stringsAsFactors = FALSE)
head(input_df)

## ----message = FALSE-----------------------------------------------------
#With default values
va_floods <- long_term_flood(input_df)
va_gage_output <- va_floods[[1]]
head(va_gage_output)
va_county_output <- va_floods[[2]]
head(va_county_output)

## ----message = FALSE-----------------------------------------------------
va_time_series <- time_series_flood(state = "Virginia", start_date = "2010-01-01",
                      end_date = "2015-12-31", threshold = "NWS",
                      flood_type = "flood", weight = "Q2")
va_gage_output <- va_time_series[[1]]
head(va_gage_output)
va_county_output <- va_time_series[[2]]
head(va_county_output)

## ----fig.height = 6, fig.width = 8, fig.align = "center", message = FALSE----
time_series_plot(va_county_output[va_county_output$county == "halifax", ])

## ----eval = FALSE--------------------------------------------------------
#    tx <- time_series_flood(state = "Texas", start_date = "2017-08-24", end_date = "2017-09-10", filter_data = FALSE)
#    time_series_map(tx[[1]])

## ----fig.width = 4.25, fig.height = 3.5, fig.align = "center"------------
ggplot(va_gage_output, aes(x = DA, y = Q2)) + 
  geom_point(alpha = 0.5) + 
  geom_abline(aes(intercept = 0, slope = 1), linetype = 3) + 
  geom_smooth(method = "lm", se = FALSE) + 
  scale_x_log10(labels = scales::comma) + scale_y_log10(labels = scales::comma) + 
  labs(x = "Gage Drainage Area",
       y = "Gage Q2") + 
  theme_classic() + 
  expand_limits(x = c(min(va_gage_output$Q2, va_gage_output$DA),
                      max(va_gage_output$Q2, va_gage_output$DA)),
                y = c(min(va_gage_output$Q2, va_gage_output$DA),
                      max(va_gage_output$Q2, va_gage_output$DA)))

## ----fig.width = 6, fig.height = 3.5, fig.align = "center", message = FALSE----
va_county_output2 <- time_series_flood(state = "Virginia", start_date = "2010-01-01",
                      end_date = "2015-12-31", threshold = "NWS",
                      flood_type = "flood", weight = "DA")[[2]]

ggplot() + 
  geom_histogram(data = va_county_output, aes(x = flood_metric, fill = "Q2"), binwidth = 0.03) +
  geom_histogram(data = va_county_output2, aes(x = flood_metric, y = - ..count.., fill = "DA"), binwidth = 0.03)


## ----fig.width = 7.5, fig.height = 2.75, fig.align = "center", message = FALSE----
nc_floods <- run_flood(state = "North Carolina", start_date = "1999-09-15",
                       end_date = "1999-10-15", threshold = "Q2",
                       output = "both")
nc_maps <- map_flood(nc_floods)
nc_maps[[1]]
nc_maps[[2]]

## ----fig.width = 7.5, fig.height = 4, fig.align = "center", message = FALSE----
library(hurricaneexposure)
map_tracks(storms = "Floyd-1999", plot_object = nc_maps[[2]])

## ----fig.height = 3, fig.width = 4.25, fig.align = "center", message = FALSE----
map_tracks(storms = c("Bonnie-2004", "Charley-2004", 
                      "Frances-2004", "Jeanne-2004"), 
           plot_object = map_flood(fl_floods, category = "major"),
           color = "aquamarine3")

