# Name : test-00.R
context("RequeteODBC")

test_that("Test that RequeteODBC works on a database ", {
        skip_on_cran()
        # this requires an odbc link to be setup for test here a database bd_contmig_nat used for stacomir
        # the odbc link is bd_contmig_nat and points to database bd_contmig_nat
        # userlocal and passwordlocal are generated from Rprofile.site
        require(stacomirtools)
        req<-new("RequeteODBC")
        req@sql<-"select * from iav.t_lot_lot limit 10"
        req@baseODBC <- c("bd_contmig_nat",userlocal,passwordlocal)
        req<-connect(req)
        expect_that(req@connection,is_a("RODBC"))
    })

test_that("Test that RequeteODBC returns the sql string when envir_stacomi and showmerequest ", {
      skip_on_cran()
      require(stacomirtools)
      envir_stacomi <- new.env()
      assign("showmerequest",1,envir_stacomi)
      req<-new("RequeteODBC")
      req@sql<-"select * from iav.t_lot_lot limit 10"
      req@baseODBC <- c("bd_contmig_nat",userlocal,passwordlocal)   
      expect_output(connect(req),"select \\* from iav\\.t_lot_lot limit 10")
    })

