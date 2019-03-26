library("MIIVsem")

  klein.data <-
    structure(
      list(
        year = 1920:1941,
        consump = c(
          39.8,
          41.9,
          45,
          49.2,
          50.6,
          52.6,
          55.1,
          56.2,
          57.3,
          57.8,
          55,
          50.9,
          45.6,
          46.5,
          48.7,
          51.3,
          57.7,
          58.7,
          57.5,
          61.6,
          65,
          69.7
        ),
        corpProf = c(
          12.7,
          12.4,
          16.9,
          18.4,
          19.4,
          20.1,
          19.6,
          19.8,
          21.1,
          21.7,
          15.6,
          11.4,
          7,
          11.2,
          12.3,
          14,
          17.6,
          17.3,
          15.3,
          19,
          21.1,
          23.5
        ),
        corpProfLag = c(
          NA,
          12.7,
          12.4,
          16.9,
          18.4,
          19.4,
          20.1,
          19.6,
          19.8,
          21.1,
          21.7,
          15.6,
          11.4,
          7,
          11.2,
          12.3,
          14,
          17.6,
          17.3,
          15.3,
          19,
          21.1
        ),
        privWage = c(
          28.8,
          25.5,
          29.3,
          34.1,
          33.9,
          35.4,
          37.4,
          37.9,
          39.2,
          41.3,
          37.9,
          34.5,
          29,
          28.5,
          30.6,
          33.2,
          36.8,
          41,
          38.2,
          41.6,
          45,
          53.3
        ),
        invest = c(
          2.7,-0.2,
          1.9,
          5.2,
          3,
          5.1,
          5.6,
          4.2,
          3,
          5.1,
          1,
          -3.4,
          -6.2,
          -5.1,-3,
          -1.3,
          2.1,
          2,
          -1.9,
          1.3,
          3.3,
          4.9
        ),
        capitalLag = c(
          180.1,
          182.8,
          182.6,
          184.5,
          189.7,
          192.7,
          197.8,
          203.4,
          207.6,
          210.6,
          215.7,
          216.7,
          213.3,
          207.1,
          202,
          199,
          197.7,
          199.8,
          201.8,
          199.9,
          201.2,
          204.5
        ),
        gnp = c(
          44.9,
          45.6,
          50.1,
          57.2,
          57.1,
          61,
          64,
          64.4,
          64.5,
          67,
          61.2,
          53.4,
          44.3,
          45.1,
          49.7,
          54.4,
          62.7,
          65,
          60.9,
          69.5,
          75.7,
          88.4
        ),
        gnpLag = c(
          NA,
          44.9,
          45.6,
          50.1,
          57.2,
          57.1,
          61,
          64,
          64.4,
          64.5,
          67,
          61.2,
          53.4,
          44.3,
          45.1,
          49.7,
          54.4,
          62.7,
          65,
          60.9,
          69.5,
          75.7
        ),
        govWage = c(
          2.2,
          2.7,
          2.9,
          2.9,
          3.1,
          3.2,
          3.3,
          3.6,
          3.7,
          4,
          4.2,
          4.8,
          5.3,
          5.6,
          6,
          6.1,
          7.4,
          6.7,
          7.7,
          7.8,
          8,
          8.5
        ),
        govExp = c(
          2.4,
          3.9,
          3.2,
          2.8,
          3.5,
          3.3,
          3.3,
          4,
          4.2,
          4.1,
          5.2,
          5.9,
          4.9,
          3.7,
          4,
          4.4,
          2.9,
          4.3,
          5.3,
          6.6,
          7.4,
          13.8
        ),
        taxes = c(
          3.4,
          7.7,
          3.9,
          4.7,
          3.8,
          5.5,
          7,
          6.7,
          4.2,
          4,
          7.7,
          7.5,
          8.3,
          5.4,
          6.8,
          7.2,
          8.3,
          6.7,
          7.4,
          8.9,
          9.6,
          11.6
        ),
        wages = c(
          31,
          28.2,
          32.2,
          37,
          37,
          38.6,
          40.7,
          41.5,
          42.9,
          45.3,
          42.1,
          39.3,
          34.3,
          34.1,
          36.6,
          39.3,
          44.2,
          47.7,
          45.9,
          49.4,
          53,
          61.8
        ),
        trend = -11:10
      ),
      .Names = c(
        "year",
        "consump",
        "corpProf",
        "corpProfLag",
        "privWage",
        "invest",
        "capitalLag",
        "gnp",
        "gnpLag",
        "govWage",
        "govExp",
        "taxes",
        "wages",
        "trend"
      ),
      class = "data.frame",
      row.names = c(
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "10",
        "11",
        "12",
        "13",
        "14",
        "15",
        "16",
        "17",
        "18",
        "19",
        "20",
        "21",
        "22"
      )
    )

  model <- '
    consump  ~ corpProf + corpProfLag + wages
    invest   ~ corpProf + corpProfLag + capitalLag
    privWage ~ gnp + gnpLag + trend
  '
  
  instruments <- '
    consump  ~ govExp + taxes + govWage + trend + capitalLag + corpProfLag + gnpLag
    invest   ~ govExp + taxes + govWage + trend + capitalLag + corpProfLag + gnpLag
    privWage ~ govExp + taxes + govWage + trend + capitalLag + corpProfLag + gnpLag
  '

  fit <- miive(model, klein.data, instruments, miiv.check = FALSE)

  
 #-------------------------------------------------------# 
  context("ex04: klein coefficients correct")
 #-------------------------------------------------------# 
  
  expect_equal_to_reference(
    fit$coefficients[sort(names(fit$coefficients))], 
    "rds/ex04_klein_coef.rds"
  )
  
 #-------------------------------------------------------# 
  context("ex04: klein coefficient covariance matrix correct")
 #-------------------------------------------------------# 
  dim_names <- sort(names(fit$coefficients))
  
  expect_equal_to_reference(
    fit$coefCov[dim_names, dim_names], 
    "rds/ex04_klein_coefcov.rds"
  )

  kmenta.data <-
    structure(
      list(
        consump = c(
          98.485,
          99.187,
          102.163,
          101.504,
          104.24,
          103.243,
          103.993,
          99.9,
          100.35,
          102.82,
          95.435,
          92.424,
          94.535,
          98.757,
          105.797,
          100.225,
          103.522,
          99.929,
          105.223,
          106.232
        ),
        price = c(
          100.323,
          104.264,
          103.435,
          104.506,
          98.001,
          99.456,
          101.066,
          104.763,
          96.446,
          91.228,
          93.085,
          98.801,
          102.908,
          98.756,
          95.119,
          98.451,
          86.498,
          104.016,
          105.769,
          113.49
        ),
        income = c(
          87.4,
          97.6,
          96.7,
          98.2,
          99.8,
          100.5,
          103.2,
          107.8,
          96.6,
          88.9,
          75.1,
          76.9,
          84.6,
          90.6,
          103.1,
          105.1,
          96.4,
          104.4,
          110.7,
          127.1
        ),
        farmPrice = c(
          98,
          99.1,
          99.1,
          98.1,
          110.8,
          108.2,
          105.6,
          109.8,
          108.7,
          100.6,
          81,
          68.6,
          70.9,
          81.4,
          102.3,
          105,
          110.5,
          92.5,
          89.3,
          93
        ),
        trend = 1:20
      ),
      .Names = c("consump",
                 "price", "income", "farmPrice", "trend"),
      class = "data.frame",
      row.names = c(NA,-20L)
    )
  


  kmenta.data$demand <- kmenta.data$supply <- kmenta.data$consump

  model <- '
    demand ~ price + income
    supply ~ price + farmPrice + trend
  '

  instruments <- '
    demand  ~ income + farmPrice + trend
    supply  ~ income + farmPrice + trend
  '

  fit <- miive(model, kmenta.data, instruments, miiv.check = FALSE)
   
  
  #-------------------------------------------------------# 
  context("ex04: kmenta coefficients correct")
  #-------------------------------------------------------# 
  
  expect_equal_to_reference(
    fit$coefficients[sort(names(fit$coefficients))], 
    "rds/ex04_kmenta_coef.rds"
  )
  
 #-------------------------------------------------------# 
  context("ex04: kmenta coefficient covariance matrix correct")
 #-------------------------------------------------------# 
  dim_names <- sort(names(fit$coefficients))
  
  expect_equal_to_reference(
    fit$coefCov[dim_names, dim_names], 
    "rds/ex04_kmenta_coefcov.rds"
  )

  