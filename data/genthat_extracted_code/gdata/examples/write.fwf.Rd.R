library(gdata)


### Name: write.fwf
### Title: Write object in fixed width format
### Aliases: write.fwf
### Keywords: print file

### ** Examples


  ## Some data
  num <- round(c(733070.345678, 1214213.78765456, 553823.798765678,
                 1085022.8876545678,  571063.88765456, 606718.3876545678,
                 1053686.6, 971024.187656, 631193.398765456, 879431.1),
               digits=3)

  testData <- data.frame(num1=c(1:10, NA),
                         num2=c(NA, seq(from=1, to=5.5, by=0.5)),
                         num3=c(NA, num),
                         int1=c(as.integer(1:4), NA, as.integer(4:9)),
                         fac1=factor(c(NA, letters[1:9], "hjh")),
                         fac2=factor(c(letters[6:15], NA)),
                         cha1=c(letters[17:26], NA),
                         cha2=c(NA, "longer", letters[25:17]),
                         stringsAsFactors=FALSE)
  levels(testData$fac1) <- c(levels(testData$fac1), "unusedLevel")
  testData$Date <- as.Date("1900-1-1")
  testData$Date[2] <- NA
  testData$POSIXt <- as.POSIXct(strptime("1900-1-1 01:01:01",
                                         format="%Y-%m-%d %H:%M:%S"))
  testData$POSIXt[5] <- NA

  ## Default
  write.fwf(x=testData)

  ## NA should be -
  write.fwf(x=testData, na="-")
  ## NA should be -NA-
  write.fwf(x=testData, na="-NA-")

  ## Some other separator than space
  write.fwf(x=testData[, 1:4], sep="-mySep-")

  ## Force wider columns
  write.fwf(x=testData[, 1:5], width=20)

  ## Show effect of 'scienfic' option
  testData$num3 <- testData$num3 * 1e8
  write.fwf(testData, scientific=TRUE)
  write.fwf(testData, scientific=FALSE)
  testData$num3 <- testData$num3 / 1e8

  ## Write to file and report format and fixed width information
  file <- tempfile()
  formatInfo <- write.fwf(x=testData, file=file, formatInfo=TRUE)
  formatInfo

  ## Read exported data back to R (note +1 due to separator)
  ## ... without header
  read.fwf(file=file, widths=formatInfo$width + 1, header=FALSE, skip=1,
           strip.white=TRUE)
  
  ## ... with header - via postimport modfication
  tmp <- read.fwf(file=file, widths=formatInfo$width + 1, skip=1,
                  strip.white=TRUE)
  colnames(tmp) <- read.table(file=file, nrow=1, as.is=TRUE)
  tmp

  ## ... with header - persuading read.fwf to accept header properly
  ## (thanks to Marc Schwartz)
  read.fwf(file=file, widths=formatInfo$width + 1, strip.white=TRUE,
           skip=1, col.names=read.table(file=file, nrow=1, as.is=TRUE))

  ## ... with header - with the use of quotes
  write.fwf(x=testData, file=file, quote=TRUE)
  read.table(file=file, header=TRUE, strip.white=TRUE)

  ## Tidy up
  unlink(file)



