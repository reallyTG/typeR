library(kgschart)
library(testthat)
library(jsonlite)

# uncomment this when debugging
#setwd('tests/testthat/')


context('identification of rank and time range')

test_that('rank and time range', {
  x <- NULL
  for (fn in dir(".", "\\.json$")) x <- rbind(x, fromJSON(fn))
  x <- x[order(x$file),]

  for (i in 1:nrow(x))
  {
    o <- kgschart(x$file[i])
    if (is.null(o$rank_range)) {
      expect_equal(x$rank_range[[i]], c('None', 'None'), info=x$file[i])
    } else {
      expect_equal(x$rank_range[[i]], o$rank_range, info=x$file[i])
    }

    if (is.null(o$time_range)) {
      expect_equal(x$time_range[[i]], c('None', 'None'), info=x$file[i])
    } else {
      a <- x$time_range[[i]]
      flg <- grepl(' ', a)
      if (all(flg)) {
        a <- as.POSIXct(a, format='%Y-%m-%d %H:%M', tz='UTC')
      } else {
        a <- as.POSIXct(a, format='%Y-%m-%d', tz='UTC')
      }
      expect_equal(a, o$time_range, info=x$file[i])
    }
  }

})
