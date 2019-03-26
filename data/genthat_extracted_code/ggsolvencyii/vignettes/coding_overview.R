## ----init,echo=FALSE,results=FALSE,warnings=FALSE,message=FALSE----------
knitr::opts_chunk$set(collapse=TRUE,comment="#>",fig.path="z_coding_overview-")
library(ggplot2)
library(ggsolvencyii)
# library(magrittr)
# library(dplyr)
# library(tidyr)

## ----logo, out.width='25%', fig.align='right', echo=FALSE, border = FALSE----
knitr::include_graphics('images/logo_engels_rvignettes.png')

## ----tidyverse-----------------------------------------------------------
 head(sii_z_ex2_data,7)

## ----comparewithid_1-----------------------------------------------------
## the original data
      sii_z_ex1_data[sii_z_ex1_data$description == "SCR", ]

## ----comparewithid_2, echo = FALSE---------------------------------------
  testdata <- sii_z_ex1_data #contains comparewithid
 
    ## simulation of the route through ggplot
    ## only required aesthetics, comparewithid is always present in data passed to setupdata, if not filled as aesthetic it is the same as id
    testdata_ggplotformat <- dplyr::rename(testdata, x = time, y = ratio, id = id, description = description , value = value, comparewithid = comparewithid )
    ##  with connection
    testdata_ggplotformat <- dplyr::mutate(testdata_ggplotformat, group = 1)

    testparams <- NULL
    testparams$structure <- sii_z_ex1_structure
    testparams$levelmax <- sii_levelmax_sf16_995
    testparams$aggregatesuffix <- "_other"

    vignetteCa <- ggsolvencyii:::fn_setupdata_outline(data = testdata_ggplotformat, params = testparams)
    vignetteCb <- vignetteCa[vignetteCa$description ==  "SCR",c("description","id","x","y", "value")]
    vignetteCc <- nrow(vignetteCa[vignetteCb$description ==  "SCR",])
    ##  without connection
    
    testdata_ggplotformat$comparewithid = testdata_ggplotformat$id
    vignetteBa <- ggsolvencyii:::fn_setupdata_outline(data = testdata_ggplotformat, params = testparams)
    vignetteBb <- vignetteBa[vignetteBa$description ==  "SCR",c("description","id","x","y", "value")]
    vignetteBc <-nrow(vignetteBb[vignetteBb$description ==  "SCR",])
        
    message("without passing the aesthetic 'comparewithid`: 10 lines of data")
    vignetteBb
    message("and with passing passing the aesthetic 'comparewithid': 9 lines of data")
    vignetteCb

## ----structure-----------------------------------------------------------
 head(sii_structure_sf16_eng, 15)

## ----levelmax------------------------------------------------------------
sii_levelmax_sf16_995

## ----expanded, echo=FALSE------------------------------------------------
    testdata <- sii_z_ex2_data

    testparams <- NULL
    testparams$structure <- sii_structure_sf16_eng
    testparams$levelmax <- sii_levelmax_sf16_995
    testparams$aggregatesuffix <- "_other"
 
    vignetteA <- ggsolvencyii:::fn_structure_expansion(testparams)
    vignetteA_show <- vignetteA
    vignetteA_show <- vignetteA_show[vignetteA_show$level %in% c("3", "4.01","4.01d","4.01o"),]
    vignetteA_show <- dplyr::select(.data = vignetteA_show, description,level,childlevel,levelmax)
    vignetteA_show
    

## ----plotdetails---------------------------------------------------------
sii_z_ex1_plotdetails

