library(stratEst)

test_that("core systematic tests",  {
  # shares
  one_fixed_share <- stratEst(DF2011[DF2011[,1]==1,],3,shares=c(0.5,NA,NA),print.messages = F)
  two_fixed_shares <- stratEst(DF2011[DF2011[,1]==1,],3,shares=c(0.5,0.5,NA),print.messages = F)
  # cluster
  cluster_bs <- stratEst(DF2011LCR[DF2011LCR[,1] == 1 & DF2011LCR[,4]==32 & DF2011LCR[,5]==0.5,],2,cluster = DF2011LCR$group[DF2011LCR[,1] == 1 & DF2011LCR[,4]==32 & DF2011LCR[,5]==0.5],print.messages = F, bs.samples = 50 )
  # restrict trembles
  restrict_trembles_no <- stratEst(DF2011[DF2011[,1]==1,],strategies=rbind(ALLD,TFT,WSLS),r.trembles="no",print.messages = F)
  expect_equal(5,length(restrict_trembles_no$trembles))
  restrict_trembles_global <- stratEst(DF2011[DF2011[,1]==1,],strategies=rbind(ALLD,TFT,WSLS),r.trembles="global",print.messages = F)
  expect_equal(1,length(restrict_trembles_global$trembles))
  restrict_trembles_strats <- stratEst(DF2011[DF2011[,1]==1,],strategies=rbind(ALLD,TFT,WSLS),r.trembles="strategies",print.messages = F)
  expect_equal(3,length(restrict_trembles_strats$trembles))
  restrict_trembles_states <- stratEst(DF2011[DF2011[,1]==1,],strategies=rbind(ALLD,TFT,WSLS),r.trembles="states",print.messages = F)
  expect_equal(2,length(restrict_trembles_states$trembles))
  # restrict responses
  restrict_responses_no <- stratEst(DF2011[DF2011[,1]==1,],3,r.responses="no",print.messages = F)
  expect_equal(15,length(restrict_responses_no$responses))
  restrict_responses_global <- stratEst(DF2011[DF2011[,1]==1,],3,r.responses="global",print.messages = F)
  expect_equal(1,length(restrict_responses_global$responses))
  restrict_responses_strategies <- stratEst(DF2011[DF2011[,1]==1,],3,r.responses="strategies",print.messages = F)
  expect_equal(3,length(restrict_responses_strategies$responses))
  restrict_responses_states <- stratEst(DF2011[DF2011[,1]==1,],3,r.responses="states",print.messages = F)
  expect_equal(5,length(restrict_responses_states$responses))
  # select
  select_strategies_icl <- stratEst(DF2011[DF2011[,1]==6,],3,select = "strategies", crit ="icl",print.messages = F)
  expect_equal(2,length(select_strategies_icl$shares))
  select_trembles_global <- stratEst(DF2011[DF2011[,1]==6,],3,response="pure",r.trembles = "global",select = "trembles", crit ="icl",print.messages = F)
  expect_equal(4,length(select_trembles_global$trembles))
  select_all_global <- stratEst(DF2011[DF2011[,1]==6,],3,r.trembles = "global",r.responses = "global",select = "all", crit ="icl",print.messages = F)
  expect_equal(4,length(select_all_global$responses))
  expect_equal(3,length(select_all_global$shares))
})

test_that("additional systematic tests",  {
  skip_on_cran()
  # response
  response_pure <- stratEst(DF2011[DF2011[,1]==1,],3,response= "pure",print.messages = F)
  response_mixed <- stratEst(DF2011[DF2011[,1]==1,],3,response= "mixed",print.messages = F)
  #select
  select_strategies_aic <- stratEst(DF2011[DF2011[,1]==6,],3,select = "strategies", crit ="aic",print.messages = F)
  expect_equal(2,length(select_strategies_aic$shares))
  select_strategies_bic <- stratEst(DF2011[DF2011[,1]==6,],3,select = "strategies", crit ="bic",print.messages = F)
  expect_equal(2,length(select_strategies_bic$shares))
  select_trembles_global <- stratEst(DF2011[DF2011[,1]==6,],3,response="pure",r.trembles = "global",select = "trembles", crit ="icl",print.messages = F)
  expect_equal(4,length(select_trembles_global$trembles))
  select_responses_global <- stratEst(DF2011[DF2011[,1]==6,],3,r.responses = "global",select = "responses", crit ="icl",print.messages = F)
  expect_equal(4,length(select_responses_global$responses))
  select_both_global <- stratEst(DF2011[DF2011[,1]==6,],3,r.trembles = "global",r.responses = "global",select = "both", crit ="icl",print.messages = F)
  expect_equal(4,length(select_both_global$responses))
})

test_that("multivariate output test",  {
  skip_on_cran()
  N = 32                                                  # number of subjects
  num_responses = c(2,3,4,5)                                       # number of distinct responses of the machines
  tremble = 0.2
  shares = runif(5)                            # generate 5 shares
  shares = shares/sum(shares)                             # normalize shares
  for( m in 1:length(num_responses)){
    check = 0
    while( check == 0 ){
      strategy_mat = matrix(runif(5*5*num_responses[m]),5*5,num_responses[m])
      strategy_mat = matrix(as.numeric(strategy_mat == apply(strategy_mat,1,max)),5*5,num_responses[m])
      if( sum(as.numeric(apply(strategy_mat,1,sum) == 1)) == 5*5 ){ check = 1 }
    }

    strats = cbind(rep(c(1:5),5),strategy_mat,matrix(unlist(lapply(c(2:5), function(x) rep(x,5*5) )),5*5,5-1))

    response_mat = (1-strategy_mat)*tremble/(num_responses[m]-1) + strategy_mat*(1-tremble)

    strategy_vec = t(rmultinom(N, size = 1, prob = shares))%*%matrix(c(1:5),5,1)
    strat_id = rep( strategy_vec , each= (15*5))

    real_shares = rep(NA,5)
    for( i in 1:5 ){
      real_shares[i] = sum(as.numeric(strategy_vec==i))/length(strategy_vec)
    }

    id = rep(NA,15*5*N)
    supergame = rep( unlist(lapply(c(1:15), function(x) rep(x,5) )) ,N )
    period = rep(c(1:5),15*N)
    input =  rep(c(1:5)-1,15*N)
    output = rep(NA,15*5*N)
    rand_vec = runif(15*5*N)
    pr_vec = rep(NA,15*5*N)

    for( i in 1:N ){
      id[ ((i-1)*15*5 + 1) : ((i-1)*15*5 + 15*5) ] = rep(i,15*5)
    }

    for( j in 1:(15*5*N) ){
      output[ j ] = t(rmultinom(1, size = 1, prob = response_mat[1+input[j] + (strat_id[j]-1)*5 , ] ))%*%matrix(c(1:num_responses[m]),num_responses[m],1)
    }

    data <- cbind(id,supergame,period,input,output)

    P = stratEst(data,5,response="pure",outer.runs = 2, print.messages = F)
    M = stratEst(data,5,response="mixed",outer.runs = 2, print.messages = F)
    expect_equal(num_responses[m]+5,ncol(P$strategies))
    expect_equal(num_responses[m]+5,ncol(M$strategies))
  }
})

