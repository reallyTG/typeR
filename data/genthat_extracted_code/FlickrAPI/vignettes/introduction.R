## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval = FALSE--------------------------------------------------------
#  devtools::install_github("koki25ando/FlickrAPI")
#  library(FlickrAPI)
#  library(tidyverse)

## ----eval = FALSE--------------------------------------------------------
#  getPhotos(api_key="********************************", user_id="141696738@N08") %>%
#    head(10)

## ----eval = FALSE--------------------------------------------------------
#              id         owner     secret server farm                                      title ispublic isfriend isfamily
#  1  45961963324 141696738@N08 54cf68f345   4866    5              ゲームの王国 by Satoshi Ogawa        1        0        0
#  2  32754049638 141696738@N08 b3ec905568   7908    8                Château La Gontrie Moelleux        1        0        0
#  3  45655971285 141696738@N08 3bec35f74d   7811    8                       Bourgogne Blanc 2015        1        0        0
#  4  44738981240 141696738@N08 d427d73f71   4803    5                 Merchants by Reiner Knizia        1        0        0
#  5  45828425184 141696738@N08 ebdec86ca6   4818    5                              Opus One 2013        1        0        0
#  6  46543439611 141696738@N08 e5f7f72cdf   4908    5 Bowmore Craftsman's Selection No.0734/3000        1        0        0
#  7  44721578900 141696738@N08 70fc01d557   7823    8                      Santenay Louis Latour        1        0        0
#  8  45813615034 141696738@N08 c251e8478f   7812    8       Lord of The Flies by William Golding        1        0        0
#  9  31560667067 141696738@N08 45d79e6c9c   7901    8                 Suntory Plum Wine Yamazaki        1        0        0
#  10 45586263655 141696738@N08 8980ca72dc   4844    5                            Bourgogne Rouge        1        0        0

## ----eval = FALSE--------------------------------------------------------
#  getPhotoInfo(api_key="********************************", photo_id="45655971285",
#               output = "Location")

## ----eval = FALSE--------------------------------------------------------
#     latitude  longitude accuracy context locality._content  locality.place_id locality.woeid  region._content  region.place_id region.woeid country._content
#  1 35.058650 135.757094       16       0         Kyoto-shi 9cw_d0JQV7obLp8N5A       15015372 Kyoto Prefecture vAd3SUZTUb5ktGbw      2345871            Japan
#      country.place_id country.woeid           place_id    woeid
#  1 W3QedCZTUb5Ez.rF.Q      23424856 9cw_d0JQV7obLp8N5A 15015372

## ----eval = FALSE--------------------------------------------------------
#  getExif(api_key="********************************", photo_id="29827995436") %>%
#    head(10)

## ----eval = FALSE--------------------------------------------------------
#        photo.id photo.secret photo.server photo.farm   photo.camera photo.exif.tagspace photo.exif.tagspaceid   photo.exif.tag         photo.exif.label
#  1  29827995436   499ae58d17         8355          9 Sony ILCE-5100                JFIF                     0      JFIFVersion              JFIFVersion
#  2  29827995436   499ae58d17         8355          9 Sony ILCE-5100                JFIF                     0   ResolutionUnit          Resolution Unit
#  3  29827995436   499ae58d17         8355          9 Sony ILCE-5100                JFIF                     0      XResolution             X-Resolution
#  4  29827995436   499ae58d17         8355          9 Sony ILCE-5100                JFIF                     0      YResolution             Y-Resolution
#  5  29827995436   499ae58d17         8355          9 Sony ILCE-5100                IFD0                     0             Make                     Make
#  6  29827995436   499ae58d17         8355          9 Sony ILCE-5100                IFD0                     0            Model                    Model
#  7  29827995436   499ae58d17         8355          9 Sony ILCE-5100                IFD0                     0   ResolutionUnit          Resolution Unit
#  8  29827995436   499ae58d17         8355          9 Sony ILCE-5100                IFD0                     0         Software                 Software
#  9  29827995436   499ae58d17         8355          9 Sony ILCE-5100                IFD0                     0       ModifyDate Date and Time (Modified)
#  10 29827995436   499ae58d17         8355          9 Sony ILCE-5100                IFD0                     0 YCbCrPositioning        YCbCr Positioning
#                _content _content stat
#  1                 1.01     <NA>   ok
#  2               inches     <NA>   ok
#  3                  350  350 dpi   ok
#  4                  350  350 dpi   ok
#  5                 SONY     <NA>   ok
#  6            ILCE-5100     <NA>   ok
#  7               inches     <NA>   ok
#  8      ILCE-5100 v1.00     <NA>   ok
#  9  2016:09:14 19:04:36     <NA>   ok
#  10            Co-sited     <NA>   ok

