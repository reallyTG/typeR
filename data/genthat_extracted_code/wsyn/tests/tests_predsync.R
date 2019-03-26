context("predsync")

test_that("error checking",{
  expect_error(predsync("test"),"Error in predsync: method not defined for this class")
})

test_that("do an example",{
  #this test partly based on the example data of supplementary figure 5 in Sheppard et al, 
  #Nature Climate Change, 2016, doi: 10.1038/NCLIMATE2881, plus some additional data. 
  
  #make the data
  set.seed(101) #201
  times<-(-3:100)
  ts1<-sin(2*pi*times/10)
  ts2<-5*sin(2*pi*times/3)
  artsig_x<-matrix(NA,11,length(times)) #the driver
  for (counter in 1:11)
  {
    artsig_x[counter,]<-ts1+ts2+rnorm(length(times),mean=0,sd=.5)
  }
  times<-0:100
  artsig_y<-matrix(NA,11,length(times)) #the driven
  for (counter1 in 1:11)
  {
    for (counter2 in 1:101)
    {
      artsig_y[counter1,counter2]<-mean(artsig_x[counter1,counter2:(counter2+2)])
    }
  }
  artsig_y<-artsig_y+matrix(rnorm(length(times)*11,mean=0,sd=1),11,length(times))
  artsig_x<-artsig_x[,4:104]
  artsig_i<-matrix(rnorm(11*length(times)),11,length(times)) #the irrelevant
  artsig_x<-cleandat(artsig_x,times,1)$cdat
  artsig_y<-cleandat(artsig_y,times,1)$cdat
  artsig_i<-cleandat(artsig_i,times,1)$cdat
  
  dat<-list(driven=artsig_y,driver=artsig_x,irrelevant=artsig_i)
  resp<-1
  pred<-2:3
  norm<-"powall"
  wlmobj<-wlm(dat,times,resp,pred,norm)

  res<-predsync(wlmobj)
  
  #test format
  expect_equal(class(res),c("tts","list"))
  expect_equal(dim(res$values),c(length(res$times),length(res$timescales)))
  expect_equal(class(res$values[1,1]),"complex")
  
  #test against syncexpl
  r1<-apply(FUN=mean,X=(Mod(res$values)^2),MARGIN=2,na.rm=TRUE)
  se<-syncexpl(wlmobj)
  r2<-se$syncexpl
  expect_equal(r1,r2)
  
  ##test for reasonableness by looking at some plots
  #plotmag(res)
  #wmfres<-wmf(dat[[1]],times)
  #plotmag(wmfres) #wavelet mean field of response, for comparison
  #
  #hist(Mod(wmfres$values)-Mod(res$values)) 
  #
  ##see what the difference looks like graphically
  #jetcolors <- c("#00007F", "blue", "#007FFF", "cyan", 
  #               "#7FFF7F", "yellow", "#FF7F00", "red", "#7F0000")
  #colorfill<-grDevices::colorRampPalette(jetcolors)
  #fields::image.plot(x=res$times,y=log2(res$timescales),
  #                   z=Mod(wmfres$values)-Mod(res$values),
  #                   xlab="Time",ylab="Timescale",axes=F,col=colorfill(100))
  #ylocs<-pretty(res$timescales,n=8)
  #xlocs<-pretty(res$times,n=8)
  #graphics::axis(1,at = xlocs,labels=xlocs)
  #graphics::axis(2,at = log2(ylocs),labels = ylocs)
  #graphics::par(new=T)
  #graphics::contour(x=res$times,y=log2(res$timescales),
  #                  z=Mod(wmfres$values)-Mod(res$values),
  #                  drawlabels=F,lwd=2,levels=0,
  #                  xaxs="i",xaxt="n",yaxt="n",xaxp=c(0,1,5),las = 1,frame=F)
  #  
  ##now compare powers
  #respow<-power(res)
  #wmfpow<-power(wmfres)
  #plot(respow$timescales,respow$power,type='l',col='red',
  #     ylim=range(respow$power,wmfpow$power))
  #lines(wmfpow$timescales,wmfpow$power,type='l')
  
  #all the above plots look fine, so...
  expect_known_value(res,file="../vals/predsync_testval_01",update=FALSE)
})
