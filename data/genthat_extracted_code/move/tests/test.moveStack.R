context('moveStack')
test_that('moveStack',
{
	at<-as.POSIXct(1:10, origin='1970-1-1',tz="GMT")
	bt<-as.POSIXct(5+1:10, origin='1970-1-1',tz="GMT")       
	attr(bt,'tzone')<-NULL
	attr(at,'tzone')<-NULL
	a<-move(x=1:10,y=1:10,time=at,proj=CRS('+proj=longlat +ellps=WGS84'))
	b<-move(x=1:10,y=1:10,time=bt,proj=CRS('+proj=longlat +ellps=WGS84'), 
		animal="a")
	expect_identical(coordinates(a), coordinates(b))
	#	DEACTIVATED("Need to look what we want here")
	bb<-split(d<-moveStack(list(a,b)))
  expect_true(validObject(d))
	aa<-list(unnamed=a,a=b)
	row.names(aa[[2]])<-1:10
	row.names(bb[[2]])<-1:10
#	bb<-lapply(bb, function(x){x@idData$individual.local.identifier<-factor(x@idData$individual.local.identifier); return(x)})
	expect_equal(bb,aa)# one problem seems to be moveStack does not deal with missed fixes, the other the rownames of the data frame
	row.names(d@idData)<-sub('a','A A', row.names(d@idData))
	expect_error(new('MoveStack', d , trackId=factor(sub('a','A A', as.character(d@trackId))), idData=d@idData))# track ids are no good names
	expect_error(validObject(d))#validity check needs to fail because of changed rownames
	a<-move(x=1:10,y=1:10,time=at,proj=CRS('+proj=longlat +ellps=WGS84'),animal="AAA")
	a2<-move(x=1:10,y=1:10,time=at,proj=CRS('+proj=longlat +ellps=WGS84'),animal="AAA")  
	expect_warning(uuu<-moveStack(list(a,a2)),'Detected duplicated names. Renamed the duplicated individuals accordingly.')# warn about duplicate ids
	expect_equal(n.indiv(uuu), 2)
	projection(a2) <- CRS(as.character(NA))
	expect_error(moveStack(list(a,a2,a2)))
	expect_error(moveStack(list(a,a,a2)))
	expect_error(moveStack(list(a2,a2,a)))
	expect_error(moveStack(list(a,a2,a)))
	expect_error(moveStack(list(a2,a,a2)))
	m<-lapply(1:5, function(x){
	  m<-move(rnorm(5), rnorm(5), Sys.time()+1:5)
	  idData(m)<-data.frame(groupID=sample(letters,1), groupDay=round(rnorm(1)))
	  m
	  })
	expect_warning(mm<-moveStack(m))
	expect_true(all(grepl('^............: ',capture.output(print(mm)))))
  expect_equal(kk<-capture.output(print(mm)), kl<-capture.output(show(mm)))
	expect_equal(unique(timeLag(mm,units='mins')), list(c(1,1,1,1)/60))
  expect_identical(names(idData(mm)),c('groupID','groupDay'))
  expect_error(move(1:3,1:3, Sys.time()+3:1, animal=c("b","b","a")),regexp = "Not ordered")
expect_error(move(1:3,1:3, Sys.time()+c(1,1,2), animal=c("b","b","a")),regexp = "The data set includes double timestamps")
expect_error(move(1:4,1:4, Sys.time()+c(1,2,1,2), animal=c("b","b","b","a")),regexp = "Not ordered")



}
)
test_that("move stacks stack",{
  ab<-move(1:4,1:4, Sys.time()+c(1,2,3,2), animal=c("b","b","b","a"))
  d<-move(1:4,1:4, Sys.time()+c(1,2,3,4), animal=c("d"))
  ef<-move(1:4,1:4, Sys.time()+c(1,2,1,2), animal=c("e","e","f","f"))
  expect_equal(n.indiv(moveStack(list(ab,d))), 3)
  expect_equal(n.indiv(moveStack(list(ab,ef))), 4)
  expect_equal(n.indiv(moveStack(list(ab,d,ef))), 5)
  })

test_that("stack timezones",{
  a<-move(x=1:10,y=1:10,time=as.POSIXct(1:10, origin='1970-1-1'),proj=CRS('+proj=longlat +ellps=WGS84'))
  b<-move(x=1:10,y=1:10,time=as.POSIXct(1:10, origin='1970-1-1'),proj=CRS('+proj=longlat +ellps=WGS84'),animal='b') 
  expect_equal(attr(timestamps(a),'tzone'),
attr(timestamps(moveStack(list(a,b))),'tzone'))
  })

test_that("use dots",{
  a<-move(x=1:10,y=1:10,time=as.POSIXct(1:10, origin='1970-1-1'),proj=CRS('+proj=longlat +ellps=WGS84'))
  b<-move(x=1:10,y=1:10,time=as.POSIXct(1:10, origin='1970-1-1'),proj=CRS('+proj=longlat +ellps=WGS84'),animal=gl(2,5))
  expect_equal(moveStack(a,b), moveStack(list(a,b)))
  expect_equal(moveStack(b,a), moveStack(list(b,a)))
  })
test_that("forcetz",{
  a<-move(x=1:10,y=1:10,time=as.POSIXct(1:10, origin='1970-1-1', tz="UTC"),proj=CRS('+proj=longlat +ellps=WGS84'))
  b<-move(x=1:10,y=1:10,time=as.POSIXct(1:10, origin='1970-1-1', tz="UTC"),proj=CRS('+proj=longlat +ellps=WGS84'),animal=gl(2,5))
  expect_equal(attributes(timestamps(moveStack(a,b)))$tzone,NULL)
  expect_equal(attributes(t<-timestamps(moveStack(a,b, forceTz="UTC")))$tzone,"UTC")
  expect_true(all.equal(t[1:10], timestamps(a), check.names=F))
  expect_true(all.equal(t[11:20], timestamps(b), check.names=F))
  expect_equal(attributes(tt<-timestamps(moveStack(a,b, forceTz="EST")))$tzone,"EST")
  expect_warning(moveStack(a,b,forceTz="asdf"), "Possibly changing to not existing time zone")
})
  
