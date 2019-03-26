library(EnvStats)


### Name: ppointsCensored
### Title: Plotting Positions for Type I Censored Data
### Aliases: ppointsCensored
### Keywords: distribution dplot

### ** Examples

  # Generate 20 observations from a normal distribution with mean=20 and sd=5, 
  # censor all observations less than 18, then compute plotting positions for 
  # this data set.  Compare the plotting positions to the plotting positions 
  # for the uncensored data set.  Note that the plotting positions for the 
  # censored data set start at the first ordered uncensored observation and 
  # that for values of x > 18 the plotting positions for the two data sets are 
  # exactly the same. This is because there is only one censoring level and 
  # no uncensored observations fall below the censored observations. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(333) 
  x <- rnorm(20, mean=20, sd=5) 
  censored <- x < 18 
  censored 
  # [1] FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE
  #[13] FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE

  sum(censored) 
  #[1] 7 

  new.x <- x 
  new.x[censored] <- 18 
  round(sort(new.x),1) 
  # [1] 18.0 18.0 18.0 18.0 18.0 18.0 18.0 18.1 18.7 19.6 20.2 20.3 20.6 21.4
  #[15] 21.8 21.8 23.2 26.2 26.8 29.7

  p.list <- ppointsCensored(new.x, censored) 
  p.list 
  #$Order.Statistics
  # [1] 18.00000 18.00000 18.00000 18.00000 18.00000 18.00000 18.00000 18.09771
  # [9] 18.65418 19.58594 20.21931 20.26851 20.55296 21.38869 21.76359 21.82364
  #[17] 23.16804 26.16527 26.84336 29.67340
  #
  #$Cumulative.Probabilities
  # [1] 0.3765432 0.3765432 0.3765432 0.3765432 0.3765432 0.3765432 0.3765432
  # [8] 0.3765432 0.4259259 0.4753086 0.5246914 0.5740741 0.6234568 0.6728395
  #[15] 0.7222222 0.7716049 0.8209877 0.8703704 0.9197531 0.9691358
  #
  #$Censored
  # [1]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
  #[13] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  #
  #$Censoring.Side
  #[1] "left"
  #
  #$Prob.Method
  #[1] "michael-schucany"
  #
  #$Plot.Pos.Con
  #[1] 0.375

  #----------

  # Round off plotting positions to two decimal places 
  # and compare to plotting positions that ignore censoring
  #--------------------------------------------------------

  round(p.list$Cum, 2) 
  # [1] 0.38 0.38 0.38 0.38 0.38 0.38 0.38 0.38 0.43 0.48 0.52 0.57 0.62 0.67
  #[15] 0.72 0.77 0.82 0.87 0.92 0.97

  round(ppoints(x, a=0.375), 2) 
  # [1] 0.03 0.08 0.13 0.18 0.23 0.28 0.33 0.38 0.43 0.48 0.52 0.57 0.62 0.67
  #[15] 0.72 0.77 0.82 0.87 0.92 0.97

  #----------

  # Clean up
  #---------
  rm(x, censored, new.x, p.list)

  #----------------------------------------------------------------------------

  # Reproduce the example in Appendix B of Helsel and Cohn (1988).  The data 
  # are stored in Helsel.Cohn.88.appb.df.  This data frame contains 18 
  # observations, of which 9 are censored below one of 2 distinct censoring 
  # levels.

  Helsel.Cohn.88.app.b.df
  #   Conc.orig Conc Censored
  #1         <1    1     TRUE
  #2         <1    1     TRUE
  #...
  #17        33   33    FALSE
  #18        50   50    FALSE

  p.list <- with(Helsel.Cohn.88.app.b.df, 
    ppointsCensored(Conc, Censored, prob.method="hirsch-stedinger", plot.pos.con=0)) 
  lapply(p.list[1:2], round, 3) 
  #$Order.Statistics
  # [1]  1  1  1  1  1  1  3  7  9 10 10 10 12 15 20 27 33 50
  #
  #$Cumulative.Probabilities
  # [1] 0.063 0.127 0.190 0.254 0.317 0.381 0.500 0.556 0.611 0.167 0.333 0.500
  #[13] 0.714 0.762 0.810 0.857 0.905 0.952

  # Clean up
  #---------
  rm(p.list)

  #----------------------------------------------------------------------------

  # Example 15-1 of USEPA (2009, page 15-10) gives an example of
  # computing plotting positions based on censored manganese 
  # concentrations (ppb) in groundwater collected at 5 monitoring
  # wells.  The data for this example are stored in 
  # EPA.09.Ex.15.1.manganese.df.

  EPA.09.Ex.15.1.manganese.df
  #   Sample   Well Manganese.Orig.ppb Manganese.ppb Censored
  #1       1 Well.1                 <5           5.0     TRUE
  #2       2 Well.1               12.1          12.1    FALSE
  #3       3 Well.1               16.9          16.9    FALSE
  #4       4 Well.1               21.6          21.6    FALSE
  #5       5 Well.1                 <2           2.0     TRUE
  #...
  #21      1 Well.5               17.9          17.9    FALSE
  #22      2 Well.5               22.7          22.7    FALSE
  #23      3 Well.5                3.3           3.3    FALSE
  #24      4 Well.5                8.4           8.4    FALSE
  #25      5 Well.5                 <2           2.0     TRUE
  
  p.list.EPA <- with(EPA.09.Ex.15.1.manganese.df, 
    ppointsCensored(Manganese.ppb, Censored, 
      prob.method = "kaplan-meier"))
  data.frame(Mn = p.list.EPA$Order.Statistics, Censored = p.list.EPA$Censored, 
    CDF = p.list.EPA$Cumulative.Probabilities)
  #      Mn Censored  CDF
  #1    2.0     TRUE 0.21
  #2    2.0     TRUE 0.21
  #3    2.0     TRUE 0.21
  #4    3.3    FALSE 0.28
  #5    5.0     TRUE 0.28
  #6    5.0     TRUE 0.28
  #7    5.0     TRUE 0.28
  #8    5.3    FALSE 0.32
  #9    6.3    FALSE 0.36
  #10   7.7    FALSE 0.40
  #11   8.4    FALSE 0.44
  #12   9.5    FALSE 0.48
  #13  10.0    FALSE 0.52
  #14  11.9    FALSE 0.56
  #15  12.1    FALSE 0.60
  #16  12.6    FALSE 0.64
  #17  16.9    FALSE 0.68
  #18  17.9    FALSE 0.72
  #19  21.6    FALSE 0.76
  #20  22.7    FALSE 0.80
  #21  34.5    FALSE 0.84
  #22  45.9    FALSE 0.88
  #23  53.6    FALSE 0.92
  #24  77.2    FALSE 0.96
  #25 106.3    FALSE 1.00

  #----------

  # Clean up
  #---------
  rm(p.list.EPA)



