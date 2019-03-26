## ----echo=TRUE,message=FALSE,warning=FALSE-------------------------------
library(tstools)
data(KOF)
short <- window(KOF$kofbarometer,
                start=c(2007,1),
                end=c(2014,1))

# list of time series
ts1 <- ts(runif(40,-10,40),start=c(1995,1),freq=4)
ts2 <- ts(runif(80,0,50),start=c(2000,1),freq=12)

tslist <- list()
tslist$ts1 <- ts1
tslist$ts2 <- ts2

# data for stacked bar charts... 
tsb1 <- ts(runif(30, -30, 20), start = c(2010, 1), frequency = 4)
tsb2 <- ts(runif(30, 0, 50), start = c(2010, 1), frequency = 4)
tsb3 <- ts(runif(30, 0, 50), start = c(2010, 1), frequency = 4)


min_series <- ts(runif(10,-10,40),start=c(1995,1),freq=4)
min_series_2 <- ts(runif(25,-20,40),start=c(1995,1),freq=12)

min_series_3 <- ts(runif(25,-20,40),start=c(1995,1),freq=4)



min_li <- list(series1 = min_series,
               series2 = min_series_2,
               series3 = min_series_3)


missings <- ts(c(1,2,10,3,5,6,NA,NA,3,2,5,3,1,1),
               start=c(1995,1),freq=4)




## ----fig.width = 7,fig.height=6,message=FALSE----------------------------
tsplot(short)

## ----fig.width = 7,fig.height=6------------------------------------------
tsplot(ts1,ts2,auto_legend=F)

## ----fig.width = 7,fig.height=6------------------------------------------
tsplot(tslist,auto_legend=F)

## ----fig.width = 7,fig.height=6------------------------------------------
tsplot(list("Time Series 1" = ts1,
            "Time Series 2" = ts2))

## ------------------------------------------------------------------------
tsplot(short,
       theme = init_tsplot_theme(y_tick_margin = .7))

## ------------------------------------------------------------------------
tsplot(KOF['kofbarometer'],
       manual_value_ticks_l = seq(60,120,by=20))


## ----fig.width = 7,fig.height=6------------------------------------------
# Define confidence intervals
ci <- list(
  "KOF Barometer" = list(
    "80" = list(
      lb = KOF$baro_lo_80,
      ub = KOF$baro_hi_80),
    "95" = list(
      lb = KOF$baro_lo_95,
      ub = KOF$baro_hi_95
    )))

tsplot(list("KOF Barometer" = KOF$baro_point_fc),
       ci = ci)

## ----fig.width = 7,fig.height=6------------------------------------------
tsplot(tsb1, tsb2, tsb3,
       left_as_bar = T,
       auto_legend = F,
       theme = init_tsplot_theme(bar_gap = 10))

## ----fig.width = 7,fig.height=6------------------------------------------
tsl <- list(tsb1,tsb2,tsb3)
tsplot(tsl,left_as_bar = T,
       manual_value_ticks_l = seq(-40,100, by = 20),
       auto_legend = F,
       theme = init_tsplot_theme(sum_as_line = T))

## ----fig.width = 7,fig.height=6------------------------------------------
tsb1 <- ts(runif(30,-30,20),start=c(2010,1),frequency = 4)
tsb2 <- ts(runif(30,0,50),start=c(2010,1),frequency = 4)
tsb3 <- ts(runif(30,0,50),start=c(2010,1),frequency = 4)
tsb4 <- ts(runif(30,-40,10),start=c(2005,1),frequency = 4)
tsplot(tsb1, tsb2, tsb3, tsb4,
       left_as_bar = T,
       auto_legend = F)

## ----fig.width = 7,fig.height=6------------------------------------------
tsb1 <- ts(runif(20,-30,20),start=c(2010,1),frequency = 12)
tsb2 <- ts(runif(20,0,50),start=c(2010,1),frequency = 12)
tsb3 <- ts(runif(20,0,50),start=c(2010,1),frequency = 12)
tsplot(tsb1, tsb2, tsb3,
       left_as_bar = T,
       group_bar_chart = T,
       auto_legend = F)

## ----fig.width = 7,fig.height=6------------------------------------------
set.seed(123)
tslist <- generate_random_ts(4, starts = 1987:1990,
                             ranges_min = 1,
                             ranges_max = 3)
tsplot(tslist, left_as_band = TRUE)

## ----fig.width = 7,fig.height=6------------------------------------------
data(KOF)
tsplot(KOF$kofbarometer,
       tsr = KOF$reference,auto_legend=F)

## ----fig.width = 7,fig.height=6------------------------------------------
tsb1 <- ts(runif(30,-30,20),start=c(2010,1),frequency = 4)
tsb2 <- ts(runif(30,0,30),start=c(2010,1),frequency = 4)
tsb3 <- ts(runif(30,0,30),start=c(2010,1),frequency = 4)
tsr1 <- ts(runif(30,-4,6),start=c(2010,1),frequency = 4)
tsplot(tsb1, tsb2, tsb3,
       tsr=tsr1,
       left_as_bar = T,
       auto_legend=F)



## ------------------------------------------------------------------------
def_theme <- init_tsplot_theme()
names(def_theme)

## ----fig.width = 7,fig.height=6------------------------------------------
tsplot(tsb1, tsb2, tsb3,
       left_as_bar = T,
       theme = init_tsplot_theme(highlight_window = T))

## ----fig.width = 7,fig.height=6------------------------------------------
tt <- init_tsplot_theme(use_box = T)
tsplot(tsb1,tsb2,tsb3,tsr=tsr1,
       left_as_bar = T,
       theme = tt)

## ----fig.width = 7,fig.height=6------------------------------------------
tt$lty <- c(3,2,1)
tsplot(tsb1,tsb2,tsb3,
       theme = tt)

## ----fig.width = 7,fig.height=6------------------------------------------
nt <- init_tsplot_theme(highlight_window = T)
nt$highlight_window_start <- c(2017,1)
nt$highlight_window_end <- c(2018,1)
tsplot(tsb1,tsb2,
       theme = nt)


## ----fig.width = 7,fig.height=6,echo=TRUE--------------------------------
tsplot(missings,
       theme = init_tsplot_theme(NA_continue_line = T,
                                 show_points = T))

## ----fig.width = 7,fig.height=6,echo=TRUE--------------------------------
tsplot(ts2)


## ----fig.width = 7,fig.height=6,echo=TRUE--------------------------------
tsplot(ts2,
       theme = init_tsplot_theme(fill_year_with_nas = F))


## ----fig.width = 7,fig.height=6,echo=TRUE--------------------------------
tsplot("An arbitrary ts object" = ts1,
       "another ts object" = ts2)

## ----echo=TRUE-----------------------------------------------------------
names(tslist)

## ----fig.width = 7,fig.height=6,echo=TRUE--------------------------------
tsplot(tslist)

## ----fig.width = 7,fig.height=6,echo=TRUE--------------------------------
tsplot(min_li,
       theme = init_tsplot_theme(legend_col = 2))

## ----fig.width = 7,fig.height=6,echo=TRUE--------------------------------
tsplot(KOF['kofbarometer'],
       tsr = KOF['reference'])


## ----fig.width = 7,fig.height=6,echo=TRUE--------------------------------
tsplot(KOF['kofbarometer'],
tsr = list('reference (right scale)' = KOF$reference),
theme = init_tsplot_theme(legend_all_left = TRUE))


## ----fig.width = 7,fig.height=6,echo=TRUE--------------------------------
tsplot("Some like\n loooong legends\n with so many words" = ts1)


## ----fig.width = 7,fig.height=6,echo=TRUE--------------------------------
tsplot(KOF[1],auto_legend = F)

## ----eval=FALSE----------------------------------------------------------
#  tsplot(KOF[1],
#         output_format = "pdf",
#         theme = init_tsplot_print_theme(output_wide = T))

## ----eval=FALSE----------------------------------------------------------
#  data(KOF)
#  write_ts(KOF,file.path(tempdir(),"test_export"),"csv")

## ----eval=FALSE----------------------------------------------------------
#  write_ts(KOF,file.path(tempdir(),"test_export_wide_trans"),
#           "csv",
#           wide = T,
#           transpose = T)

## ----eval=F,echo=T-------------------------------------------------------
#  init_tsplot_theme(legend_all_left = T,
#                    legend_col = 1)

## ----eval=F,echo=T-------------------------------------------------------
#  init_tsplot_theme(band_fill_color = c("#FF0000","#00FF00"),
#                    line_colors = c("#FF0000","#00FF00"),
#                    bar_fill_color = c("#FF0000","#00FF00"))

