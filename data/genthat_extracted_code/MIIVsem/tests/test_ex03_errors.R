library("MIIVsem")

  #-------------------------------------------------------# 
  context("ex03: categorical exo var in cat eq - error caught")
  #-------------------------------------------------------# 
  set.seed(1234)
  data <- data.frame(
    V1 = factor(sample(0:1, 75, replace = TRUE)),
    V2 = factor(sample(0:1, 75, replace = TRUE)),
    V3 = factor(sample(0:1, 75, replace = TRUE)),
    V4 = factor(sample(0:1, 75, replace = TRUE)),
    V5 = sample(0:10, 75, replace = TRUE),
    V6 = sample(0:10, 75, replace = TRUE),
    V7 = sample(0:10, 75, replace = TRUE),
    V8 = sample(0:10, 75, replace = TRUE),
    V9 = factor(sample(0:1, 75, replace = TRUE))
  )
  
  model <- ' 
    L1 =~ V1 + V2 + V3 + V4
    L2 =~ V5 + V6 + V7 + V8
    L1  ~ V9
  ' 
  
  ordered <- c("V1","V2","V3","V4","V9")
  
  expect_error(miive(model, data, ordered = ordered), "miive:", fixed=TRUE)
  
  #-------------------------------------------------------# 
  context("ex03: continuous exo var in cat eq - error caught")
  #-------------------------------------------------------# 
  
  data$V9 <- sample(0:10, 75, replace = TRUE)
  
  ordered <- c("V1","V2","V3","V4")
  
  expect_error(miive(model, data, ordered = ordered), "miive:", fixed=TRUE)
  
  #-------------------------------------------------------# 
  context("ex03: continuous exo var in con eq - no error")
  #-------------------------------------------------------# 
  model <- ' 
    L1 =~ V1 + V2 + V3 + V4
    L2 =~ V5 + V6 + V7 + V8
    L2  ~ V9
  ' 
  
  instruments <- '
    V5 ~ V9
    V2 ~ V3 + V4
    V3 ~ V2 + V4
    V4 ~ V2 + V3
    V6 ~ V7 + V8
    V7 ~ V6 + V8
    V8 ~ V6 + V7
  '
  
  expect_error(miive(model, data, instruments, ordered = c("V1","V2","V3","V4")), NA)

  #-------------------------------------------------------# 
  context("ex03: scaling indicator cross loads - error")
  #-------------------------------------------------------# 
  model <- ' 
  L1 =~ V1 + V2 + V3 + V4 + V5
  L2 =~ V5 + V6 + V7 + V8
  ' 

  expect_error(miive(model, data), "miivs:", fixed=TRUE)
  
  #-------------------------------------------------------# 
  context("ex03: scaling indicator receives path - error")
  #-------------------------------------------------------# 
  model <- ' 
  L1 =~ V5 + V6 + V7 + V8
  V5 ~ V6
  ' 
  
  expect_error(miive(model, data), "miivs:", fixed=TRUE)
  
 