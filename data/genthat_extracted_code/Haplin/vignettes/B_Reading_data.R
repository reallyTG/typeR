## ----setup,include=FALSE-------------------------------------------------
knitr::opts_chunk$set( echo = TRUE )
library( Haplin, quietly = TRUE )

## ----eval=FALSE----------------------------------------------------------
#  my.gen.data <- genDataRead( file.in = "my_gen_data.ped", file.out =
#    "my_saved_gen_data", dir.out = ".", format = "ped" )
#  my.gen.data.haplin <- genDataRead( file.in = "my_gen_data_hap.dat",
#    file.out = "my_saved_gen_data_hap", dir.out = ".", format = "haplin", n.vars = 0 )

## ----eval=FALSE----------------------------------------------------------
#  my.gen.data.haplin2 <- genDataRead( file.in = "my_gen_data_hap.dat",
#    file.out = "my_saved_gen_data_hap2", cov.file.in = "add_cov.dat",
#    dir.out = ".", format = "haplin" )

## ----eval=FALSE----------------------------------------------------------
#  ?genDataRead

## ----eval=FALSE----------------------------------------------------------
#  my.prepared.gen.data <- genDataPreprocess( data.in = my.gen.data, map.file =
#    "my_gen_data.map", design = "triad", file.out = "my_prepared_gen_data",
#    dir.out = "." )

## ----eval=FALSE----------------------------------------------------------
#  gen.data.subset <- genDataGetPart( data.in = my.gen.data, markers = c( 3:15,22 ),
#    file.out = "my_gen_data_subset", dir.out = "." )

## ----eval=FALSE----------------------------------------------------------
#  my.prepared.gen.data <- genDataLoad( filename = "my_prepared_gen_data",
#    dir.in = "." )

