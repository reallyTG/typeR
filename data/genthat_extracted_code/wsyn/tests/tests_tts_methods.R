context("tts_methods")

test_that("test set_dat",{
  times<-1:10
  timescales<-1/c(1:10)
  values<-matrix(1,length(times),length(timescales))
  obj<-list(times=times,timescales=timescales,values=values)
  dat<-NA
  expect_error(set_dat(obj,dat),
               "Error in set_dat: set_dat not defined for this class")
  
  obj<-tts(times,timescales,values) 
  expect_error(set_dat(obj,dat),"Error in set_dat: set_dat not defined for this class")
})

test_that("test set_times", {
  times<-1:10
  newtimes<-2:11
  timescales<-1/c(1:10)
  values<-matrix(1,length(times),length(timescales))
  obj<-list(times=times,timescales=timescales,values=values)
  expect_error(set_times(obj,newtimes),
               "Error in set_times: set_times not defined for this class")

  times<-1:10
  newtimes<-2:11
  timescales<-1/c(1:10)
  values<-matrix(1,length(times),length(timescales))
  obj<-tts(times,timescales,values) 
  h<-set_times(obj,newtimes)
  expect_equal(h$times,newtimes)
  expect_equal(h$timescales,timescales)
  expect_equal(h$values,values)
})

#the other set methods are skipped because they are written in exactly the same way

test_that("test get_dat",{
  times<-1:10
  timescales<-1/c(1:10)
  values<-matrix(1,length(times),length(timescales))
  obj<-list(times=times,timescales=timescales,values=values)
  expect_error(get_dat(obj),
               "Error in get_dat: get_dat not defined for this class")
  
  obj<-tts(times,timescales,values) 
  expect_error(get_dat(obj),
               "Error in get_dat: get_dat not defined for this class")
})

test_that("test get_timescales", {
  times<-1:10
  timescales<-1/c(1:10)
  values<-matrix(1,length(times),length(timescales))
  obj<-list(times=times,timescales=timescales,values=values)
  expect_error(get_timescales(obj),
               "Error in get_timescales: get_timescales not defined for this class")  

  obj<-tts(times,timescales,values) 
  expect_equal(get_timescales(obj),timescales)  
})

#the other get functions are skipped because they are written in exactly 
#the same way

test_that("test print.tts", {
  times<-1:12
  timescales<-1:12
  values<-matrix(1:144,12,12)
  obj1<-tts(times,timescales,values)
  
  times<-1:9
  timescales<-1:9
  values<-matrix(1:81,9,9)
  obj2<-tts(times,timescales,values)
  
  times<-1:5
  timescales<-1:5
  values<-matrix(1:25,5,5)
  obj3<-tts(times,timescales,values)
  
  expect_equal(capture_output(print(obj1)),"tts object:\ntimes, a length 12 numeric vector:\n1 2 3 4 5 ... 8 9 10 11 12 \ntimescales, a length 12 numeric vector:\n1 2 3 4 5 ... 8 9 10 11 12 \nvalues, a 12 by 12 matrix, upper left to four digits is:\n     [,1] [,2] [,3] [,4] [,5]\n[1,]    1   13   25   37   49\n[2,]    2   14   26   38   50\n[3,]    3   15   27   39   51\n[4,]    4   16   28   40   52\n[5,]    5   17   29   41   53")
  expect_equal(capture_output(print(obj2)),"tts object:\ntimes, a length 9 numeric vector:\n1 2 3 4 5 6 7 8 9 \ntimescales, a length 9 numeric vector:\n1 2 3 4 5 6 7 8 9 \nvalues, a 9 by 9 matrix, upper left to four digits is:\n     [,1] [,2] [,3] [,4] [,5]\n[1,]    1   10   19   28   37\n[2,]    2   11   20   29   38\n[3,]    3   12   21   30   39\n[4,]    4   13   22   31   40\n[5,]    5   14   23   32   41")
  expect_equal(capture_output(print(obj3)),"tts object:\ntimes, a length 5 numeric vector:\n1 2 3 4 5 \ntimescales, a length 5 numeric vector:\n1 2 3 4 5 \nvalues, a 5 by 5 matrix, to four digits:\n     [,1] [,2] [,3] [,4] [,5]\n[1,]    1    6   11   16   21\n[2,]    2    7   12   17   22\n[3,]    3    8   13   18   23\n[4,]    4    9   14   19   24\n[5,]    5   10   15   20   25")
})

test_that("test summary.tts and the print method for the summary_wsyn class",{
  times<-1:12
  timescales<-1:12
  values<-matrix(1:144,12,12)
  obj1<-tts(times,timescales,values)
  
  h<-summary(obj1)
  expect_equal(class(h),c("summary_wsyn","list"))
  expect_equal(names(h),c("class","times_start","times_end","times_increment","timescale_start","timescale_end","timescale_length"))
  expect_equal(h[[1]],"tts")
  expect_equal(h[[2]],1)
  expect_equal(h[[3]],12)
  expect_equal(h[[4]],1)
  expect_equal(h[[5]],1)
  expect_equal(h[[6]],12)
  expect_equal(h[[7]],12)
  
  expect_equal(capture_output(print(h)),"class: tts\ntimes_start: 1\ntimes_end: 12\ntimes_increment: 1\ntimescale_start: 1\ntimescale_end: 12\ntimescale_length: 12")
})