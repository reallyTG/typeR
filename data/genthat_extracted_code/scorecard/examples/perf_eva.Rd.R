library(scorecard)


### Name: perf_eva
### Title: Binomial Metrics
### Aliases: perf_eva

### ** Examples

## Not run: 
##D # load germancredit data
##D data("germancredit")
##D 
##D # filter variable via missing rate, iv, identical value rate
##D dt_f = var_filter(germancredit, "creditability")
##D 
##D # breaking dt into train and test ------
##D dt_list = split_df(dt_f, "creditability")
##D label_list = lapply(dt_list, function(x) x$creditability)
##D 
##D # woe binning ------
##D bins = woebin(dt_list$train, "creditability")
##D # converting train and test into woe values
##D dt_woe_list = lapply(dt_list, function(x) woebin_ply(x, bins))
##D 
##D # glm ------
##D m1 = glm(creditability ~ ., family = binomial(), data = dt_woe_list$train)
##D # vif(m1, merge_coef = TRUE)
##D # Select a formula-based model by AIC
##D m_step = step(m1, direction="both", trace=FALSE)
##D m2 = eval(m_step$call)
##D # vif(m2, merge_coef = TRUE)
##D 
##D # predicted proability
##D pred_list = lapply(dt_woe_list, function(x) predict(m2, type = 'response', x))
##D 
##D # scorecard ------
##D card = scorecard(bins, m2)
##D 
##D # credit score, only_total_score = TRUE
##D score_list = lapply(dt_list, function(x) scorecard_ply(x, card))
##D # credit score, only_total_score = FALSE
##D score_list2 = lapply(dt_list, function(x) scorecard_ply(x, card, only_total_score=FALSE))
##D 
##D 
##D ###### perf_eva examples ######
##D # Example I, one datset
##D ## predicted p1
##D perf_eva(pred = pred_list$train, label=dt_list$train$creditability, title = 'train')
##D ## predicted score
##D # perf_eva(pred = score_list$train, label=dt_list$train$creditability, title = 'train')
##D 
##D # Example II, multiple datsets
##D ## predicted p1
##D perf_eva(pred = pred_list, label = label_list)
##D ## predicted score
##D # perf_eva(score_list, label_list)
##D 
##D 
##D ###### perf_psi examples ######
##D # Example I # only total psi
##D psi1 = perf_psi(score = score_list, label = label_list)
##D psi1$psi  # psi dataframe
##D psi1$pic  # pic of score distribution
##D 
##D # Example II # both total and variable psi
##D psi2 = perf_psi(score = score_list, label = label_list)
##D # psi2$psi  # psi dataframe
##D # psi2$pic  # pic of score distribution
##D 
##D 
##D ###### gains_table examples ######
##D # Example I, input score and label can be a list or a vector
##D gains_table(score = score_list$train, label = label_list$train)
##D gains_table(score = score_list, label = label_list)
##D 
##D # Example II, specify the bins number and type
##D gains_table(score = score_list, label = label_list, bin_num = 20)
##D gains_table(score = score_list, label = label_list, bin_type = 'width')
## End(Not run)




