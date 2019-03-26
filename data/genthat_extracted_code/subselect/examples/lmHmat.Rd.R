library(subselect)


### Name: lmHmat
### Title: Total and Effect Deviation Matrices for Linear Regression and
###   Canonical Correlation Analysis
### Aliases: lmHmat lmHmat.default lmHmat.formula lmHmat.data.frame
###   lmHmat.lm
### Keywords: manip

### ** Examples

##------------------------------------------------------------------

## 1)  An example of subset selection in the context of Multiple
## Linear Regression. Variable 5 (average price) in the Cars93 MASS
## library is to be regressed on 13 other  variables.  The goal is to
## compare subsets of these 13 variables according to their  ability
## to predict car prices. 

library(MASS)
data(Cars93)
CarsHmat1 <- lmHmat(Cars93[c(7:8,12:15,17:22,25)],Cars93[5])
CarsHmat1

##$mat
##                       MPG.city  MPG.highway   EngineSize    Horsepower
##MPG.city              31.582281    28.283427   -4.1391655 -1.979799e+02
##MPG.highway           28.283427    28.427302   -3.4667602 -1.728655e+02
##EngineSize            -4.139165    -3.466760    1.0761220  3.977700e+01
##Horsepower          -197.979897  -172.865475   39.7769986  2.743079e+03
##RPM                 1217.478962   997.335203 -339.1637447  1.146634e+03
##Rev.per.mile        1941.631019  1555.243104 -424.4118163 -1.561070e+04
##Fuel.tank.capacity   -14.985799   -13.743654    2.5830820  1.222536e+02
##Passengers            -2.433964    -2.583567    0.4017181  5.040907e-01
##Length               -54.673329   -42.267765   11.8197055  4.212964e+02
##Wheelbase            -25.567087   -22.375760    5.1819425  1.738928e+02
##Width                -15.302127   -12.902291    3.3992286  1.275437e+02
##Turn.circle          -12.071061   -10.202782    2.6029453  9.474252e+01
##Weight             -2795.094670 -2549.654628  517.1327139  2.282550e+04
##                            RPM Rev.per.mile Fuel.tank.capacity   Passengers
##MPG.city              1217.4790    1941.6310         -14.985799   -2.4339645
##MPG.highway            997.3352    1555.2431         -13.743654   -2.5835671
##EngineSize            -339.1637    -424.4118           2.583082    0.4017181
##Horsepower            1146.6339  -15610.7036         122.253612    0.5040907
##RPM                 356088.7097  146589.3233        -652.324684 -289.6213184
##Rev.per.mile        146589.3233  246518.7295        -992.747020 -172.8003740
##Fuel.tank.capacity    -652.3247    -992.7470          10.754271    1.6085203
##Passengers            -289.6213    -172.8004           1.608520    1.0794764
##Length               -3844.9158   -5004.3139          33.063850    7.3626695
##Wheelbase            -1903.7693   -2156.2932          16.944811    4.9177186
##Width                -1217.0933   -1464.3712           9.898282    1.9237962
##Turn.circle           -972.5806   -1173.3281           7.096283    1.5037401
##Weight             -150636.1325 -215349.6757        1729.468268  339.0953717
##                        Length    Wheelbase        Width  Turn.circle
##MPG.city             -54.67333   -25.567087   -15.302127   -12.071061
##MPG.highway          -42.26777   -22.375760   -12.902291   -10.202782
##EngineSize            11.81971     5.181942     3.399229     2.602945
##Horsepower           421.29640   173.892824   127.543712    94.742520
##RPM                -3844.91585 -1903.769285 -1217.093268  -972.580645
##Rev.per.mile       -5004.31393 -2156.293245 -1464.371201 -1173.328074
##Fuel.tank.capacity    33.06385    16.944811     9.898282     7.096283
##Passengers             7.36267     4.917719     1.923796     1.503740
##Length               213.22955    82.021973    45.367929    34.780622
##Wheelbase             82.02197    46.507948    20.803062    15.899836
##Width                 45.36793    20.803062    14.280739     9.962015
##Turn.circle           34.78062    15.899836     9.962015    10.389434
##Weight              6945.16129  3507.549088  1950.471599  1479.365358
##                         Weight
##MPG.city             -2795.0947
##MPG.highway          -2549.6546
##EngineSize             517.1327
##Horsepower           22825.5049
##RPM                -150636.1325
##Rev.per.mile       -215349.6757
##Fuel.tank.capacity    1729.4683
##Passengers             339.0954
##Length                6945.1613
##Wheelbase             3507.5491
##Width                 1950.4716
##Turn.circle           1479.3654
##Weight              347977.8927

##$H
##                        MPG.city   MPG.highway    EngineSize   Horsepower
##MPG.city              11.1644681     9.9885440   -2.07077758  -137.938111
##MPG.highway            9.9885440     8.9364770   -1.85266802  -123.409453
##EngineSize            -2.0707776    -1.8526680    0.38408635    25.584662
##Horsepower          -137.9381108  -123.4094525   25.58466246  1704.239046
##RPM                    9.8795182     8.8389345   -1.83244599  -122.062428
##Rev.per.mile         707.3855707   632.8785101 -131.20537141 -8739.818920
##Fuel.tank.capacity    -6.7879209    -6.0729671    1.25901874    83.865437
##Passengers            -0.2008651    -0.1797085    0.03725632     2.481709
##Length               -24.5727044   -21.9845261    4.55772770   303.598201
##Wheelbase            -11.4130722   -10.2109633    2.11688849   141.009639
##Width                 -5.7581866    -5.1516920    1.06802435    71.142967
##Turn.circle           -4.2281864    -3.7828426    0.78424099    52.239662
##Weight             -1275.6139645 -1141.2569026  236.59996884 15760.337110
##                            RPM Rev.per.mile Fuel.tank.capacity    Passengers
##MPG.city               9.879518    707.38557         -6.7879209  -0.200865141
##MPG.highway            8.838935    632.87851         -6.0729671  -0.179708544
##EngineSize            -1.832446   -131.20537          1.2590187   0.037256323
##Horsepower          -122.062428  -8739.81892         83.8654369   2.481708752
##RPM                    8.742457    625.97059         -6.0066801  -0.177747010
##Rev.per.mile         625.970586  44820.25860       -430.0856347 -12.726903044
##Fuel.tank.capacity    -6.006680   -430.08563          4.1270099   0.122124645
##Passengers            -0.177747    -12.72690          0.1221246   0.003613858
##Length               -21.744563  -1556.93728         14.9400378   0.442098962
##Wheelbase            -10.099510   -723.13724          6.9390706   0.205337894
##Width                 -5.095461   -364.84122          3.5009384   0.103598215
##Turn.circle           -3.741553   -267.89973          2.5707087   0.076071269
##Weight             -1128.799984 -80823.45772        775.5646486  22.950164550
##                         Length    Wheelbase        Width   Turn.circle
##MPG.city             -24.572704  -11.4130722   -5.7581866   -4.22818636
##MPG.highway          -21.984526  -10.2109633   -5.1516920   -3.78284262
##EngineSize             4.557728    2.1168885    1.0680243    0.78424099
##Horsepower           303.598201  141.0096393   71.1429669   52.23966202
##RPM                  -21.744563  -10.0995098   -5.0954608   -3.74155256
##Rev.per.mile       -1556.937281 -723.1372362 -364.8412174 -267.89973369
##Fuel.tank.capacity    14.940038    6.9390706    3.5009384    2.57070866
##Passengers             0.442099    0.2053379    0.1035982    0.07607127
##Length                54.083885   25.1198756   12.6736193    9.30612843
##Wheelbase             25.119876   11.6672121    5.8864067    4.32233724
##Width                 12.673619    5.8864067    2.9698426    2.18072961
##Turn.circle            9.306128    4.3223372    2.1807296    1.60129079
##Weight              2807.593227 1304.0186214  657.9107222  483.09812289
##                         Weight
##MPG.city            -1275.61396
##MPG.highway         -1141.25690
##EngineSize            236.59997
##Horsepower          15760.33711
##RPM                 -1128.79998
##Rev.per.mile       -80823.45772
##Fuel.tank.capacity    775.56465
##Passengers             22.95016
##Length               2807.59323
##Wheelbase            1304.01862
##Width                 657.91072
##Turn.circle           483.09812
##Weight             145747.29199

##$r
##[1] 1

##$call
##lmHmat.data.frame(x = Cars93[c(7:8, 12:15, 17:22, 25)], y = Cars93[5])


## 2)  An example of subset selection in the context of Canonical
## Correlation Analysis. Two groups of variables within the Cars93
## MASS library data set are compared. The first group (variables 4th,
## 5th and 6th) relates to price, while the second group is formed by 13
## variables that describe several technical car specifications. The
## goal is to select subsets of the second group that are optimal in
## terms of preserving the canonical correlations with the variables in
## the first group (Warning: the 3-variable "response" group is kept
## intact; subset selection is to be performed only in the 13-variable
## group).  

library(MASS)
data(Cars93)
CarsHmat2 <- lmHmat(Cars93[c(7:8,12:15,17:22,25)],Cars93[4:6])

names(Cars93[4:6])
## [1] "Min.Price" "Price"     "Max.Price"

CarsHmat2

##$mat
##                       MPG.city  MPG.highway   EngineSize    Horsepower
##MPG.city              31.582281    28.283427   -4.1391655 -1.979799e+02
##MPG.highway           28.283427    28.427302   -3.4667602 -1.728655e+02
##EngineSize            -4.139165    -3.466760    1.0761220  3.977700e+01
##Horsepower          -197.979897  -172.865475   39.7769986  2.743079e+03
##RPM                 1217.478962   997.335203 -339.1637447  1.146634e+03
##Rev.per.mile        1941.631019  1555.243104 -424.4118163 -1.561070e+04
##Fuel.tank.capacity   -14.985799   -13.743654    2.5830820  1.222536e+02
##Passengers            -2.433964    -2.583567    0.4017181  5.040907e-01
##Length               -54.673329   -42.267765   11.8197055  4.212964e+02
##Wheelbase            -25.567087   -22.375760    5.1819425  1.738928e+02
##Width                -15.302127   -12.902291    3.3992286  1.275437e+02
##Turn.circle          -12.071061   -10.202782    2.6029453  9.474252e+01
##Weight             -2795.094670 -2549.654628  517.1327139  2.282550e+04
##                            RPM Rev.per.mile Fuel.tank.capacity   Passengers
##MPG.city              1217.4790    1941.6310         -14.985799   -2.4339645
##MPG.highway            997.3352    1555.2431         -13.743654   -2.5835671
##EngineSize            -339.1637    -424.4118           2.583082    0.4017181
##Horsepower            1146.6339  -15610.7036         122.253612    0.5040907
##RPM                 356088.7097  146589.3233        -652.324684 -289.6213184
##Rev.per.mile        146589.3233  246518.7295        -992.747020 -172.8003740
##Fuel.tank.capacity    -652.3247    -992.7470          10.754271    1.6085203
##Passengers            -289.6213    -172.8004           1.608520    1.0794764
##Length               -3844.9158   -5004.3139          33.063850    7.3626695
##Wheelbase            -1903.7693   -2156.2932          16.944811    4.9177186
##Width                -1217.0933   -1464.3712           9.898282    1.9237962
##Turn.circle           -972.5806   -1173.3281           7.096283    1.5037401
##Weight             -150636.1325 -215349.6757        1729.468268  339.0953717
##                        Length    Wheelbase        Width  Turn.circle
##MPG.city             -54.67333   -25.567087   -15.302127   -12.071061
##MPG.highway          -42.26777   -22.375760   -12.902291   -10.202782
##EngineSize            11.81971     5.181942     3.399229     2.602945
##Horsepower           421.29640   173.892824   127.543712    94.742520
##RPM                -3844.91585 -1903.769285 -1217.093268  -972.580645
##Rev.per.mile       -5004.31393 -2156.293245 -1464.371201 -1173.328074
##Fuel.tank.capacity    33.06385    16.944811     9.898282     7.096283
##Passengers             7.36267     4.917719     1.923796     1.503740
##Length               213.22955    82.021973    45.367929    34.780622
##Wheelbase             82.02197    46.507948    20.803062    15.899836
##Width                 45.36793    20.803062    14.280739     9.962015
##Turn.circle           34.78062    15.899836     9.962015    10.389434
##Weight              6945.16129  3507.549088  1950.471599  1479.365358
##                         Weight
##MPG.city             -2795.0947
##MPG.highway          -2549.6546
##EngineSize             517.1327
##Horsepower           22825.5049
##RPM                -150636.1325
##Rev.per.mile       -215349.6757
##Fuel.tank.capacity    1729.4683
##Passengers             339.0954
##Length                6945.1613
##Wheelbase             3507.5491
##Width                 1950.4716
##Turn.circle           1479.3654
##Weight              347977.8927

##$H
##                        MPG.city   MPG.highway    EngineSize   Horsepower
##MPG.city              12.6374638    11.1802504   -2.44856549  -149.055525
##MPG.highway           11.1802504     9.9241995   -2.15551417  -132.381671
##EngineSize            -2.4485655    -2.1555142    0.48131168    28.438641
##Horsepower          -149.0555255  -132.3816709   28.43864077  1788.168412
##RPM                  116.9463468    90.2758380  -29.90735790  -935.019669
##Rev.per.mile         850.6791690   744.7148717 -168.44221351 -9825.172173
##Fuel.tank.capacity    -7.3863845    -6.5473387    1.41367337    88.391549
##Passengers            -0.2756475    -0.2507147    0.05519028     3.036255
##Length               -29.0878749   -25.4205633    5.74148535   337.880225
##Wheelbase            -12.4579187   -11.0208656    2.38906697   148.928887
##Width                 -6.8768553    -6.0641799    1.35405290    79.579106
##Turn.circle           -4.9652258    -4.3460777    0.97719452    57.833523
##Weight             -1399.0819460 -1239.6883974  268.43952022 16693.580681
##                             RPM Rev.per.mile Fuel.tank.capacity   Passengers
##MPG.city              116.946347    850.67917         -7.3863845  -0.27564745
##MPG.highway            90.275838    744.71487         -6.5473387  -0.25071469
##EngineSize            -29.907358   -168.44221          1.4136734   0.05519028
##Horsepower           -935.019669  -9825.17217         88.3915487   3.03625516
##RPM                  8930.289631  11941.01945        -51.6620352  -3.30491485
##Rev.per.mile        11941.019450  59470.19917       -490.0061258 -18.17896445
##Fuel.tank.capacity    -51.662035   -490.00613          4.3742368   0.14814085
##Passengers             -3.304915    -18.17896          0.1481409   0.01208827
##Length               -397.601848  -2033.81167         16.8646785   0.57474210
##Wheelbase             -93.828737   -830.92582          7.3783050   0.24261242
##Width                 -84.771418   -472.37388          3.9523474   0.16370704
##Turn.circle           -64.578815   -345.33527          2.8839031   0.09876958
##Weight             -10423.776629 -93087.56026        826.3348263  28.56899347
##                          Length    Wheelbase        Width   Turn.circle
##MPG.city             -29.0878749  -12.4579187   -6.8768553   -4.96522585
##MPG.highway          -25.4205633  -11.0208656   -6.0641799   -4.34607767
##EngineSize             5.7414854    2.3890670    1.3540529    0.97719452
##Horsepower           337.8802249  148.9288871   79.5791065   57.83352310
##RPM                 -397.6018484  -93.8287370  -84.7714184  -64.57881537
##Rev.per.mile       -2033.8116669 -830.9258201 -472.3738765 -345.33527111
##Fuel.tank.capacity    16.8646785    7.3783050    3.9523474    2.88390313
##Passengers             0.5747421    0.2426124    0.1637070    0.09876958
##Length                69.9185456   28.6482825   16.0342179   11.86931842
##Wheelbase             28.6482825   12.4615297    6.6687394    4.89477408
##Width                 16.0342179    6.6687394    3.8217667    2.73004255
##Turn.circle           11.8693184    4.8947741    2.7300425    2.01640426
##Weight              3199.4701647 1393.7884808  751.2183342  546.92139008
##                         Weight
##MPG.city            -1399.08195
##MPG.highway         -1239.68840
##EngineSize            268.43952
##Horsepower          16693.58068
##RPM                -10423.77663
##Rev.per.mile       -93087.56026
##Fuel.tank.capacity    826.33483
##Passengers             28.56899
##Length               3199.47016
##Wheelbase            1393.78848
##Width                 751.21833
##Turn.circle           546.92139
##Weight             156186.68328

##$r
##[1] 3

##$call
##lmHmat.data.frame(x = Cars93[c(7:8, 12:15, 17:22, 25)], y = Cars93[4:6])





