library(subselect)


### Name: glhHmat
### Title: Total and Effect Deviation Matrices for General Linear
###   Hypothesis
### Aliases: glhHmat glhHmat.default glhHmat.formula glhHmat.data.frame
### Keywords: manip

### ** Examples

##----------------------------------------------------------------------------

## The following examples create T and H matrices for different analysis 
## of the MASS data set "crabs". This data records physical measurements 
## on 200 specimens of Leptograpsus variegatus crabs observed on the shores 
## of Western Australia. The crabs are classified by two factors, sex and sp 
## (crab species as defined by its colour: blue or orange), with two levels 
## each. The measurement variables include the carapace length (CL), 
## the carapace width (CW), the size of the frontal lobe (FL) and the size of 
## the rear width (RW). In the  analysis provided, we assume that there is 
## an interest in comparing the subsets of these variables measured in their 
## original and logarithmic scales.        

library(MASS)
data(crabs)
lFL <- log(crabs$FL)
lRW <- log(crabs$RW)
lCL <- log(crabs$CL)
lCW <- log(crabs$CW)

# 1)  Create the T and H matrices associated with a linear
# discriminant analysis on the groups defined by the sp factor.  
# This call is equivalent to ldaHmat(sp ~ FL + RW + CL + CW  + lFL +
# lRW + lCL + lCW,crabs) 

Hmat1 <- glhHmat(cbind(FL,RW,CL,CW,lFL,lRW,lCL,lCW) ~ sp,c(0,1),crabs)
Hmat1

##$mat
##           FL        RW         CL         CW        lFL        lRW        lCL
##FL  2431.2422 1623.4509  4846.9787  5283.6093 162.718609 133.360397 158.865134
##RW  1623.4509 1317.7935  3254.5776  3629.6883 109.877182 107.287243 108.335721
##CL  4846.9787 3254.5776 10085.3040 11096.5141 326.243285 269.564742 330.912570
##CW  5283.6093 3629.6883 11096.5141 12331.5680 356.317934 300.786770 364.620761
##lFL  162.7186  109.8772   326.2433   356.3179  11.114733   9.188391  10.910730
##lRW  133.3604  107.2872   269.5647   300.7868   9.188391   8.906350   9.130692
##lCL  158.8651  108.3357   330.9126   364.6208  10.910730   9.130692  11.088706
##lCW  152.7872  106.4277   321.0253   357.0051  10.503303   8.970570  10.765175
##          lCW
##FL  152.78716
##RW  106.42775
##CL  321.02534
##CW  357.00510
##lFL  10.50330
##lRW   8.97057
##lCL  10.76517
##lCW  10.54334

##$H
##           FL         RW        CL        CW        lFL        lRW        lCL
##FL  466.34580 247.526700 625.30650 518.41650 30.7408809 19.4543206 20.5494907
##RW  247.52670 131.382050 331.89975 275.16475 16.3166234 10.3259508 10.9072444
##CL  625.30650 331.899750 838.45125 695.12625 41.2193540 26.0856066 27.5540813
##CW  518.41650 275.164750 695.12625 576.30125 34.1733106 21.6265286 22.8439819
##lFL  30.74088  16.316623  41.21935  34.17331  2.0263971  1.2824024  1.3545945
##lRW  19.45432  10.325951  26.08561  21.62653  1.2824024  0.8115664  0.8572531
##lCL  20.54949  10.907244  27.55408  22.84398  1.3545945  0.8572531  0.9055117
##lCW  15.16136   8.047335  20.32933  16.85423  0.9994161  0.6324790  0.6680840
##           lCW
##FL  15.1613582
##RW   8.0473352
##CL  20.3293260
##CW  16.8542276
##lFL  0.9994161
##lRW  0.6324790
##lCL  0.6680840
##lCW  0.4929106

##$r
##[1] 1

##$call
##glhHmat.formula(formula = cbind(FL, RW, CL, CW, lFL, lRW, lCL,
##    lCW) ~ sp, C = c(0, 1), data = crabs)


# 2)  Create the T and H matrices associated with an analysis
# of the interactions between the sp and sex factors

Hmat2 <- glhHmat(cbind(FL,RW,CL,CW,lFL,lRW,lCL,lCW) ~ sp*sex,c(0,0,0,1),crabs)
Hmat2

##$mat
##           FL         RW         CL         CW        lFL        lRW        lCL
##FL  1960.3362 1398.52890  4199.1581  4747.5409 131.651804 115.607172 137.663744
##RW  1398.5289 1074.36105  3034.2793  3442.0233  95.176151  88.529040 100.659912
##CL  4199.1581 3034.27925  9135.6987 10314.2389 283.414814 251.877591 300.140005
##CW  4747.5409 3442.02325 10314.2389 11686.9387 320.883015 285.744945 339.253367
##lFL  131.6518   95.17615   283.4148   320.8830   9.065041   8.027569   9.509543
##lRW  115.6072   88.52904   251.8776   285.7449   8.027569   7.460222   8.516618
##lCL  137.6637  100.65991   300.1400   339.2534   9.509543   8.516618  10.090003
##lCW  137.2059  100.46203   298.6227   338.5254   9.473873   8.494741  10.037059
##           lCW
##FL  137.205863
##RW  100.462028
##CL  298.622747
##CW  338.525352
##lFL   9.473873
##lRW   8.494741
##lCL  10.037059
##lCW  10.011755

##$H
##            FL         RW        CL        CW        lFL        lRW        lCL
##FL   80.645000  68.389500 153.73350 191.57950  5.4708199  5.1596883  5.2140868
##RW   68.389500  57.996450 130.37085 162.46545  4.6394276  4.3755782  4.4217098
##CL  153.733500 130.370850 293.06205 365.20785 10.4290197  9.8359098  9.9396095
##CW  191.579500 162.465450 365.20785 455.11445 12.9964281 12.2573068 12.3865353
##lFL   5.470820   4.639428  10.42902  12.99643  0.3711311  0.3500245  0.3537148
##lRW   5.159688   4.375578   9.83591  12.25731  0.3500245  0.3301182  0.3335986
##lCL   5.214087   4.421710   9.93961  12.38654  0.3537148  0.3335986  0.3371158
##lCW   5.584150   4.735535  10.64506  13.26565  0.3788193  0.3572754  0.3610421
##           lCW
##FL   5.5841501
##RW   4.7355352
##CL  10.6450610
##CW  13.2656543
##lFL  0.3788193
##lRW  0.3572754
##lCL  0.3610421
##lCW  0.3866667

##$r
##[1] 1

##$call
##glhHmat.formula(formula = cbind(FL, RW, CL, CW, lFL, lRW, lCL,
##    lCW) ~ sp * sex, C = c(0, 0, 0, 1), data = crabs)

## 3)  Create the T and H matrices associated with an analysis
## of the effect of the sp factor after controlling for sex

C <- matrix(0.,2,4)
C[1,3] = C[2,4] = 1.
C

##       [,1] [,2] [,3] [,4]
##  [1,]    0    0    1    0
##  [2,]    0    0    0    1

Hmat3 <- glhHmat(cbind(FL,RW,CL,CW,lFL,lRW,lCL,lCW) ~ sp*sex,C,crabs)
Hmat3

##$mat
##           FL         RW         CL         CW        lFL        lRW        lCL
##FL  1964.8964 1375.92420  4221.6722  4765.1928 131.977728 113.906076 138.315643
##RW  1375.9242 1186.41150  2922.6779  3354.5236  93.560559  96.961292  97.428477
##CL  4221.6722 2922.67790  9246.8527 10401.3878 285.023931 243.479136 303.358489
##CW  4765.1928 3354.52360 10401.3878 11755.2667 322.144623 279.160241 341.776779
##lFL  131.9777   93.56056   285.0239   322.1446   9.088336   7.905989   9.556135
##lRW  113.9061   96.96129   243.4791   279.1602   7.905989   8.094783   8.273439
##lCL  138.3156   97.42848   303.3585   341.7768   9.556135   8.273439  10.183194
##lCW  137.6258   98.38041   300.6960   340.1509   9.503886   8.338091  10.097091
##           lCW
##FL  137.625801
##RW   98.380414
##CL  300.696018
##CW  340.150874
##lFL   9.503886
##lRW   8.338091
##lCL  10.097091
##lCW  10.050426

##$H
##            FL         RW         CL         CW        lFL         lRW
##FL   85.205200  45.784800 176.247600 209.231400  5.7967443  3.45859277
##RW   45.784800 170.046900  18.769500  74.965800  3.0238356 12.80782993
##CL  176.247600  18.769500 404.216100 452.356800 12.0381364  1.43745463
##CW  209.231400  74.965800 452.356800 523.442500 14.2580360  5.67260253
##lFL   5.796744   3.023836  12.038136  14.258036  0.3944254  0.22844463
##lRW   3.458593  12.807830   1.437455   5.672603  0.2284446  0.96467943
##lCL   5.865986   1.190274  13.158093  14.909948  0.4003070  0.09041999
##lCW   6.004088   2.653921  12.718332  14.891177  0.4088329  0.20062548
##            lCL        lCW
##FL   5.86598627  6.0040883
##RW   1.19027431  2.6539211
##CL  13.15809339 12.7183319
##CW  14.90994753 14.8911765
##lFL  0.40030704  0.4088329
##lRW  0.09041999  0.2006255
##lCL  0.43030750  0.4210740
##lCW  0.42107404  0.4253378

##$r
##[1] 2

##$call
##glhHmat.formula(formula = cbind(FL, RW, CL, CW, lFL, lRW, lCL,
##    lCW) ~ sp * sex, C = C, data = crabs)





