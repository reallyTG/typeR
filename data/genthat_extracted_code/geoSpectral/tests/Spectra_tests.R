library(geoSpectral)
library(testthat)
context("Tests for Spectra methods")

fnm = file.path(base::system.file(package = "geoSpectral"),"test_data","particulate_absorption.csv.gz")
fnm=gsub("\\\\", "/", fnm)
abs = read.table(fnm,sep=",",header=TRUE)
abs$STATION=factor(abs$STATION)
abs[1:2,1:17] #Display only the first 2 rows and first 17 columns if the data frame
lbd = as.numeric(gsub("X","",colnames(abs)[14:514]))
Units="1/m"
colnames(abs)= gsub("X",paste("anap","_",sep=""), colnames(abs))
colnames(abs)= gsub("PRES","DEPTH", colnames(abs))
abs = abs[,c(14:514,1:13)] #Rearrange so that Spectra columns come first
tz<-strsplit(as.character(abs$TIME)," ")[[1]][[3]] #Extract the timezone
abs$TIME = as.POSIXct(as.character(abs$TIME),tz=tz) #Compute the time
myS<-Spectra(abs,Wavelengths=lbd,Units=Units,ShortName="a_nap")
myS<-Spectra(abs,Wavelengths=lbd, space=c("LONG","LAT"), time="TIME",Units=Units,ShortName="a_nap")
test_that("Spectra objects are created properly", {
  expect_is(myS, "Spectra")
  expect_equal(length(myS), 26)
  })

df2 <- data.frame(ch1=c(1,2,3,4), ch2=c(5,6,7,8), TIME=Sys.time()+1:4, LAT=1:4, LON=5:8)
attr(df2, "Units") <- "m-1"
attr(df2, "Wavelengths") <- c(500, 600)
attr(df2, "ShortName") <- "abs"
sptest <- spc.example_spectra()
test_that("Spectra object can be converted", {
  expect_is(as(sptest, "data.frame"), "data.frame")
  expect_is(as(as(sptest, "data.frame"), "Spectra"), "Spectra")
  expect_is(as(df2, "Spectra"), "Spectra")
})

test_that("Dim function provides correct dimensions for Spectra object", {
  expect_is(dim(sptest), "integer")
  expect_equal(dim(sptest), dim(sptest@Spectra))
})

test_that("ncol returns correct values", {
  expect_is(ncol(sptest), "integer")
  expect_equal(ncol(sptest), ncol(sptest@Spectra))
})

test_that("nrow returns correct values", {
  expect_is(nrow(sptest), "integer")
  expect_equal(nrow(sptest), nrow(sptest@Spectra))
  expect_equal(nrow(sptest), nrow(sptest@data))
})

# test_that("names() functions gives correct names for Spectra Object", {
#   expect_that(names(sptest), matches(names(sptest@data)))
# })

test_that("head() function returns correct values", {
  expect_is(head(sptest), "matrix")
  expect_equal(head(sptest), sptest@Spectra[1:6,])
})

test_that("Spectra objects can be extracted and replaced properly", {
  expect_equal(sptest[["CAST"]], sptest$CAST)
})

test_that("spc.colnames() provides correct ouput", {
  expect_is(spc.colnames(sptest), "character")
  expect_equal(length(spc.colnames(sptest)), ncol(sptest@Spectra))
})

sptest2 <- spc.rbind(sptest, sptest)
sptest3 <- spc.rbind(as(sptest, "STIDF"),as(sptest, "STIDF"))
test_that("spc.rbind combines Spectra objects correctly", {
  expect_is(sptest2, "Spectra")
  expect_equal(nrow(sptest2), 2*nrow(sptest))
  expect_is(sptest3, "STIDF")
  expect_equal(nrow(sptest2), 2*nrow(sptest))
})

test_that("spc.getwavelengths() returns correct output", {
  expect_is(spc.getwavelengths(sptest), "numeric")
  expect_equal(spc.getwavelengths(sptest), sptest@Wavelengths)
})

sptestwave <- spc.example_spectra()
spc.setwavelengths(sptestwave) <- 200:700

test_that("spc.setwavelengths() sets new wavelengths correctly", {
  expect_equal(range(sptestwave@Wavelengths), c(200,700))
})

test_that("spc.cname.construct() outputs correctly", {
  expect_equal(spc.cname.construct(sptest, "anap"), spc.colnames(sptest))
})

dat = SpcList(spc.Read_NOMAD_v2())
t_idx = spc.timeMatch((dat$kd), (dat$es))
test_that("spc.timeMatch() function ouputs correctly", {
  expect_equal(all(time(dat$es)[t_idx]==time(dat$kd)), TRUE)
})

test_that("spc.colMeans() function", {
  expect_is(spc.colMeans(sptest), "Spectra")
  expect_error(spc.colMeans(5))
})

test_that("spc.bbox2lines() function outputs correctly", {
  expect_is(spc.bbox2lines(sptest), "Lines")
})

headertest <- spc.example_spectra()
a <- new("SpcHeader")
a$Longitude = 123
a$Station = 5
spc.setheader(headertest) <- a
test_that("spc.getheader() gets correct headers", {
  expect_is(spc.getheader(headertest, "Station"), "numeric")
  expect_equal(spc.getheader(headertest, "Station"), headertest@header[[1]])
})

test_that("spc.setheader() sets headers correctly", {
  expect_equal(headertest@header$Longitude, a$Longitude)
})

headertest <- spc.updateheader(headertest, "Station", 11)
test_that("spc.updateheader() funciton updates header", {
  expect_is(headertest@header$Station, "numeric")
  expect_equal(headertest@header$Station, 11)
})

idx <- rep(FALSE, nrow(sptest))
idx[1:5] = TRUE
spc.setselected.idx(sptest) <- idx
gettest <- spc.getselected.idx(sptest)
x<- rep(TRUE, 5)
test_that("spc.getselected.idx() and spc.setselected.idx() work properly", {
  expect_equal(gettest[1:5], x)
  expect_is(gettest, "logical")
})



# test_that("spc.getinvalid.idx function", {
#   expect_equal(length(spc.getinvalid.idx(sptest)), 0)
# })
# 

sphead = spc.data2header(sptest, "CAST")
sphead2 = spc.data2header(sptest, "CAST", "ProjectCast")
test_that("spc.data2header() functions correctly", {
  expect_equal(sphead@header$CAST, sptest@data$CAST)
  expect_equal(sphead2@header$ProjectCast, sptest@data$CAST)
})
sptestdata = spc.example_spectra()
sptestdata = spc.updateheader(sptestdata, "Zone", "ZoneA")
sptestdata = spc.header2data(sptestdata, "Zone")
test_that("spc.header2data() sets fields correctly", {
  expect_equal(sptestdata@data$Zone, sptestdata$Zone)
})

sptestrep = rep(sptest, 4)
test_that("rep() function replicates rows correctly", {
  expect_is(dim(sptestrep), "integer")
  expect_equal(dim(sptestrep)[1], dim(sptest)[1]*4)
})

# lbd = as.numeric(c(412, 440, 490, 555, 670))
# sp2 = spc.interp.spectral(sptest[,lbd], c(430, 450, 500))
# test_that("spc.interp.spectral estimates wavelengths correctly", {
#   expect_equal()
# })

spc.export.text(sptest, "sptest.txt")
a = spc.import.text("sptest.txt")
test_that("spc.export.txt and spc.import.txt export and import accurately", {
  expect_is(a, "Spectra")
  expect_true(file.remove("sptest.txt"))
})


# test_that("spc.header.infos correctly determines presence of R code in header", {
#   expect_equal((spc.header.infos(sptest@header)=="NA"), TRUE)
# })

#write test for subset()

BL = spc.makeSpcList(sptest, "CAST")
test_that("spc.makeSpcList() creates spclist correctly from Spectra object", {
  expect_equal(length(unique(sptest$CAST)), length(BL))
  expect_is(BL, "SpcList")
})

test_that("spc.example_spectra creates spectra object", {
  expect_is(spc.example_spectra(), "Spectra")
})
