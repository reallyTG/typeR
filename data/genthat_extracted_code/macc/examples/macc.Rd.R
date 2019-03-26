library(macc)


### Name: macc
### Title: Mediation Analysis of Causality under Confounding
### Aliases: macc
### Keywords: models

### ** Examples

# Examples with simulated data
  
  ##############################################################################
  # Single level mediation model
  # Data was generated with 500 independent trials. The correlation between model errors is 0.5.
  data(env.single)
  data.SL<-get("data1",env.single)
  
  ## Example 1: Given delta is 0.5.
  macc(data.SL,model.type="single",delta=0.5)
  # $Coefficients
  #       Estimate        SE          LB          UB
  # A    0.3572722 0.1483680  0.06647618  0.64806816
  # C    0.8261253 0.2799667  0.27740060  1.37485006
  # B   -0.9260217 0.1599753 -1.23956743 -0.61247594
  # C2   0.4952836 0.2441369  0.01678400  0.97378311
  # ABp -0.3308418 0.1488060 -0.62249617 -0.03918738
  # ABd -0.3308418 0.3714623 -1.05889442  0.39721087
  
  ## Example 2: Assume the errors are independent.
  macc(data.SL,model.type="single",delta=0)
  # $Coefficients
  #          Estimate         SE          LB        UB
  # A    0.3572721688 0.14836803  0.06647618 0.6480682
  # C    0.4961424716 0.24413664  0.01764345 0.9746415
  # B   -0.0024040905 0.15997526 -0.31594984 0.3111417
  # C2   0.4952835570 0.24413691  0.01678400 0.9737831
  # ABp -0.0008589146 0.05715582 -0.11288227 0.1111644
  # ABd -0.0008589146 0.34526154 -0.67755910 0.6758413
  
  ## Example 3: Sensitivity analysis (given delta is 0.5).
  macc(data.SL,model.type="single",delta=0.5,sens.plot=TRUE)
  ##############################################################################
  
  ##############################################################################
  # Three-level mediation model
  # Data was generated with 50 subjects and 4 sessions. 
  # The correlation between model errors in the single level is 0.5.
  # We comment out our examples due to the computation time.
  data(env.three)
  data.ML<-get("data3",env.three)
  
  ## Example 1: Correlation is unknown and to be estimated.
  # Assume random effects are independent
  # Add an interval constraint on the variance components.
  
  # "HL" method
  # macc(data.ML,model.type="multilevel",method="HL")
  # $delta
  # [1] 0.5224803

  # $Coefficients
  #            Estimate         LB         UB         SE
  # A        0.51759400  0.3692202  0.6659678 0.07570229
  # C        0.56882035  0.3806689  0.7569718 0.09599742
  # B       -1.13624114 -1.3688690 -0.9036133 0.11868988
  # C2      -0.06079748 -0.4163135  0.2947186 0.18138908
  # AB.prod -0.58811160 -0.7952826 -0.3809406 0.10570145
  # AB.diff -0.62961784 -1.0318524 -0.2273833 0.20522549
  # 
  # $time
  #    user  system elapsed 
  #   44.34    3.53   17.71 
  
  # "ML" method
  # macc(data.ML,model.type="multilevel",method="HL",u.int=TRUE)
  # $delta
  # [1] 0.5430744

  # $Coefficients
  #            Estimate         LB         UB         SE
  # A        0.51764821  0.3335094  0.7017871 0.09395011
  # C        0.59652821  0.3715001  0.8215563 0.11481236
  # B       -1.19426328 -1.4508665 -0.9376601 0.13092240
  # C2      -0.06079748 -0.4163135  0.2947186 0.18138908
  # AB.prod -0.61820825 -0.8751214 -0.3612951 0.13108056
  # AB.diff -0.65732570 -1.0780742 -0.2365772 0.21467155
  # 
  # $time
  #    user  system elapsed 
  #  125.49    9.52   39.10 
  
  # "TS" method
  # macc(data.ML,model.type="multilevel",method="TS")
  # $delta
  # [1] 0.5013719

  # $Coefficients
  #            Estimate         LB         UB         SE
  # A        0.51805823  0.3316603  0.7044561 0.09510271
  # C        0.53638546  0.3066109  0.7661601 0.11723409
  # B       -1.07930526 -1.3386926 -0.8199179 0.13234293
  # C2      -0.06079748 -0.4163135  0.2947186 0.18138908
  # AB.prod -0.55914297 -0.8010745 -0.3172114 0.12343672
  # AB.diff -0.59718295 -1.0204890 -0.1738769 0.21597645
  # 
  # $time
  #    user  system elapsed 
  #   19.53    0.00   19.54
  
  ## Example 2: Given the correlation is 0.5.
  # Assume random effects are independent.
  # Add an interval constraint on the variance components.
  
  # "HL" method
  macc(data.ML,model.type="multilevel",method="HL",delta=0.5)
  # $delta
  # [1] 0.5

  # $Coefficients
  #            Estimate         LB         UB         SE
  # A        0.51760568  0.3692319  0.6659794 0.07570229
  # C        0.53916412  0.3512951  0.7270331 0.09585330
  # B       -1.07675116 -1.3093989 -0.8441035 0.11869999
  # C2      -0.06079748 -0.4163135  0.2947186 0.18138908
  # AB.prod -0.55733252 -0.7573943 -0.3572708 0.10207419
  # AB.diff -0.59996161 -1.0020641 -0.1978591 0.20515811
  # 
  # $time
  #    user  system elapsed 
  #    2.44    0.22    1.03 
  ##############################################################################
  
  ##############################################################################
  # Two-level mediation model
  # Data was generated with 50 subjects. 
  # The correlation between model errors in the single level is 0.5.
  # We comment out our examples due to the computation time.
  data(env.two)
  data.TL<-get("data2",env.two)
  
  ## Example 1: Correlation is unknown and to be estimated.
  # Assume errors in the coefficients regression models are independent.
  # Add an interval constraint on the variance components. 
  
  # "HL" method
  # macc(data.TL,model.type="twolevel",method="HL")
  # $delta
  # [1] 0.5066551

  # $Coefficients
  #            Estimate
  # A        0.51714224
  # C        0.54392056
  # B       -1.05048406
  # C2      -0.02924135
  # AB.prod -0.54324968
  # AB.diff -0.57316190
  # 
  # $time
  #    user  system elapsed 
  #    3.07    0.00    3.07 
  
  # "TS" method
  # macc(data.TL,model.type="twolevel",method="TS")
  # $delta
  # [1] 0.4481611

  # $Coefficients
  #            Estimate
  # A        0.52013697
  # C        0.47945755
  # B       -0.90252718
  # C2      -0.02924135
  # AB.prod -0.46943775
  # AB.diff -0.50869890
  # 
  # $time
  #    user  system elapsed 
  #    1.60    0.00    1.59 
  
  ## Example 2: Given the correlation is 0.5.
  # Assume random effects are independent.
  # Add an interval constraint on the variance components.
  
  # "HL" method
  macc(data.TL,model.type="twolevel",method="HL",delta=0.5)
  # $delta
  # [1] 0.5

  # $Coefficients
  #            Estimate
  # A        0.51718063
  # C        0.53543300
  # B       -1.03336668
  # C2      -0.02924135
  # AB.prod -0.53443723
  # AB.diff -0.56467434
  # 
  # $time
  #    user  system elapsed 
  #    0.21    0.00    0.20 
  ##############################################################################



