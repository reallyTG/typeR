## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(colorSpec)

## ----echo=FALSE, results='asis'------------------------------------------
    includetable  <-  function( path, height ) {
        tmp1 <- URLencode( paste(readLines(path,warn=FALSE), collapse="\n"), reserved = TRUE  )
        
        tmp2 <- sprintf( '",  style="border: none; seamless:seamless; width: 900px; height: %s" ></iframe>', height )

        cat( '<iframe src="data:text/html;charset=utf-8,', tmp1 , tmp2 )    
    }

    includeplain  <-  function( path ) {
        tmp <- readLines(path,warn=FALSE)
        writeLines( tmp )    
    }

## ----echo=FALSE, results='asis'------------------------------------------
    includetable("tables/table-1.1.html", "550px" )

## ----echo=FALSE, results='asis'------------------------------------------
    includetable("tables/table-2.1.html", "640px" )

## ----echo=FALSE, results='asis'------------------------------------------
    includetable("tables/table-2.2.html", "240px" )

## ----echo=FALSE, results='asis'------------------------------------------
    includetable("tables/table-5.1.html", "430px" )

## ----echo=FALSE, results='asis'------------------------------------------
    includetable("tables/table-A.1.html", "400px" )

## ----echo=FALSE, results='asis'------------------------------------------
    includetable("tables/table-A.2.html", "400px" )

## ----echo=FALSE, results='asis'------------------------------------------
    includetable("tables/table-A.3.html", "200px" )

## ----echo=FALSE, results='asis'------------------------------------------
    includetable("tables/table-A.4.html", "100px" )

## ----echo=TRUE-----------------------------------------------------------
sunlight = readSpectra( system.file( 'extdata/illuminants/sunlight.txt', package='colorSpec' ) )
sunlight

## ----echo=FALSE, results='asis'------------------------------------------
    includetable("tables/table-B.1.html", "480px" )

## ----echo=FALSE, results='asis'------------------------------------------
    includetable("tables/table-B.2.html", "450px" )

## ----echo=FALSE, results='asis'------------------------------------------
    includetable("tables/table-B.3.html", "460px" )

## ----echo=FALSE, results='asis'------------------------------------------
    includetable("tables/table-C.1.html", "550px" )

## ----echo=FALSE, results='asis'------------------------------------------
    includetable("tables/table-C.2.html", "350px" )

## ----echo=FALSE, results='asis'------------------------------------------
    includeplain("proofs.txt")

## ---- echo=FALSE, results='asis'-----------------------------------------
sessionInfo()

