context("Eclipses and planetary phenomena")

test_that("Azimuth and altitude postions", {
  result <- swe_azalt(1234567,1,c(0,50,10),15,1013.25,c(186,22))
  expect_equal(result$xaz, c(114.636188,   8.210881,   8.209274),tolerance = .0000001)
  swe_close()
})

test_that("Ecliptic postions", {
  result <- swe_azalt_rev(1234567,0,c(0, 50,10),c(123,2))
  expect_equal(result$xout[1:2], c(166.0465305159982,  18.0853031826458),tolerance = .0000001)
  swe_close()
})

test_that("Equatorial postions", {
  result <- swe_azalt_rev(1234567,1,c(0, 50,10),c(123,2))
  expect_equal(result$xout[1:2], c(174.78989 , 22.12376),tolerance = .0000001)
  swe_close()
})


test_that("Rise time of Sun", {
  result <- swe_rise_trans_true_hor(1234567.5,0,"",4,1,c(0,50,10),1013.25,15,0)
  expect_equal(result$tret, 1234567.83559187, tolerance = .0000001)
  swe_close()
})

test_that("Heliacal rise of sirus", {
  result <- swe_heliacal_ut(1234567,c(0,50,10),c(1013.25,15,50,0.25),c(25,1,1,1,5,0.8),"sirius",1,260)
  expect_equal(result$return, 0)
  expect_equal(result$dret[1:3],c(1234768.64491623, 1234768.65345790, 1234768.66307595), tolerance=.000001)
  expect_equal(result$serr, "")
  swe_close()
})

test_that("Lunar eclipse conditions", {
  result <- swe_lun_eclipse_how(1234580.19960447,4,c(0,50,10))
  expect_equal(result$return, 16)
  expect_equal(result$attr[1:11],c(0.718169986750774,1.74556231683580,0 ,0,240.642969834840244,-0.351069739087650,0.185738292657396,  0.586663260830164  ,0.718169986750774,12,58))
  expect_equal(result$serr, "")
  swe_close()
})

test_that("Lunar eclipse at a certain location", {
  result <- swe_lun_eclipse_when_loc(1234567,4,c(0,50,10),FALSE)
  expect_equal(result$return, 20624)
  expect_equal(result$tret,c(1234580.19,0,0,1234580.23691550,0,0,0,1234580.28328264,1234580.19960447,0))
  expect_equal(result$attr[1:11],c(0.718169986750774,1.74556231683580,0 ,0,240.642969834840244,-0.351069739087650,0.185738292657396,  0.586663260830164  ,0.718169986750774,12,58))
  expect_equal(result$serr, "")
  swe_close()
})

test_that("Lunar eclipse on earth", {
  result <- swe_lun_eclipse_when(1234567,4,1,FALSE)
  expect_equal(result$return, 4)
  expect_equal(result$tret,c(1234580.16758062,0.00000000 ,1234580.09824349, 1234580.23691550, 1234580.16112524, 1234580.17402406, 1234580.05176974,
                             1234580.28328264  ,     0.00000000  ,     0.00000000  ,     0.00000000  ,     0.00000000 ,     0.00000000   ,    0.00000000,
                              0.00000000    ,   0.00000000 ,      0.00000000 ,      0.00000000    ,   0.00000000 ,     0.00000000))
  expect_equal(result$serr, "")
  swe_close()
})

test_that("Solar eclipse", {
  result <- swe_sol_eclipse_when_loc(1234567,4,c(0,50,10),FALSE)
  expect_equal(result$return, 4242)
  expect_equal(result$tret[1:7],c(1.23477168584597e+06, 1.23477163960865e+06,0,0,  1.23477171224360e+06,  1.23477168584597e+06,0))
  expect_equal(result$attr[1:11],c( 5.45656645429638e-01, 9.61071876161396e-01,4.36668429108189e-01 , 1.40827740655886e+02, 2.40581275123498e+02,-3.45422559148016e-01 , 1.90452771420542e-01, 2.31444434882052e-01, 5.45656645429638e-01, 43,11))
  expect_equal(result$serr, "")
  swe_close()
})

test_that("Phenomena of Moon (UT)", {
  result <- swe_pheno_ut(1234567,1,4)
  expect_equal(result$return, 4)
  expect_equal(result$attr[1:6],c(149.6307215971651772,0.0686075615100681,30.2944345224700591, 0.5180433249746146, -6.8235614464226826 , 0.9505687417907285))
  expect_equal(result$serr, "")
  swe_close()
})

test_that("Phenomena of Moon (ET)", {
  result <- swe_pheno(1234567,1,4)
  expect_equal(result$return, 4)
  expect_equal(result$attr[1:6],c(154.1161000624804274,0.0501597578258811, 25.8196104808596623, 0.5205532974955946, -6.4659828673145414, 0.9551682301559420))
  expect_equal(result$serr, "")
  swe_close()
})

test_that("Limiting visibility magnitude", {
  result <- swe_vis_limit_mag(1234567.5,c(0,50,10),c(1013.25,15,20,0.25),c(25,1,1,1,5,0.8),'sirius',260)
  expect_equal(result$return, 1)
  expect_equal(result$dret[1:8],c(5.96884644531082e+00  ,1.10797411875736e+01, 2.24100275575357e+02,-6.18080893675434e+01, 3.52678922475298e+02, -4.14868023984033e+01,   3.02677186429211e+02,-1.46), tolerance=.000001)
  expect_equal(result$serr, "")
  swe_close()
})

test_that("Heliacal event details", {
  result <- swe_heliacal_pheno_ut(1234567.5,c(0,50,10),c(1013.25,15,20,0.25),c(25,1,1,1,5,0.8),'sirius',2,260)
  expect_equal(result$return, 0)
  expect_equal(result$darr[1:28],c( 1.10797411875736e+01,   1.11584553531197e+01
                                    ,  1.10797335338164e+01,   2.24100275575357e+02
                                    ,-6.18080893675434e+01,   3.52678922475298e+02
                                    ,7.28878305551170e+01,   7.28878229013598e+01
                                    ,1.28578646899941e+02,   1.00572920775361e+02
                                    ,2.50000000000000e-01,   8.40408325195312e+00
                                    ,9.99999990000000e+07,   1.23456819963629e+06
                                    ,1.23456756274629e+06,   9.99999990000000e+07
                                    ,   0.00000000000000e+00,   0.00000000000000e+00
                                    ,   0.00000000000000e+00 , -7.65375721556438e-06
                                    ,  -1.46000000000000e+00,   1.23456756274629e+06
                                    ,   1.23456818424277e+06 , -6.21496487408876e-01
                                    ,   9.99999990000000e+07,   0.00000000000000e+00
                                ,  1.00572920775361e+02 ,  1.00000000000000e+02), tolerance=.000001)
  expect_equal(result$serr, "")
  swe_close()
})

test_that("Determine topocentric Arcusvisionis", {
  result <- swe_topo_arcus_visionis(1234567.5,c(0,50,10),c(1013.25,15,20,0.25),c(25,1,1,1,5,0.8),768,-1,124,2,120,0,-45)
  expect_equal(result$return, 0)
  expect_equal(result$tav,12.4801254272461, tolerance=.000001)
  expect_equal(result$serr, "")
  swe_close()
})

test_that("Determine Heliacal angle", {
  result <- swe_heliacal_angle(1234567.5,c(0,50,10),c(1013.25,15,20,0.25),c(25,1,1,1,5,0.8),768,-1,124,120,0,-45)
  expect_equal(result$return, 0)
  expect_equal(result$dret[1:3],c(3.468750, 11.569977, -8.101227), tolerance=.000001)
  expect_equal(result$serr, "")
  swe_close()
})

test_that("Topocentric to Apparent altitude", {
  result <- swe_refrac_extended(2,0,1013.25,15,-0.065,0)
  expect_equal(result$return, 2.2787088)
  expect_equal(result$dret[1:3], c(2.0000000, 2.2787088, 0.2787088), tolerance=.000001)
})

test_that("Apparent to Topocentric altitude", {
  result <- swe_refrac_extended(2,0,1013.25,15,-0.065,1)
  expect_equal(result$return, 1.701016)
  expect_equal(result$dret[1:3], c(1.701016, 2.000000, 0.298984), tolerance=.000001)
})
