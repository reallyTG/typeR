## ----setup, include=FALSE------------------------------------------------
  knitr::opts_chunk$set(echo = TRUE, collapse=TRUE, messages=FALSE, eval=TRUE)

## ----quiet_package_load, echo=FALSE--------------------------------------

  suppressMessages(suppressWarnings(library(hpiR)))
  suppressMessages(suppressWarnings(library(knitr)))


## ----package_load--------------------------------------------------------
  library(hpiR)


## ----load_data-----------------------------------------------------------
  data(seattle_sales)

  data(ex_sales)


## ----create_hpidata_obj--------------------------------------------------
  sales_hdf <- dateToPeriod(trans_df = ex_sales,
                            date = 'sale_date',
                            periodicity = 'monthly')


## ----expand_time---------------------------------------------------------
  sales_hdf <- dateToPeriod(trans_df = ex_sales,
                            date = 'sale_date',
                            periodicity = 'monthly',
                            min_date = as.Date('2009-12-01'),
                            max_date = as.Date('2016-12-31'))


## ----adj_move------------------------------------------------------------
  sales_hdf <- dateToPeriod(trans_df = ex_sales,
                            date = 'sale_date',
                            periodicity = 'monthly',
                            min_date = as.Date('2010-12-01'),
                            max_date = as.Date('2015-12-31'))


## ----adj_clip------------------------------------------------------------
  sales_hdf_clip <- dateToPeriod(trans_df = ex_sales,
                                 date = 'sale_date',
                                 periodicity = 'monthly',
                                 min_date = as.Date('2010-12-01'),
                                 max_date = as.Date('2015-12-31'),
                                 adj_type = 'clip')


## ----period_table_attr---------------------------------------------------
  head(attr(sales_hdf, 'period_table'))


## ----create_rtdata-------------------------------------------------------
  sales_rtdf <- rtCreateTrans(trans_df = sales_hdf,
                              prop_id = 'pinx',
                              trans_id = 'sale_id',
                              price = 'sale_price')
                          

## ----rtdata_table, echo=FALSE--------------------------------------------

  knitr::kable(head(sales_rtdf), row.names=FALSE)


## ----seq_only_true-------------------------------------------------------
  sales_rtdf_so <- rtCreateTrans(trans_df = sales_hdf,
                                 prop_id = 'pinx',
                                 trans_id = 'sale_id',
                                 price = 'sale_price',
                                 seq_only = TRUE)


## ----rtdata_table_so, echo=FALSE-----------------------------------------

  knitr::kable(head(sales_rtdf_so), row.names=FALSE)


## ----create_rtmodel------------------------------------------------------
  rt_model <- hpiModel(hpi_df = sales_rtdf,
                       estimator = 'base',
                       log_dep = TRUE)



## ----full_rtmodel--------------------------------------------------------
  rt_full <- hpiModel(hpi_df = sales_rtdf,
                      estimator = 'base',
                      log_dep = TRUE,
                      trim_model = FALSE)

  object.size(rt_model)
  object.size(rt_full)


## ----create_rtindex------------------------------------------------------
  rt_index <- modelToIndex(model_obj = rt_model)


## ----rtindex_short-------------------------------------------------------
  rt_short <- modelToIndex(model_obj = rt_model,
                           max_period = 50)
  length(rt_short$value)


## ----index_plot, fig.width=7, fig.height=2.5-----------------------------
  plot(rt_index)


## ----imputation_example--------------------------------------------------
  rt_model_imp <- rt_full
  rt_model_imp$coefficients$coefficient[3:5] <- NA
  rt_index_imp <- modelToIndex(model_obj = rt_model_imp)

  rt_index_imp$value[1:6]
  
  rt_index_imp$imputed[1:6]


## ----imp_plot, fig.width=7, fig.height=2.5-------------------------------
  rt_model_imp <- rt_full
  rt_model_imp$coefficients$coefficient[c(4, 7, 23, 55, 78, 83)] <- NA
  rt_index_imp <- modelToIndex(model_obj = rt_model_imp)

  plot(rt_index_imp, show_imputed=TRUE)


## ----rt_smooth-----------------------------------------------------------
  rt_smooth <- smoothIndex(index_obj = rt_index,
                           order = 5)
  attr(rt_smooth, 'order')


## ----rtindex_inplace-----------------------------------------------------
   rt_index <- smoothIndex(index_obj = rt_index,
                           order = 7,
                           in_place = TRUE)
   names(rt_index)


## ----plot_smooth, fig.width=7, fig.height=3------------------------------
   plot(rt_index, smooth=TRUE)


## ----rtindex_opt1--------------------------------------------------------
  rt_1 <- rtIndex(trans_df = ex_sales,
                  periodicity = 'monthly',
                  min_date = '2010-06-01',
                  max_date = '2015-11-30',
                  adj_type = 'clip',
                  date = 'sale_date',
                  price = 'sale_price',
                  trans_id = 'sale_id',
                  prop_id = 'pinx',
                  seq_only = TRUE,
                  estimator = 'robust',
                  log_dep = TRUE,
                  trim_model = TRUE,
                  max_period = 48,
                  smooth = FALSE)


## ----rtindex_opt2_create_sales-------------------------------------------

  sales_hdf <- dateToPeriod(trans_df = ex_sales,
                            date = 'sale_date',
                            periodicity = 'monthly')


## ----rtindex_opt2--------------------------------------------------------
  rt_2 <- rtIndex(trans_df = sales_hdf,
                  date = 'sale_date',
                  price = 'sale_price',
                  trans_id = 'sale_id',
                  prop_id = 'pinx',
                  seq_only = FALSE,
                  estimator = 'weighted',
                  log_dep = FALSE,
                  trim_model = FALSE,
                  max_period = 56,
                  smooth = TRUE)


## ----rtindex_opt3_create_sales-------------------------------------------
  sales_rtdf <- rtCreateTrans(trans_df = sales_hdf,
                            prop_id = 'pinx',
                            trans_id = 'sale_id',
                            price = 'sale_price')


## ----rtindex_opt3--------------------------------------------------------
  rt_3 <- rtIndex(trans_df = sales_rtdf,
                  estimator = 'robust',
                  log_dep = TRUE,
                  trim_model = FALSE,
                  max_period = 80,
                  smooth = TRUE,
                  smooth_order = 5)


## ----plot_rt3`, fig.width=7, fig.height=2.5------------------------------
  plot(rt_3, smooth=TRUE)


## ----create_heddata------------------------------------------------------
  sales_hhdf <- hedCreateTrans(trans_df = ex_sales,
                               prop_id = 'pinx',
                               trans_id = 'sale_id',
                               price = 'sale_price',
                               date= 'sale_date',
                               periodicity = 'monthly')


## ----hedmodel_1----------------------------------------------------------
  hed_model <- hpiModel(hpi_df = sales_hhdf,
                        estimator = 'base',
                        dep_var = 'price',
                        ind_var = c('tot_sf', 'beds', 'baths'),
                        log_dep = TRUE)


## ----hedmodel_2----------------------------------------------------------
  model_spec <- as.formula('log(price) ~ as.factor(baths) + tot_sf')
  
  hed_model <- hpiModel(hpi_df = sales_hhdf,
                        estimator = 'base',
                        hed_spec = model_spec,
                        log_dep = TRUE)


## ----hedmodel_rob--------------------------------------------------------
  hed_model_rob <- hpiModel(hpi_df = sales_hhdf,
                            estimator = 'robust',
                            dep_var = 'price',
                            ind_var = c('tot_sf', 'beds', 'baths'),
                            log_dep = TRUE)


## ----hedmodel_wgt--------------------------------------------------------
  hed_model_wgt <- hpiModel(hpi_df = sales_hhdf,
                            estimator = 'weighted',
                            dep_var = 'price',
                            ind_var = c('tot_sf', 'beds', 'baths'),
                            log_dep = FALSE,
                            weights = runif(nrow(sales_hhdf), 0, 1))


## ----hed_to_index--------------------------------------------------------
  hed_index <- modelToIndex(model_obj = hed_model)


## ----plot_hedindex, fig.width=7, fig.height=2.5--------------------------
  plot(hed_index)


## ----hed_1---------------------------------------------------------------
  hed_1 <- hedIndex(trans_df = ex_sales,
                    periodicity = 'monthly',
                    min_date = '2010-06-01',
                    max_date = '2015-11-30',
                    adj_type = 'clip',
                    date = 'sale_date',
                    price = 'sale_price',
                    trans_id = 'sale_id',
                    prop_id = 'pinx',
                    estimator = 'robust',
                    log_dep = TRUE,
                    trim_model = TRUE,
                    max_period = 48,
                    dep_var = 'price',
                    ind_var = c('tot_sf', 'beds', 'baths'),
                    smooth = FALSE)


## ----create_hed2_data----------------------------------------------------
  sales_hdf <- dateToPeriod(trans_df = ex_sales,
                           date = 'sale_date',
                           periodicity = 'monthly',
                           min_date = '2010-02-01',
                           max_date = '2015-11-30',
                           adj_type = 'move')

## ----create_hed2---------------------------------------------------------
  hed_2 <- hedIndex(trans_df = sales_hdf,
                    date = 'sale_date',
                    price = 'sale_price',
                    trans_id = 'sale_id',
                    prop_id = 'pinx',
                    estimator = 'base',
                    log_dep = FALSE,
                    trim_model = FALSE,
                    max_period = 56,
                    dep_var = 'price',
                    ind_var = c('tot_sf', 'beds', 'baths'),
                    smooth = TRUE)


## ----hed3_create_sales---------------------------------------------------
  sales_hhdf <- hedCreateTrans(trans_df = sales_hdf,
                               prop_id = 'pinx',
                               trans_id = 'sale_id',
                               price = 'sale_price')


## ----hed3----------------------------------------------------------------
  hed_3 <- hedIndex(trans_df = sales_hhdf,
                    estimator = 'weighted',
                    log_dep = TRUE,
                    trim_model = FALSE,
                    max_period = 80,
                    dep_var = 'price',
                    ind_var = c('tot_sf', 'beds', 'baths'),
                    weights = runif(nrow(sales_hhdf), 0, 1),
                    smooth = TRUE,
                    smooth_order = 5)


## ----plot_hed3, fig.width=7, fig.height=2.5------------------------------
  plot(hed_3, smooth=TRUE)


## ----example_hpis--------------------------------------------------------
  rt_hpi <- rtIndex(trans_df = sales_rtdf,
                    estimator = 'robust',
                    log_dep = TRUE,
                    trim_model = FALSE,
                    max_period = 84,
                    smooth = TRUE)

  hed_hpi <- hedIndex(trans_df = sales_hhdf,
                      estimator = 'weighted',
                      log_dep = TRUE,
                      trim_model = FALSE,
                      max_period = 84,
                      dep_var = 'price',
                      ind_var = c('tot_sf', 'beds', 'baths'),
                      weights = runif(nrow(sales_hhdf), 0, 1),
                      smooth = TRUE)


## ----index_vol1----------------------------------------------------------
  index_vol <- calcVolatility(index = hed_hpi$index$value,
                              window = 3)
  names(index_vol)


## ----plot_vol, fig.width=7, fig.height=3.5-------------------------------
  plot(index_vol)


## ----indexvol_hpiindex---------------------------------------------------
 # hpinindex object
 index_vol <- calcVolatility(index = hed_hpi$index,
                             window = 3)

 # hpi object
 index_vol <- calcVolatility(index = hed_hpi,
                             window = 3)


## ----indexvol_smooth-----------------------------------------------------
  # Direct passing
  sindex_vol <- calcVolatility(index = hed_hpi$index$smooth,
                               window = 3)

  # While passing 'hpi' or 'hpiindex'
  sindex_vol <- calcVolatility(index = hed_hpi$index,
                               window = 3,
                               smooth = TRUE)


## ----indexvol_inplace----------------------------------------------------
   # Add it to the 'hpiindex' object
   hed_hpi$index <- calcVolatility(index = hed_hpi$index,
                                   window = 3,
                                   in_place = TRUE)

   # Add it to the full 'hpi' object (to the hpiindex object)
   hed_hpi <- calcVolatility(index = hed_hpi,
                             window = 3,
                             in_place = TRUE)


## ----indexvol_inplace_smooth---------------------------------------------
   hed_hpi <- calcVolatility(index = hed_hpi,
                             window = 3,
                             in_place = TRUE,
                             smooth = TRUE)
   names(hed_hpi$index)


## ----indexvol_rename-----------------------------------------------------
   hed_index <- calcVolatility(index = hed_hpi$index,
                               window = 3,
                               in_place = TRUE,
                               in_place_name = 'vol_3')
   names(hed_index)


## ----rt_is_acc-----------------------------------------------------------
   rt_is_accr <- calcAccuracy(hpi_obj = rt_hpi,
                              test_type = 'rt',
                              test_method = 'insample')
   attr(rt_is_accr, 'test_method')


## ----rt_is_accr_smooth---------------------------------------------------
    rts_is_accr <- calcAccuracy(hpi_obj = rt_hpi,
                                test_type = 'rt',
                                test_method = 'insample',
                                smooth = TRUE)


## ----rt_is_acc_inplace---------------------------------------------------
    # Returns an accuracy object in place
    hed_hpi <- calcAccuracy(hpi_obj = hed_hpi,
                            test_type = 'rt',
                            test_method = 'insample',
                            pred_df = sales_rtdf,
                            in_place = TRUE,
                            in_place_name = 'is_accuracy')
    names(hed_hpi)

    # Returns a smooth accuracy object in place
    hed_hpi <- calcAccuracy(hpi_obj = hed_hpi,
                            test_type = 'rt',
                            test_method = 'insample',
                            smooth = TRUE,
                            pred_df = rt_hpi$data,
                            in_place = TRUE,
                            in_place_name = 'smooth_is_accuracy')


## ----kf_accr-------------------------------------------------------------
  rt_kf_accr <- calcAccuracy(hpi_obj = rt_hpi,
                             test_type = 'rt',
                             test_method = 'kfold',
                             k = 10,
                             seed = 123)


## ----kf_accr_smooth------------------------------------------------------
  rt_kf_accr_s <- calcAccuracy(hpi_obj = rt_hpi,
                               test_type = 'rt',
                               test_method = 'kfold',
                               k = 10,
                               seed = 123,
                               smooth = TRUE)


## ----kf_accr_inplace-----------------------------------------------------
    hed_hpi <- calcAccuracy(hpi_obj = hed_hpi,
                            test_type = 'rt',
                            test_method = 'kfold',
                            k = 10,
                            seed = 1,
                            pred_df = rt_hpi$data,
                            in_place = TRUE,
                            in_place_name = 'kf_accuracy')


## ----plot_accr, fig.keep = 'first', fig.width=7, fig.height=3------------
  plot(hed_hpi$index$kf_accuracy)


## ----create_series, warning=FALSE, comments=FALSE, message=FALSE---------
   rt_series <- createSeries(hpi_obj = rt_hpi,
                             train_period = 24,
                             max_period = 30)


## ----plot_series, fig.width=7, fig.height=3.5----------------------------
  plot(rt_series)


## ----smooth_series-------------------------------------------------------
  rt_series <- smoothSeries(series_obj = rt_series,
                             order = 5)


## ----vol_series----------------------------------------------------------
  rt_series <- calcSeriesVolatility(series_obj = rt_series,
                                    window = 3,
                                    smooth = TRUE)
  

## ----series_acc_is-------------------------------------------------------
  rt_sacc <- calcSeriesAccuracy(series_obj = rt_series,
                                test_method = 'insample',
                                test_type = 'rt')
  class(rt_sacc)


## ----series_acc_smooth_inplace-------------------------------------------
  rt_series <- calcSeriesAccuracy(series_obj = rt_series,
                                  test_method = 'kfold',
                                  test_type = 'rt',
                                  smooth = TRUE,
                                  in_place=TRUE)


## ----summarize_series_acc------------------------------------------------
  series_acc_summ <- calcSeriesAccuracy(series_obj = rt_series,
                                        test_method = 'insample',
                                        test_type = 'rt',
                                        summarize = TRUE)
  nrow(series_acc_summ)
  nrow(rt_series$accuracy)


## ----fct_accr------------------------------------------------------------
  rt_series <- calcSeriesAccuracy(series_obj = rt_series,
                                  test_method = 'forecast',
                                  test_type = 'rt',
                                  smooth = TRUE,
                                  in_place = TRUE)


## ----eval=TRUE, messages=FALSE, echo=TRUE, fig.keep = 'first', fig.width=7, fig.height=3----
  plot(rt_series$accuracy_smooth)


## ----series_rev----------------------------------------------------------

  # Return to a revision object
  rt_rev <- calcRevision(series_obj = rt_series)

  # Return in place (with smooth)
  rt_series <- calcRevision(series_obj = rt_series,
                            in_place = TRUE,
                            smooth = TRUE)
  names(rt_series)
  

## ----plot_rtrev, fig.width=7, fig.height=3.5-----------------------------
  plot(rt_rev, measure='median')


