library(concordance)


### Name: concordance-package
### Title: Product Concordance
### Aliases: concord-package
### Keywords: concord, concordance, rauch, sigma, nomenclature, trade

### ** Examples

data(concord_data, package="concordance")
codes.of.origin <- concord_data$isic2 # Vector of values to be converted
concord(codes.of.origin, "isic2", "sitc4")

concord("00121", "sitc3", "hs")
## % Returns vector 10410

desc("8702", "hs")
## % Returns
## % [1] "Motor vehicles for the transport of ten or more persons, including the driver."
concord("8702", "hs", "sitc4")
## % [1] "78311" "78319"

desc("6522", "sitc1")
## % [1] "Cotton fabrics, woven, other than grey"
concord("6522", "sitc1", "hs")
## %  [1] "580310" "580219" "580124" "580125" "580126" "580123" "580122" "580121" "520941"
## % [10] "520949" "520823" "520829" "520951" "520943" "520821" "520921" "520822" "520839"
## % [19] "520851" "520939" "520959" "520852" "520843" "520942" "520849" "520931" "520842"
## % [28] "520952" "520929" "520922" "520833" "520932" "520832" "520841" "520859" "520853"
## % [37] "581100" "520831" "521149" "521041" "521143" "521152" "521159" "521031" "521214"
## % [46] "521051" "521121" "521222" "521059" "521129" "521213" "521142" "521039" "521049"
## % [55] "521132" "521139" "521225" "521224" "521022" "521032" "521151" "521215" "521029"
## % [64] "521212" "521122" "521052" "521021" "521042" "521131" "521223" "521141"

proddiff("020", "hs", setting="lib")
## % Returns "rauch
## % n r w 
## % 1 2 3"
proddiff("020", "hs", prop='w')
## % Returns "w 
## % 0.5" 

sigma("847", "HS")
# returns [1] 17.48601
sigma("847", "HS", "KOR")
# returns [1] 2.545708

listSigma(c("100","010"), "HS", "USA")
# Returns [[1]]
# [1]  2.6  2.3  4.2  1.4  9.6 11.6  2.1  7.1  3.9  1.8 15.9  5.7  1.6  2.7  5.7
# [16]  2.0  1.7  4.4  1.5  4.4  2.0  2.7  3.4
#
# [[2]]
# [1] 1.4



