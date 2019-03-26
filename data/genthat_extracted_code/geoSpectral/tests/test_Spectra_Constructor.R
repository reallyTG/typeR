library(geoSpectral)
context("Constructor Function for Spectra class")

sp <- spc.example_spectra()

test_that("Output of Spectra() is of type 'Spectra' ", {
  expect_is(sp,"Spectra")
  expect_equal(nrow(sp), 26)
})

# test_that("Conversion to/from data.frame", {
#   expect_is(as(sp, "data.frame"),"data.frame")
#   expect_is(as(as(sp, "data.frame"), "Spectra"), "Spectra")
# })
dim(sp)
c=dim(sp)
a=spc.getwavelengths(sp)
test_that("Dimension is integer or null or equal to numbers of row and column", {
  expect_is(dim(sp),"integer")
  expect_is(sp@header, "SpcHeader" )
  expect_equal(c[1]+c[2], ncol(sp)+nrow(sp))
  expect_equal(length(a),ncol(sp))
  })
nc=dim(sp)
test_that("nuber of row and column are equal to output of ncol and nrow", {
  expect_equal(ncol(sp),nc[2] )
  expect_equal(nrow(sp),nc[1] )
  expect_is(ncol(sp),"integer")
  expect_is(nrow(sp),"integer")
})

test_that("Test for names() ", {
  
  expect_is(names(sp),"character")
  expect_equal(length(names(sp)),512)
})

hd=head(sp,7)
test_that("Tests for head()", {
  expect_equal(length(hd[,1]),7)
  expect_equal(dim(hd)[2],ncol(hd))
  expect_equal(dim(sp)[2],ncol(hd))
  expect_equal(dim(hd)[2],ncol(sp))          
  expect_is(hd,"matrix")
})

test_that("test for spc.colnames()", {
  expect_is(spc.colnames(sp),"character")
  expect_equal(length(spc.colnames(sp)),ncol(sp))
  a = "anap_300" %in% spc.colnames(sp)
  expect_equal(a,TRUE)
})

test_that("rbind test for Spectral object" ,{
  expect_equal(length(spc.rbind(sp,sp)),length(sp)*2)
})

test_that("Show Spectra",{
  expect_output(show(sp),"501 spectral channels in columns and 26 observations in rows")
  
  })

test_that("test for head()",{
  expect_equal(ncol(sp),ncol(head(sp)))
  expect_equal(sp@Spectra[1:6,3],head(sp)[,3])
  # names(sp@spectra) and names(head(sp)) are NULL why?
  })

#spc.plot.grid(sp)
#Show Traceback

#Rerun with Debug
#Error in (function (classes, fdef, mtable)  : 

#       spc.plot.overlay(sp)
#Error in (function (classes, fdef, mtable)  :    
#Error in (function (classes, fdef, mtable)  : 
#

 test_that("test for subset()",{
  expect_is(subset(sp,DEPTH<=30),"Spectra")
  expect_equal(ncol(sp),ncol(subset(sp,DEPTH<=30)))
 
                })

  test_that("test for spc.lapply()",{
   sp=spc.example_spectra()
   BL = spc.makeSpcList(sp,"STATION")
   BL2=spc.lapply(BL, function(x) x=x+1)
    expect_is(BL2,"SpcList")


  })

  test_that("test for spc.getwavelenghts()",{
    
    expect_equal(length(spc.getwavelengths(sp)),ncol(sp))
    
    
  })
  
  
  test_that("test for spc.updateheader()",{
    sp <- spc.updateheader(sp,"Station", 11)
    expect_equal(as.numeric(sp@header[1]),11)
    
    
  })
  
  
  test_that("test for spc.gethader()",{
    aa=sp@header
    expect_equal(names(aa),names(spc.getheader(sp)))
    #expect_output(names(aa),names(spc.getheader(sp)))
    
  })
  
  
  test_that("test for spc.getinvalid()",{
    abc=spc.getinvalid.idx(sp)
    expect_true(all(abc))
    
    
  })
  
  # test_that("test for spc.plot.map.rbokeh()",{
  #   
  #   expect_warning( spc.plot.map.rbokeh(sp),NA)
  #   expect_warning( spc.plot.map.rbokeh(sp, hover = "Snap"),NA)
  #   expect_warning( spc.plot.map.rbokeh(sp,glyph = 4 ),NA)
  #   expect_warning( spc.plot.map.rbokeh(sp,color=" #0000ff " ),NA)
  #   
  #   
  #    })
  # 
  # test_that("test for spc.plot.map.leaflet()",{
  #   
  #   expect_warning( spc.plot.map.leaflet(sp),NA)
  #   expect_warning( spc.plot.map.leaflet(sp,weight=100 ),NA)
  #  
  # })
  # 
  # 
  
  
  
  
  
 


