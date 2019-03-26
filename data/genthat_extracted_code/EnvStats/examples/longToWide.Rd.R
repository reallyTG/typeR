library(EnvStats)


### Name: longToWide
### Title: Convert a Long Format Data Set into a Wide Format
### Aliases: longToWide
### Keywords: manip

### ** Examples

  EPA.09.Ex.10.1.nickel.df
  #   Month   Well Nickel.ppb
  #1      1 Well.1       58.8
  #2      3 Well.1        1.0
  #3      6 Well.1      262.0
  #4      8 Well.1       56.0
  #5     10 Well.1        8.7
  #6      1 Well.2       19.0
  #7      3 Well.2       81.5
  #8      6 Well.2      331.0
  #9      8 Well.2       14.0
  #10    10 Well.2       64.4
  #11     1 Well.3       39.0
  #12     3 Well.3      151.0
  #13     6 Well.3       27.0
  #14     8 Well.3       21.4
  #15    10 Well.3      578.0
  #16     1 Well.4        3.1
  #17     3 Well.4      942.0
  #18     6 Well.4       85.6
  #19     8 Well.4       10.0
  #20    10 Well.4      637.0

  longToWide(EPA.09.Ex.10.1.nickel.df, 
    "Nickel.ppb", "Month", "Well", paste.row.name = TRUE)
  #         Well.1 Well.2 Well.3 Well.4
  #Month.1    58.8   19.0   39.0    3.1
  #Month.3     1.0   81.5  151.0  942.0
  #Month.6   262.0  331.0   27.0   85.6
  #Month.8    56.0   14.0   21.4   10.0
  #Month.10    8.7   64.4  578.0  637.0



