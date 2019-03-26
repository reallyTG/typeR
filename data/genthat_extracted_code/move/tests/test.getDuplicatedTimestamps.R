context('getDuplicatedTimestamps')

test_that("basic functionality", {
		  expect_null(getDuplicatedTimestamps(system.file("extdata", "leroy.csv.gz", package = "move")))
		  expect_null(getDuplicatedTimestamps(df<-data.frame(individual.local.identifier=letters, timestamps=as.POSIXct(1:26, origin="1970-1-1", tz="UTC"), sensor.type=rep("gps",26))))
		  expect_equal(getDuplicatedTimestamps(df[c(1:3,2,4),]), structure(list("b|1970-01-01 00:00:02.0000|gps" = c(2L, 4L)), .Names = "b|1970-01-01 00:00:02.0000|gps"))
		  expect_null(getDuplicatedTimestamps(df<-data.frame(individual.local.identifier=letters, timestamps=as.POSIXct(rep(1,26), origin="1970-1-1", tz="EST"), sensor.type=rep("gps",26))))
		  df$individual.local.identifier[26]<-"a"
		  expect_equal(getDuplicatedTimestamps(df), structure(list("a|1969-12-31 19:00:01.0000|gps" = c(1L, 26L)), .Names = "a|1969-12-31 19:00:01.0000|gps"))
		  df2<-df
		  df2$individual.local.identifier<-as.character( df$individual.local.identifier)
		  expect_equal(
			       getDuplicatedTimestamps(df2$individual.local.identifier, df2$timestamps, df2$sensor.type),
			       getDuplicatedTimestamps(df))
})
test_that("basic functionality", {
		  v<-c('event.id,visible,timestamp,location.long,location.lat,comments,modelled,study.specific.measurement,tag.tech.spec,sensor.type,individual.taxon.canonical.name,tag.local.identifier,individual.local.identifier,study.name',
		       '53434,true,2011-12-15 00:21:57.000,1,2,sdfg,true,111,1,gps,T,7GPS,7,"a"',
		       '2345234,true,2011-12-15 01:22:57.000,3,4,dfg,true,111,1,gps,T,7GPS,7,"a"',
		       '12345320,true,2011-12-15 02:52:57.000,0,5,dfg,true,111,1,gps,T,7GPS,7,"a"'
		       ,
		       '1234320,true,2011-12-15 01:52:57.000,0,5,dfg,true,111,1,gps,T,8GPS,8,"a"',
		       '1235320,false,2011-12-15 02:52:57.000,0,5,dfg,true,111,1,gps,T,8GPS,8,"a"',
		       '145320,true,2011-12-15 02:52:57.000,1,5,dfg,true,111,1,gps,T,8GPS,8,"a"'
		       )
		  ff <- textConnection(v)
		  class(ff) <- 'connection'
		  expect_equal(getDuplicatedTimestamps(ff, onlyVisible=F), structure(list("8|2011-12-15 02:52:57.0000|gps" = 5:6), .Names = "8|2011-12-15 02:52:57.0000|gps"))
		  ff <- textConnection(v)
		  class(ff) <- 'connection'
		  expect_null(getDuplicatedTimestamps(ff))
		  ff <- textConnection(v)
		  class(ff) <- 'connection'
		  expect_null(getDuplicatedTimestamps(ff, onlyVisible=T))
		  v<-c('event.id,visible,timestamp,location.long,location.lat,comments,modelled,study.specific.measurement,tag.tech.spec,sensor.type,individual.taxon.canonical.name,tag.local.identifier,individual.local.identifier,study.name',
		       '53434,true,2011-12-15 00:21:57.000,1,2,sdfg,true,111,1,gps,T,7GPS,7,"a"',
		       '2345234,true,2011-12-15 00:21:57.000,3,4,dfg,true,111,1,gps,T,7GPS,7,"a"',
		       '12345320,true,2011-12-15 02:52:57.000,0,5,dfg,true,111,1,gps,T,7GPS,7,"a"'
		       ,
		       '1234320,true,2011-12-15 01:52:57.000,0,5,dfg,true,111,1,gps,T,8GPS,8,"a"',
		       '1235320,false,2011-12-15 02:52:57.000,0,5,dfg,true,111,1,gps,T,8GPS,8,"a"',
		       '145320,true,2011-12-15 02:52:57.000,1,5,dfg,true,111,1,gps,T,8GPS,8,"a"'
		       )
		  ff <- textConnection(v)
		  class(ff) <- 'connection'
		  expect_equal(getDuplicatedTimestamps(ff, onlyVisible=F), structure(list("7|2011-12-15 00:21:57.0000|gps" = 1:2,"8|2011-12-15 02:52:57.0000|gps" = 5:6), .Names = c("7|2011-12-15 00:21:57.0000|gps","8|2011-12-15 02:52:57.0000|gps")))
		  ff <- textConnection(v)
		  class(ff) <- 'connection'
		  expect_equal(getDuplicatedTimestamps(ff, onlyVisible=T), structure(list("7|2011-12-15 00:21:57.0000|gps" = 1:2), .Names = c("7|2011-12-15 00:21:57.0000|gps")))
})
