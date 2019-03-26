

testthat::context('Simulation and image sequence')
testthat::test_that("Simulation and image sequence", {

  traj <- trackdem::simulTrajec(nframes=30,nIndividuals=20,domain='square',
                    h=0.01,rho=0.9,staticNoise=TRUE,
                    movingNoise=TRUE,
                    sizes=stats::runif(20,0.004,0.006))
  traj <- trackdem::simulTrajec(nframes=30,nIndividuals=20,domain='circle',
                    h=0.01,rho=0.9,staticNoise=TRUE,
                    movingNoise=TRUE,
                    sizes=stats::runif(20,0.004,0.006))

  testthat::expect_that(ncol(traj),testthat::equals(7))
  testthat::expect_that(nrow(traj),testthat::equals(600))
  testthat::expect_that(unique(traj$id),testthat::equals(1:20))
  testthat::expect_that(unique(traj$t),testthat::equals(1:30))
  testthat::expect_that(traj, testthat::is_a('simtrajectory'))
  testthat::expect_that(traj, testthat::is_a('TrDm'))
  testthat::expect_that(traj, testthat::is_a('data.frame'))

})

testthat::context('Background detection')
testthat::test_that("Filter method", {
  dir <- 'images'
  allFullImages <- trackdem::loadImages (dirPictures=dir,nImages=1:30,
                                         xranges=1:200,yranges=1:200)
  stillBack <- trackdem::createBackground(allFullImages,method='filter')
  
  ## Compare dimensions
  testthat::expect_that(dim(stillBack), 
                       testthat::equals(dim(allFullImages)[1:3]))
  
  ## Test classes
  testthat::expect_that(stillBack, testthat::is_a('TrDm'))
  testthat::expect_that(stillBack, testthat::is_a('colorimage'))
  testthat::expect_that(stillBack, testthat::is_a('array'))
  
})

testthat::test_that("Powerroot method", {
  dir <- 'images'
  allFullImages <- trackdem::loadImages (dirPictures=dir,nImages=1:30,
                                         xranges=1:200,yranges=1:200)
  stillBack <- trackdem::createBackground(allFullImages,method='powerroot')
  
  ## Compare dimensions
  testthat::expect_that(dim(stillBack), 
                       testthat::equals(dim(allFullImages)[1:3]))
  
  ## Test classes
  testthat::expect_that(stillBack, testthat::is_a('TrDm'))
  testthat::expect_that(stillBack, testthat::is_a('colorimage'))
  testthat::expect_that(stillBack, testthat::is_a('array'))
  
})

testthat::test_that("Mean method", {
  dir <- 'images'
  allFullImages <- trackdem::loadImages (dirPictures=dir,nImages=1:30,
                                         xranges=1:200,yranges=1:200)
  
  stillBack <- trackdem::createBackground(allFullImages,method='mean')
  bg <- apply(allFullImages,1:3,mean)
  
  ## Compare dimensions
  testthat::expect_that(dim(stillBack), 
                       testthat::equals(dim(allFullImages)[1:3]))
  
  ## Compare to values obtained by apply
  testthat::expect_that(stillBack[,,1], testthat::equals(bg[,,1]))
  testthat::expect_that(stillBack[,,2], testthat::equals(bg[,,2]))
  testthat::expect_that(stillBack[,,3], testthat::equals(bg[,,3]))
  
  ## Test classes
  testthat::expect_that(stillBack, testthat::is_a('TrDm'))
  testthat::expect_that(stillBack, testthat::is_a('colorimage'))
  testthat::expect_that(stillBack, testthat::is_a('array'))
  
})



testthat::context('Background subtraction')
testthat::test_that("Background subtraction", {
  dir <- 'images'
  allFullImages <- trackdem::loadImages (dirPictures=dir,nImages=1:30)
  stillBack <- trackdem::createBackground(allFullImages,method='mean')
  allImages <- trackdem::subtractBackground(bg=stillBack,
                                            colorimages=allFullImages)

  ## Compare dimensions
  testthat::expect_that(dim(allImages), testthat::equals(dim(allFullImages)))

  ## Test sb() function
  testthat::expect_that(allImages[,,1,2],
                       testthat::equals(allFullImages[,,1,2] - stillBack[,,1]))
  testthat::expect_that(allImages[,,2,2], 
                        testthat::equals(allFullImages[,,2,2] - stillBack[,,2]))
  testthat::expect_that(allImages[,,3,2], 
                        testthat::equals(allFullImages[,,3,2] - stillBack[,,3]))

  ## Test classes
  testthat::expect_that(allImages, testthat::is_a('TrDm'))
  testthat::expect_that(allImages, testthat::is_a('sbg'))
  testthat::expect_that(allImages, testthat::is_a('array'))

})

testthat::context('Particle identification')
testthat::test_that("Particle identification", {

  dir <- 'images'
  allFullImages <- trackdem::loadImages (dirPictures=dir,nImages=1:30)
  stillBack <- trackdem::createBackground(allFullImages,method='mean')
  allImages <- trackdem::subtractBackground(bg=stillBack,
                                            colorimages=allFullImages)
  invisible(utils::capture.output(partIden <- trackdem::identifyParticles(
                                             sbg=allImages,
                                             colorimages=allFullImages,
                                             pixelRange=c(1,500),
                                             threshold=-0.1)))
  
    
  ## Test settings
  testthat::expect_that(attributes(partIden)$threshold,
                        testthat::equals(c(-0.1,-0.1,-0.1)))
  testthat::expect_that(attributes(partIden)$settings$pixelRange,
                        testthat::equals(c(1,500)))
  testthat::expect_that(attributes(partIden)$settings$BgMethod,
                        testthat::equals('mean'))

  ## Test number of columns and rows
  testthat::expect_that(ncol(partIden),testthat::equals(18))
  testthat::expect_that(nrow(partIden),testthat::equals(300))  
  
  ## Test number of particles detected
  testthat::expect_that(as.vector(table(partIden$frame)),
                        testthat::equals(rep(10,30)))

  ## Test colors of detected particles
  testthat::expect_that(as.vector(partIden$muR),testthat::equals(rep(1,300)))
  testthat::expect_that(as.vector(partIden$muG),testthat::equals(rep(0,300)))
  testthat::expect_that(as.vector(partIden$muB),testthat::equals(rep(0,300)))
  
  ## Test classes
  testthat::expect_that(partIden, testthat::is_a('TrDm'))
  testthat::expect_that(partIden, testthat::is_a('particles'))
  testthat::expect_that(partIden, testthat::is_a('data.frame'))

})

testthat::context('Neural net')
testthat::test_that("Neural net", {

  load('trainingdata.RData')
  invisible(utils::capture.output(finalNN <- trackdem::testNN(dat=td,
                                                    repetitions=10,maxH=4,
                                                    prop=c(6,2,2))))

  dir <- 'images'
  allFullImages <- trackdem::loadImages (dirPictures=dir,nImages=1:30)
  stillBack <- trackdem::createBackground(allFullImages,method='mean')
  allImages <- trackdem::subtractBackground(bg=stillBack,
                                            colorimages=allFullImages)
  invisible(utils::capture.output(partIden <- trackdem::identifyParticles(
                                             sbg=allImages,
                                             colorimages=allFullImages,
                                             pixelRange=c(1,500),
                                             threshold=-0.1)))
  invisible(utils::capture.output(partIden2 <- update(partIden,finalNN,
                                                      colorimages=allFullImages,
                                                      sbg=allImages)))
  partIden2 <- partIden
  invisible(utils::capture.output(records <- trackdem::trackParticles(partIden2,
                                                                    L=60,R=3)))
  
  ## Test output
  testthat::expect_that(finalNN$fscore,testthat::equals(1))
  testthat::expect_that(finalNN$bestNN$stat,testthat::equals('F'))
  testthat::expect_that(dim(finalNN$finalstats),testthat::equals(c(4,4)))
  testthat::expect_that(dim(attributes(td)$trainingData),
                        testthat::equals(c(147,52)))

  testthat::expect_that(summary(records,incThres=10)$N,testthat::equals(10))
  testthat::expect_that(summary(records,incThres=10)$presence,
                        testthat::equals(10))
  
  ## Test classes
  testthat::expect_that(finalNN, testthat::is_a('TrDm'))
  testthat::expect_that(finalNN, testthat::is_a('neuralnet'))
  testthat::expect_that(finalNN, testthat::is_a('list'))

  testthat::expect_that(td, testthat::is_a('TrDm'))
  testthat::expect_that(td, testthat::is_a('tfp'))
  testthat::expect_that(td, testthat::is_a('list'))
})

testthat::context('Particle tracking')
testthat::test_that("Tracking algorithm", {

  dir <- 'images'
  allFullImages <- trackdem::loadImages (dirPictures=dir,nImages=1:30)
  stillBack <- trackdem::createBackground(allFullImages,method='mean')
  allImages <- trackdem::subtractBackground(bg=stillBack,
                                            colorimages=allFullImages)
  invisible(utils::capture.output(partIden <- trackdem::identifyParticles(
                                             sbg=allImages,
                                             colorimages=allFullImages,
                                             pixelRange=c(1,500),
                                             threshold=-0.1)))
  
  invisible(utils::capture.output(records <- trackdem::trackParticles(partIden,
                                                                      L=60,
                                                                      R=3)))

  ## Test output
  testthat::expect_that(summary(records,incThres=10)$N,testthat::equals(10))
  testthat::expect_that(summary(records,incThres=10)$presence,
                        testthat::equals(10))
  
  ## Test classes
  testthat::expect_that(records, testthat::is_a('TrDm'))
  testthat::expect_that(records, testthat::is_a('tracked'))
})

testthat::context('Output')
testthat::test_that("Output", {

  dir <- 'images'
  allFullImages <- trackdem::loadImages (dirPictures=dir,nImages=1:30)
  stillBack <- trackdem::createBackground(allFullImages,method='mean')
  allImages <- trackdem::subtractBackground(bg=stillBack,
                                            colorimages=allFullImages)
  invisible(utils::capture.output(partIden <- trackdem::identifyParticles(
                                             sbg=allImages,
                                             colorimages=allFullImages,
                                             pixelRange=c(1,500),
                                             threshold=-0.1)))
  
  invisible(utils::capture.output(records <- trackdem::trackParticles(partIden,
                                                                      L=60,
                                                                      R=3)))
  name <- tempfile("plot", fileext = c(".pdf"))
  pdf(name)
  plot(allFullImages)
  dev.off()
  testthat::expect_true(file.exists(name))
  testthat::expect_true(file.info(name)$size > 0)
  
  name <- tempfile("plot", fileext = c(".pdf"))
  pdf(name)
  plot(stillBack)
  dev.off()
  testthat::expect_true(file.exists(name))
  testthat::expect_true(file.info(name)$size > 0)
  
  name <- tempfile("plot", fileext = c(".pdf"))
  pdf(name)
  pdf(name)
  plot(partIden,colorimages=allFullImages)
  dev.off()
  testthat::expect_true(file.exists(name))
  testthat::expect_true(file.info(name)$size > 0)
  
  name <- tempfile("plot", fileext = c(".pdf"))
  pdf(name)
  plot(records,incThres=10,colorimages=allFullImages)
  plot(records,incThres=10,type='trajectories',colorimages=allFullImages)
  dev.off()
  testthat::expect_true(file.exists(name))
  testthat::expect_true(file.info(name)$size > 0)

  name <- tempdir()
  invisible(utils::capture.output(plot(records,path=name,
                                  type='animation',
                                  colorimages=allFullImages,incThres=10)))
  testthat::expect_true(file.exists(paste0(name,'/animation.mp4')))
  testthat::expect_true(file.info(paste0(name,'/animation.mp4'))$size > 0)
  unlink(paste0(name,'/animation.mp4'))
  
})


testthat::context('Run batch')
testthat::test_that("Run batch", {

  dir <- 'images'
  allFullImages <- trackdem::loadImages (dirPictures=dir,nImages=1:30)
  stillBack <- trackdem::createBackground(allFullImages,method='mean')
  allImages <- trackdem::subtractBackground(bg=stillBack,
                                            colorimages=allFullImages)
  invisible(utils::capture.output(partIden <- trackdem::identifyParticles(
                                             sbg=allImages,
                                             colorimages=allFullImages,
                                             pixelRange=c(1,500),
                                             threshold=-0.1)))
  
  invisible(utils::capture.output(records <- trackdem::trackParticles(partIden,
                                                                      L=60,
                                                                      R=3)))
  
  batchpath <- "./batch"
  invisible(utils::capture.output(results <- trackdem::runBatch(path=batchpath,
                                                      settings=records,
                                                      incThres=10)))
  testthat::expect_that(nrow(results),testthat::equals(2))
  testthat::expect_that(results$Count,testthat::equals(c(5,15)))
  
})

