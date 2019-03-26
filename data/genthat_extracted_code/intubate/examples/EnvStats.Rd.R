library(intubate)


### Name: EnvStats
### Title: Interfaces for EnvStats package for data science pipelines.
### Aliases: ntbt_gofTest ntbt_gofGroupTest ntbt_kendallSeasonalTrendTest
###   ntbt_kendallTrendTest ntbt_stripChart ntbt_summaryFull
###   ntbt_summaryStats ntbt_varGroupTest
### Keywords: intubate magrittr EnvStats ntbt_gofTest ntbt_gofGroupTest
###   ntbt_kendallSeasonalTrendTest ntbt_kendallTrendTest ntbt_stripChart
###   ntbt_summaryFull ntbt_summaryStats ntbt_varGroupTest

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(EnvStats)
##D 
##D 
##D ## ntbt_calibrate: Fit a Calibration Line or Curve
##D #Cadmium <- EPA.97.cadmium.111.df$Cadmium 
##D #Spike <- EPA.97.cadmium.111.df$Spike 
##D data(EPA.97.cadmium.111.df)
##D ## Original function to interface
##D calibrate(Cadmium ~ Spike, data = EPA.97.cadmium.111.df) 
##D 
##D ## NOTE: --check-as-cran does not like having an attach()
##D ##       in the code, which is needed to interface
##D ##       calibrate (at least for now). I will get back
##D ##       to this after 0.99.3 is submitted. Please do not
##D ##       report as bug (instead please find a solution to this!)
##D 
##D ## The interface puts data as first parameter
##D #ntbt_calibrate(EPA.97.cadmium.111.df, Cadmium ~ Spike)
##D 
##D ## so it can be used easily in a pipeline.
##D #EPA.97.cadmium.111.df %>%
##D #  ntbt_calibrate(Cadmium ~ Spike) 
##D 
##D 
##D ## ntbt_gofGroupTest: Goodness-of-Fit Test for a Specified Probability
##D ##                    Distribution for Groups
##D ## Original function to interface
##D gofGroupTest(Nickel.ppb ~ Well, data = EPA.09.Ex.10.1.nickel.df)
##D 
##D ## The interface puts data as first parameter
##D ntbt_gofGroupTest(EPA.09.Ex.10.1.nickel.df, Nickel.ppb ~ Well)
##D 
##D ## so it can be used easily in a pipeline.
##D EPA.09.Ex.10.1.nickel.df %>%
##D   ntbt_gofGroupTest(Nickel.ppb ~ Well)
##D 
##D ## ntbt_gofTest: Goodness-of-Fit Test
##D ## Original function to interface
##D gofTest(Nickel.ppb ~ 1, data = EPA.09.Ex.10.1.nickel.df)
##D 
##D ## The interface puts data as first parameter
##D ntbt_gofTest(EPA.09.Ex.10.1.nickel.df, Nickel.ppb ~ 1)
##D 
##D ## so it can be used easily in a pipeline.
##D EPA.09.Ex.10.1.nickel.df %>%
##D   ntbt_gofTest(Nickel.ppb ~ 1)
##D 
##D 
##D ## ntbt_kendallSeasonalTrendTest: Nonparametric Test for Monotonic Trend Within
##D ##                                Each Season Based on Kendall's Tau Statistic
##D ## Original function to interface
##D kendallSeasonalTrendTest(Unadj.Conc ~ Month + Year, data = EPA.09.Ex.14.8.df)
##D 
##D ## The interface puts data as first parameter
##D ntbt_kendallSeasonalTrendTest(EPA.09.Ex.14.8.df, Unadj.Conc ~ Month + Year)
##D 
##D ## so it can be used easily in a pipeline.
##D EPA.09.Ex.14.8.df %>%
##D   ntbt_kendallSeasonalTrendTest(Unadj.Conc ~ Month + Year)
##D 
##D 
##D ## ntbt_kendallTrendTest: Kendall's Nonparametric Test for Montonic Trend
##D ## Original function to interface
##D kendallTrendTest(Sulfate.ppm ~ Sampling.Date, data = EPA.09.Ex.17.6.sulfate.df)
##D 
##D ## The interface puts data as first parameter
##D ntbt_kendallTrendTest(EPA.09.Ex.17.6.sulfate.df, Sulfate.ppm ~ Sampling.Date)
##D 
##D ## so it can be used easily in a pipeline.
##D EPA.09.Ex.17.6.sulfate.df %>%
##D   ntbt_kendallTrendTest(Sulfate.ppm ~ Sampling.Date)
##D 
##D 
##D ## ntbt_stripChart: 1-D Scatter Plots with Confidence Intervals
##D ## Original function to interface
##D stripChart(TcCB ~ Area, data = EPA.94b.tccb.df, col = c("red", "blue"), 
##D            p.value = TRUE, ci.and.test = "nonparametric", 
##D            ylab = "TcCB (ppb)")
##D 
##D ## The interface puts data as first parameter
##D ntbt_stripChart(EPA.94b.tccb.df, TcCB ~ Area, col = c("red", "blue"), 
##D                 p.value = TRUE, ci.and.test = "nonparametric", 
##D                 ylab = "TcCBntbt_summaryFull (ppb)")
##D 
##D ## so it can be used easily in a pipeline.
##D EPA.94b.tccb.df %>%
##D   ntbt_stripChart(TcCB ~ Area, col = c("red", "blue"), 
##D                   p.value = TRUE, ci.and.test = "nonparametric", 
##D                   ylab = "TcCB (ppb)")
##D 
##D 
##D ## ntbt_summaryFull: Full Complement of Summary Statistics
##D ## Original function to interface
##D summaryFull(TcCB ~ Area, data = EPA.94b.tccb.df)
##D 
##D ## The interface puts data as first parameter
##D ntbt_summaryFull(EPA.94b.tccb.df, TcCB ~ Area)
##D 
##D ## so it can be used easily in a pipeline.
##D EPA.94b.tccb.df %>%
##D   ntbt_summaryFull(TcCB ~ Area)
##D 
##D 
##D ## ntbt_summaryStats: Summary Statistics
##D ## Original function to interface
##D summaryStats(log10(TcCB) ~ Area, data = EPA.94b.tccb.df)
##D 
##D ## The interface puts data as first parameter
##D ntbt_summaryStats(EPA.94b.tccb.df, log10(TcCB) ~ Area)
##D 
##D ## so it can be used easily in a pipeline.
##D EPA.94b.tccb.df %>%
##D   ntbt_summaryStats(log10(TcCB) ~ Area)
##D 
##D 
##D ## ntbt_varGroupTest: Test for Homogeneity of Variance Among Two or More Groups
##D ## Original function to interface
##D varGroupTest(Arsenic.ppb ~ Well, data = EPA.09.Ex.11.1.arsenic.df)
##D 
##D ## The interface puts data as first parameter
##D ntbt_varGroupTest(EPA.09.Ex.11.1.arsenic.df, Arsenic.ppb ~ Well)
##D 
##D ## so it can be used easily in a pipeline.
##D EPA.09.Ex.11.1.arsenic.df %>%
##D   ntbt_varGroupTest(Arsenic.ppb ~ Well)
## End(Not run)



