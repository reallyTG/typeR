library("MIIVsem")

  orderList <- function(myList){
    myList <- lapply(myList,"[",c("DVobs", "IVobs", "MIIVs"))
    myList <- lapply(myList, function(eq){
      eq$MIIVs <- sort(eq$MIIVs) 
      eq$IVobs <- sort(eq$IVobs) 
      eq
    })
    myList <- myList[order(sapply(myList ,'[[',"DVobs"))]
  }
  
 #-------------------------------------------------------# 
  context("ex00: miiv search for poldemo correct")
 #-------------------------------------------------------# 
  ex00_model_poldemo <- '
    Xi1  =~ x1 + x2 + x3
    Eta1 =~ y1 + y2 + y3 + y4
    Eta2 =~ y5 + y6 + y7 + y8
    Eta1 ~ Xi1
    Eta2 ~ Xi1 + Eta1
    y1 ~~ y5
    y2 ~~ y4 + y6
    y3 ~~ y7
    y4 ~~ y8
    y6 ~~ y8
  '
  ex00_miivs_poldemo <- miivs(ex00_model_poldemo)$eqns
  ex00_miivs_poldemo <- orderList(ex00_miivs_poldemo)
  
  expect_equal_to_reference(
    ex00_miivs_poldemo, "rds/ex00_miivs_poldemo.rds"
  )
  
  #-------------------------------------------------------# 
  context("ex00: miiv search for colom higher order correct")
  #-------------------------------------------------------# 
  ex00_model_colom  <- '
    g  =~ 1*WM + PS + CI + SA # General Intelligence
    WM =~ 1*x1 + x2 + x3      # Working Memory
    PS =~ 1*x4 + x5 + x6      # Processing Speed
    CI =~ 1*x7 + x8 + x9      # Crystalized Intelligence
    SA =~ 1*x10 + x11 + x12   # Spatial Abilities
  '
  ex00_miivs_colom <- miivs(ex00_model_colom)$eqns
  ex00_miivs_colom <- orderList(ex00_miivs_colom)
  
  expect_equal_to_reference(
    ex00_miivs_colom, "rds/ex00_miivs_colom.rds"
  )
  
  #-------------------------------------------------------# 
  context("ex00: miiv search for education 01 correct")
  #-------------------------------------------------------# 
  ex00_model_educ01 <- '
    educ ~ paeducM + maeducM + paNOeduc + maNOeduc + 
           napaeduc +  namaeduc + papr80M + mapr80M +
           napapr80 + namapr80 + age + lnsibs + female + 
           black + asian + hispanic + othrace
           prestg80 ~ educ
  '
  ex00_miivs_educ01 <- miivs(ex00_model_educ01)$eqns
  ex00_miivs_educ01 <- orderList(ex00_miivs_educ01)
  
  expect_equal_to_reference(
    ex00_miivs_educ01, "rds/ex00_miivs_educ01.rds"
  )
  
  #-------------------------------------------------------# 
  context("ex00: miiv search for education 02 correct")
  #-------------------------------------------------------# 
  ex00_model_educ02 <- '
    educ ~ paeducM + maeducM + paNOeduc + maNOeduc + napaeduc + 
           namaeduc + papr80M + mapr80M + napapr80 + namapr80 + 
           age + lnsibs + female + black + asian + hispanic + 
           othrace
    prestg80 ~ educ + napapr80 + papr80M + namapr80 + mapr80M + 
               age + female + black +  asian  + hispanic + 
               othrace
  '
  ex00_miivs_educ02 <- miivs(ex00_model_educ02)$eqns
  ex00_miivs_educ02 <- orderList(ex00_miivs_educ02)
  
  expect_equal_to_reference(
    ex00_miivs_educ02, "rds/ex00_miivs_educ02.rds"
  )
  
  #-------------------------------------------------------# 
  context("ex00: miiv search for education 03 correct")
  #-------------------------------------------------------# 
  ex00_model_educ03 <- '
    educ ~ paeducM + maeducM + paNOeduc + maNOeduc + 
           napaeduc +  namaeduc + papr80M + mapr80M +
           napapr80 + namapr80 + age + lnsibs + female + 
           black + asian + hispanic + othrace
    prestg80 ~ educ
    prestg80 ~~ educ
  '
  ex00_miivs_educ03 <- miivs(ex00_model_educ03)$eqns
  ex00_miivs_educ03 <- orderList(ex00_miivs_educ03)
  
  expect_equal_to_reference(
    ex00_miivs_educ03, "rds/ex00_miivs_educ03.rds"
  )
  
  #-------------------------------------------------------# 
  context("ex00: miiv search for education 04 correct")
  #-------------------------------------------------------# 
  ex00_model_educ04 <- '
    educ ~ paeducM + maeducM + paNOeduc + maNOeduc + napaeduc + 
           namaeduc + papr80M + mapr80M + napapr80 + namapr80 + 
           age + lnsibs + female + black + asian + hispanic + othrace
    prestg80 ~ educ + napapr80 + papr80M + namapr80 + mapr80M + 
               age + female + black +  asian  + hispanic + othrace
    prestg80 ~~ educ
  '
  ex00_miivs_educ04 <- miivs(ex00_model_educ04)$eqns
  ex00_miivs_educ04 <- orderList(ex00_miivs_educ04)
  
  expect_equal_to_reference(
    ex00_miivs_educ04, "rds/ex00_miivs_educ04.rds"
  )
  
  #-------------------------------------------------------# 
  context("ex00: miiv search for blood pressure correct")
  #-------------------------------------------------------# 
  ex00_model_bloodpressure <- '
    Systolic  =~ Z2 + 1*Z1 + 1*Z3
    Diastolic =~ Z5 + 1*Z4 + 1*Z6
    Systolic  ~~ Diastolic
  '
  
  ex00_miivs_bloodpressure <- miivs(ex00_model_bloodpressure)$eqns
  ex00_miivs_bloodpressure <- orderList(ex00_miivs_bloodpressure)
  
  expect_equal_to_reference(
    ex00_miivs_bloodpressure, "rds/ex00_miivs_bloodpressure.rds"
  )
  
  #-------------------------------------------------------# 
  context("ex00: miiv search for kirby01 correct")
  #-------------------------------------------------------# 
  ex00_model_kirby01 <- '
    F1 =~ V2 + V1 + V3 + V4
    F2 =~ V5 + V4 + V6 + V7
    F3 =~ V8 + V7 + V9 + V6
    F2 ~ F1 
    F3 ~ F2 
  '
  
  ex00_miivs_kirby01 <- miivs(ex00_model_kirby01)$eqns
  ex00_miivs_kirby01 <- orderList(ex00_miivs_kirby01)
  
  expect_equal_to_reference(
    ex00_miivs_kirby01, "rds/ex00_miivs_kirby01.rds"
  )
  
  #-------------------------------------------------------# 
  context("ex00: miiv search for kirby03 correct")
  #-------------------------------------------------------# 
  ex00_model_kirby03 <- '
    F1 =~ V2 + V1 + V3 + V4
    F2 =~ V5 + V4 + V6 + V7
    F3 =~ V8 + V7 + V9 + V6
  
    F1 ~ V10 + V11 + V12 + V13
    F2 ~ F1 + V10 + V12
    F3 ~ F2 + V10 + V12
  '
  ex00_miivs_kirby03 <- miivs(ex00_model_kirby03)$eqns
  ex00_miivs_kirby03 <- orderList(ex00_miivs_kirby03)
  
  expect_equal_to_reference(
    ex00_miivs_kirby03, "rds/ex00_miivs_kirby03.rds"
  )
  
  #-------------------------------------------------------# 
  context("ex00: miiv search for trust01 correct")
  #-------------------------------------------------------#
  ex00_model_trust01 <- '
    F1 =~ V1 + V2 + V3 + V4 + V5 + V6 + V7 + V8
  '
  
  ex00_miivs_trust01 <- miivs(ex00_model_trust01)$eqns
  ex00_miivs_trust01 <- orderList(ex00_miivs_trust01)
  
  expect_equal_to_reference(
    ex00_miivs_trust01, "rds/ex00_miivs_trust01.rds"
  )
  
  #-------------------------------------------------------# 
  context("ex00: miiv search for trust02 correct")
  #-------------------------------------------------------#
  ex00_model_trust02 <- '
    F1 =~ y1 + y2 
    F1 ~  x1 + x2 + x3 + x4 + x5 + x6
  '
  
  ex00_miivs_trust02 <- miivs(ex00_model_trust02)$eqns
  ex00_miivs_trust02 <- orderList(ex00_miivs_trust02)
  
  expect_equal_to_reference(
    ex00_miivs_trust02, "rds/ex00_miivs_trust02.rds"
  )
  