## ---- eval=F, install----------------------------------------------------
#  #library(devtools)
#  install_github("soodoku/virustotal")

## ---- eval=F, load-------------------------------------------------------
#  library(virustotal)

## ---- eval=F, api_key----------------------------------------------------
#  set_key("your_key")

## ---- eval=F,  domain----------------------------------------------------
#  domain_report("http://www.google.com")$categories

## ---- eval=F, scan_url---------------------------------------------------
#  scan_url("http://www.google.com")

## ---- eval=F, url--------------------------------------------------------
#  head(url_report("http://www.google.com")[, 1:2], 10)

## ---- eval=F, ip---------------------------------------------------------
#  ip_report("8.8.8.8")$country

## ---- eval=F, file-------------------------------------------------------
#  head(file_report("99017f6eebbac24f351415dd410d522d")[,1:2], 10)

## ---- eval=F, scan_file--------------------------------------------------
#  scan_file("using_virustotal.Rmd")[,1:2]

## ---- eval=F, rescan_file------------------------------------------------
#  rescan_file(hash='99017f6eebbac24f351415dd410d522d')[,1:2]

