library(stratEst)

test_that("behavior strategies",  {
  set.seed(1)
  N = 200
  Obs = 20

  intercept = -0.5
  intercept2 = 0.2
  dummy = 1.5
  dummy2 = 0.2
  response = 0.25
  tremble = 0.10

  TFT_candidate1 =  matrix(c(1,2,1,0,1,1,2,2),2,4)
  TFT_candidate2 =  matrix(c(1,2,NA,NA,1,1,2,2),2,4)

  strategies = rbind(TFT_candidate1,TFT_candidate2)
  covariates = matrix(c(rep(1,N),rep(0,N/2),rep(1,N/2)),N,2)

  coefficient_mat = matrix(c(intercept,dummy),2,1)
  strategy_selection = matrix(NA,N,2)
  strategy_selection[,1] <- 1/( 1 + exp(covariates %*% coefficient_mat) )
  strategy_selection[,2] <- exp(covariates %*% coefficient_mat)/( 1 + exp(covariates %*% coefficient_mat) )

  expected_shares = apply( strategy_selection,2,mean)

  rand_vec = runif(N)
  strategy_vec = ifelse( rand_vec > strategy_selection[,2] , 1 , 2 )
  strat_id = rep( strategy_vec , each = (Obs*2))

  real_shares = rep(NA,2)
  real_shares[1] = sum(as.numeric(strategy_vec==1))/length(strategy_vec)
  real_shares[2] = sum(as.numeric(strategy_vec==2))/length(strategy_vec)

  TFT1 =  matrix(c(1,2,(1-tremble),(0+tremble),1,1,2,2),2,4)
  TFT2 =  matrix(c(1,2,response,response,1,1,2,2),2,4)

  strategy_mat = rbind(TFT1,TFT2)

  id = rep(NA,Obs*2*N)
  supergame = rep(1,Obs*2*N)
  period = rep(c(1:(Obs*2)),N)
  input = rep(c(rep(1,Obs),rep(2,Obs)),N)
  output = rep(NA,Obs*2*N)
  rand_vec = runif(Obs*2*N)
  pr_vec = rep(NA,Obs*2*N)

  for( i in 1:N ){
    id[ ((i-1)*Obs*2 + 1) : ((i-1)*Obs*2 + Obs*2) ] = rep(i,Obs*2)
    pr_vec[ ((i-1)*Obs*2 + 1) : ((i-1)*Obs*2 + Obs*2) ] = c(rep(strategy_mat[ 1 + (strategy_vec[i]-1)*2 , 2 ],Obs),rep(strategy_mat[ 2 + (strategy_vec[i]-1)*2 , 2 ],Obs))
  }

  output <- ifelse( rand_vec >= pr_vec , 0 , 1 )

  data <- cbind(id,supergame,period,input,output)
  covar = matrix(as.numeric(id>100),nrow(data),1)

  model = stratEst( data, strategies, covariates = covar , select="all", se="yes", crit = "icl", inner.runs = 100, inner.max = 10, outer.runs = 1,outer.max = 200,outer.tol = 0,print.messages = F)

  expect_equal( 0.465, round(model$shares[1],3) )
  expect_equal( 0.535, round(model$shares[2],3) )
  expect_equal( 0.229, round(model$responses[1],3) )
  expect_equal( 0.110, round(model$trembles[1],3) )
  expect_equal( -0.754, round(model$coefficients[1],3) )
  expect_equal( 1.852, round(model$coefficients[2],3) )
  expect_equal( 2 , length( model$shares ) )
  expect_equal( 2 , length( model$responses ) )
  expect_equal( 1 , length( model$trembles ) )
})
