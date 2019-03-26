library("MIIVsem")

  model <- '
    Eta1 =~ y1 + y2 + y3 + y4
    Eta2 =~ y5 + y6 + y7 + y8
    Xi1  =~ x1 + x2 + x3
    Eta1 ~  Xi1
    Eta2 ~  Xi1
    Eta2 ~  Eta1
    y1   ~~ y5
    y2   ~~ y4
    y2   ~~ y6
    y3   ~~ y7
    y4   ~~ y8
    y6   ~~ y8
  '

  fit <- miive(model, bollen1989a)
  
 #-------------------------------------------------------# 
  context("ex01: poldemo coefficients correct")
 #-------------------------------------------------------# 
  
  expect_equal_to_reference(
    fit$coefficients[sort(names(fit$coefficients))], 
    "rds/ex01_pol_coef.rds"
  )
  
 #-------------------------------------------------------# 
  context("ex01: poldemo coefficient covariance matrix correct")
 #-------------------------------------------------------# 
  dim_names <- sort(names(fit$coefficients))
  
  expect_equal_to_reference(
    fit$coefCov[dim_names, dim_names], 
    "rds/ex01_pol_coefcov.rds"
  )

 #-------------------------------------------------------#  
  #context("ex01: poldemo residual covariance matrix correct")
 #-------------------------------------------------------# 
  
  #dim_names <- sort(colnames(fit$residCov))
  
  #expect_equal_to_reference(
  #  fit$residCov[dim_names, dim_names], 
  #  "rds/ex01_pol_residcov.rds"
  #)
  
  #-------------------------------------------------------#  
   context("ex01: poldemo sargan test statistics correct")
  #-------------------------------------------------------# 
  
  sargan <- unlist(lapply(fit$eqn, "[", c("sargan")))
  names(sargan) <- unlist(lapply(fit$eqn, "[", c("DVlat")))
  sargan   <- sargan[sort(names(sargan))]
  
  expect_equal_to_reference(
    sargan, 
    "rds/ex01_pol_sargan.rds"
  )
  
  #-------------------------------------------------------#  
  context("ex01: poldemo sargan df correct")
  #-------------------------------------------------------# 
  
  sargandf <- unlist(lapply(fit$eqn, "[", c("sargan.df")))
  names(sargandf) <- unlist(lapply(fit$eqn, "[", c("DVlat")))
  sargandf   <- sargandf[sort(names(sargandf))]
  
  expect_equal_to_reference(
    sargandf, 
    "rds/ex01_pol_sargandf.rds"
  )
  
  #-------------------------------------------------------#  
  context("ex01: poldemo sargan p-values correct")
  #-------------------------------------------------------# 
  
  sarganp <- unlist(lapply(fit$eqn, "[", c("sargan.p")))
  names(sarganp) <- unlist(lapply(fit$eqn, "[", c("DVlat")))
  sarganp   <- sarganp[sort(names(sarganp))]
  
  expect_equal_to_reference(
    sarganp, 
    "rds/ex01_pol_sarganp.rds"
  )

  