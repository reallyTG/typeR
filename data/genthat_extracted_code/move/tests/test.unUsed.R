context("unUsedRecords")
test_that("unused df", {
  data(leroy)
  u <- unUsedRecords(leroy)
  expect_equal(
    as(u, 'data.frame'),
    cbind(
      u@dataUnUsedRecords,
      sensor = u@sensorUnUsedRecords,
      timestamps = u@timestampsUnUsedRecords
    )
  )
  expect_equal(
    as(u, 'data.frame'),as.data.frame(u))
  data("fishers")
  uu <- unUsedRecords(fishers)
  expect_equal(
    as(uu, 'data.frame'),
    cbind(
      uu@dataUnUsedRecords,
      sensor = uu@sensorUnUsedRecords,
      timestamps = uu@timestampsUnUsedRecords,
      trackId = uu@trackIdUnUsedRecords
    )
  )
  expect_equal(
    as(uu, 'data.frame'),as.data.frame(uu))
})
test_that('timestamps ordering in stack',{
  expect_is(u<-new('.unUsedRecordsStack', 
                 timestampsUnUsedRecords=Sys.time()+1:3,   
                 sensorUnUsedRecords=factor(rep(1,3)),
                 trackIdUnUsedRecords=factor(c('a','a','b')),
                 dataUnUsedRecords=data.frame(1:3)
  ),'.unUsedRecordsStack')
  # allow doubles now
 # t<-as.POSIXct(rep(1,3), origin='1970-1-1', tz='UTC')
 # u@timestampsUnUsedRecords<-t
 # expect_error(validObject(u),"The data set includes double timestamps per ID in the unused records \\(first one:a 1 1970-01-01 00:00:01\\)")
  t<-as.POSIXct(c(2,1,1), origin='1970-1-1')
  u@timestampsUnUsedRecords<-t
  expect_error(validObject(u),"The data set includes un ordered timestamps in the unUsedRecordsStack")
  
  })
test_that('make unused',{
  data("leroy")
  unUsedRecords(leroy)<-(s<-round(as.numeric(timestamps((leroy))))%%3!=1)
  expect_equal(n.locs(leroy), sum(!s))
  
  data("fishers")
  unUsedRecords(fishers)<-(s<-round(as.numeric(timestamps((fishers))))%%3!=1)
  expect_equal(sum(n.locs(fishers)), sum(!s))
  l<-(k<-move(1:6,1:6, Sys.time()+1:6, animal=gl(3,2)))
  expect_silent(unUsedRecords(k)<-c(F,F,F,T,F,F))
expect_equal(as(k,"SpatialPointsDataFrame"),  as(l[c(1:3,5:6),],"SpatialPointsDataFrame"))
  })
