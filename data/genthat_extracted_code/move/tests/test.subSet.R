context('subset')
test_that('subSet',
		{
		a<-move(x=1:10,y=1:10,time=as.POSIXct(1:10, origin='1970-1-1'),proj=CRS('+proj=longlat +ellps=WGS84'))
		b<-move(x=1:10,y=1:10,time=as.POSIXct(1:10, origin='1970-1-1'),proj=CRS('+proj=longlat +ellps=WGS84'),animal='b') 
		expect_true(validObject(a[-4,]))
		s<-moveStack(list(a,j=b))
		expect_warning(sl<-moveStack(list(l=a,j=b, k=a,p=b )),'Detected duplicated names. Renamed the duplicated individuals accordingly.')
		bb<-s[['j']]
		names(bb@sensor)<-NULL
		names(bb@timestamps)<-NULL
		rownames(bb@data)<-(1:10)
		rownames(bb@coords)<-NULL
		bb@idData<-b@idData
#need to make sure the results are more equal
		attr(b@timestamps,"tzone")<-NULL
		expect_equal(b, bb)
		expect_equal(s[['j']], split(s)[['j']]) 
		expect_equal(s[[1]], s[[c(T,F)]])
		expect_equal(s[[2]], s[['j']])
		ss<-s[[T]]
#	ss@bbox<-bbox(s)
#	attributes(ss@coords)$dimnames[[2]]<- attributes(s@coords)$dimnames[[2]]
		expect_equal(s,ss)
#	expect_equal(sl[[idData(sl,T,'individual.local.identifier')=='b']], sl[[c(2,4)]])
		expect_equal(sl[[c('j','p')]], sl[[c(2,4)]])
#	for(i in slotNames(b))
#	{
#		message(i)
#		try(expect_equal(slot(b,i), slot(bb,i)))
#	}
		m<-	move(1:10, 1:10, Sys.time()+1:10, animal=gl(5,2))
		expect_error(m[['X7']],'Not all individuals are in stack')
		expect_error(m[[c('X3','X7')]],'Not all individuals are in stack')
		expect_s4_class(m[[c('X3','X5')]],'MoveStack')
		})
test_that("subset burst",{
		b<-burst(move(1:9,1:9, as.POSIXct(1:9, origin="1970-1-1")), gl(3,3)[-1])
		expect_true(validObject(b[1:7]))
		expect_true(validObject(b[1:7,]))
		expect_true(validObject(b[-7]))
		expect_true(validObject(b[-7,]))
		expect_true(validObject(b[,-1]))
		expect_error(b[-3])
		expect_error(b['asdf',])
		expect_equal(colnames(b[,c('x','time')]@data), c('x','time'))
		})
test_that("subset colums",{
		b<-move(1:9,1:9, as.POSIXct(1:9, origin="1970-1-1"), data=data.frame(a=letters[1:9], A=LETTERS[1:9]))
		expect_true(validObject(b[,'A']))
		expect_true(validObject(b[,-1]))
		expect_identical(b[,c('A')], b[,-1])
		bb<-move(1:9,1:9, as.POSIXct(1:9, origin="1970-1-1"), data=data.frame(a=letters[1:9], A=LETTERS[1:9]), animal=gl(3,3))
		expect_true(validObject(bb[,'A']))
		expect_true(validObject(bb[,-1]))
		expect_identical(bb[,c('A')], bb[,-1])
		})
test_that('subseting dbmvar',{
		data(leroydbbmm)
		v<-leroydbbmm@DBMvar
		expect_true(validObject(v[1:100,]))
		expect_true(validObject(v[,'eobs.temperature']))
		})

test_that('subset of movestacks',{
		m<-move(1:10,1:10,t<-Sys.time()+1:10, animal=gl(2,5))
		ma<-move(1:4,1:4,t[1:4], animal=factor(rep(1,4)))

		expect_s4_class(mm<-m[1:4,],'MoveStack')
		expect_silent(mm<-as(mm,'Move'))
		expect_error(as(m,'Move'))
#  idData(mm,j='individual.local.identifier')<-  idData(ma, drop=T,j='individual.local.identifier')
		expect_identical(ma,mm)
		})
test_that('asign in stack', {
		data(fishers)
		expect_silent(fishers[, "a"] <- 1:sum(n.locs(fishers)))
		expect_equal(as.data.frame(fishers[, 'a'])[,1], fishers$a)
		expect_equal(fishers$a, 1:sum(n.locs(fishers)))
		expect_silent(fishers[, "a"] <- 'asdf')
		expect_equal(as.data.frame(fishers[, 'a'])[,1], fishers$a)
		expect_equal(fishers$a, rep('asdf', sum(n.locs(fishers))))
		expect_silent( fishers[,c("asdf","asdff")]<-data.frame(3,4))
		expect_equal(fishers$asdf, rep(3,sum(n.locs(fishers))))
		})
test_that("subset unused",{
		t<-new(".unUsedRecordsStack", trackIdUnUsedRecords=factor(levels=c("a","b")))
		expect_equal(t,t[logical(0L),T])
		expect_equal(t,t[,T])
		expect_true(validObject(t[,T]))
		})
test_that("subset unused",{
		t<-new(".unUsedRecordsStack", trackIdUnUsedRecords=factor("a",levels=c("a","b")),
			sensorUnUsedRecords=factor("a"),
			timestampsUnUsedRecords=Sys.time(),
			dataUnUsedRecords=data.frame(a=1)
		      )
		expect_equal(t,t[T,T])
		expect_equal(t,t[,T])
		expect_equal(t,t[T,T])
		expect_true(validObject(t[,T]))
		})
