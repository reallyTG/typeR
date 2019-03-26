## ---- eval=FALSE---------------------------------------------------------
#  library(reconstructr)
#  data("session_dataset")
#  
#  str(session_dataset)
#  'data.frame':	63524 obs. of  3 variables:
#   $ uuid     : chr  "47dc43895814861e21a2edf93348c826" "a736822df1890011694e7049cb3abef3" "674d2d00e096a3319874a4347caa1f4a" "f62d315398e6d04a3f2fa02e8ae42d49" ...
#   $ timestamp: POSIXlt, format: "2014-01-07 00:00:15" "2014-01-07 00:01:11" "2014-01-07 00:01:54" ...
#   $ url      : chr  "https://www.nasa.gov/history/mercury/mercury.html" "https://www.nasa.gov/images/ksclogosmall.gif" "https://www.nasa.gov/elv/hot.gif" "https://www.nasa.gov/facts/faq04.html" ...
#  
#  sessionised_data <- sessionise(x = session_dataset, timestamp = timestamp, user_id = uuid,
#                                 threshold = 1800)
#  
#  str(sessionised_data)
#  'data.frame':	63524 obs. of  5 variables:
#   $ uuid      : chr  "0005839b3e8483d50870f61f50307fa7" "000b047bad36484451f12c114ab5eb28" "000b047bad36484451f12c114ab5eb28" "000b047bad36484451f12c114ab5eb28" ...
#   $ timestamp : POSIXlt, format: "2014-01-14 12:47:59" "2014-01-07 14:25:11" "2014-01-09 12:47:17" ...
#   $ url       : chr  "https://www.nasa.gov/history/apollo/images/footprint-logo.gif" "https://www.nasa.gov/ksc.html" "https://www.nasa.gov/biomed/threat/gif/beachmousefinsmall.gif" "https://www.nasa.gov/shuttle/resources/orbiters/atlantis.html" ...
#   $ session_id: chr  "09cd65049020ed55472a2d8b1f47787e" "9dcb2f610297b3fe2c810907fa90fb8e" "70bcde51eff332d4ac820a90930f0f6e" "70bcde51eff332d4ac820a90930f0f6e" ...
#   $ time_delta: int  NA NA NA 45 4 75 274 47 NA 28 ...

## ---- eval=FALSE---------------------------------------------------------
#  
#  str(bounce_rate(sessionised_data))
#  
#  num 20.7
#  
#  str(bounce_rate(sessionised_data, user_id = uuid))
#  
#  'data.frame':	10000 obs. of  2 variables:
#   $ user_id    : chr  "0005839b3e8483d50870f61f50307fa7" "000b047bad36484451f12c114ab5eb28" "000b2bc1a5438d8d54d4fbec139a2fd5" "001b6e80a14ba8d809c4ff18cdbade40" ...
#   $ bounce_rate: num  100 14.3 0 100 100 ...

## ---- eval=FALSE---------------------------------------------------------
#  
#  str(time_on_page(sessionised_data))
#  
#  num 146
#  
#  str(time_on_page(sessionised_data, by_session = TRUE))
#  
#  'data.frame':	22226 obs. of  2 variables:
#   $ session_id  : chr  "00011b1e098848edee7e50a2174fe6ef" "0001f6457a4d09a8c2092278fec89a89" "000451f0869b7eab3582c093ace0253d" "0004c56ace95f92ee12bf9552401f923" ...
#   $ time_on_page: num  NaN NaN NaN NaN NaN ...

