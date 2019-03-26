## ----setup, include=FALSE------------------------------------------------
  knitr::opts_chunk$set(echo = TRUE, collapse=TRUE, messages=FALSE, eval=FALSE)

## ----silent_library_load, echo=FALSE-------------------------------------
#  
#    suppressMessages(suppressWarnings(library(hpiR)))
#    suppressMessages(suppressWarnings(library(knitr)))
#    suppressMessages(suppressWarnings(library(magrittr)))
#  

## ----hpir_load-----------------------------------------------------------
#  
#    library(hpiR)
#  

## ----data_load-----------------------------------------------------------
#  
#    # Load all sales
#    data(seattle_sales)
#  
#    # Create a smaller sample of sales
#    ex_sales <- seattle_sales %>%
#      dplyr::filter(., area %in% c(13, 14, 15))
#  
#    # Or just load it
#    data(ex_sales)
#  

## ----create_hpidata------------------------------------------------------
#  
#    ex_hpidata <- dateToPeriod(trans_df = ex_sales,
#                               date = 'sale_date',
#                               periodicity = 'monthly')
#  

## ----class_hpidata-------------------------------------------------------
#  
#    class(ex_hpidata)
#  

## ----str_hpidata---------------------------------------------------------
#  
#    str(ex_hpidata)
#  

## ----create_rtdata-------------------------------------------------------
#  
#    ex_rtdata <- rtCreateTrans(trans_df = ex_hpidata,
#                               prop_id = 'pinx',
#                               trans_id = 'sale_id',
#                               price = 'sale_price')

## ----class_rtdata--------------------------------------------------------
#  
#    class(ex_rtdata)
#  

## ----str_rtdata----------------------------------------------------------
#  
#    str(ex_rtdata)
#  

## ----create_heddata------------------------------------------------------
#  
#    ex_heddata <- hedCreateTrans(trans_df = ex_sales,
#                                 prop_id = 'pinx',
#                                 trans_id = 'sale_id',
#                                 price = 'sale_price',
#                                 date = 'sale_date',
#                                 periodicity = 'monthly')
#  

## ----class_heddata-------------------------------------------------------
#  
#    class(ex_heddata)
#  

## ----str_heddata---------------------------------------------------------
#  
#      str(ex_heddata)
#  

## ----create_timematrix, echo=FALSE, eval=FALSE---------------------------
#  
#    # Created for internal purposes, not shown in Vignette
#    ex_timematrix <- rtTimeMatrix(ex_rtdata)
#  

## ----create_hpimodel-----------------------------------------------------
#  
#    ex_hpimodel <- hpiModel(hpi_df = ex_rtdata,
#                            estimator = 'base',
#                            log_dep = TRUE)
#  

## ----class_hpimodel------------------------------------------------------
#  
#     class(ex_hpimodel)
#  

## ----str_hpimodel--------------------------------------------------------
#  
#    str(ex_hpimodel, max.level=1)
#  

## ----create_model_obj----------------------------------------------------
#    ex_rtmodel <- ex_hpimodel$model_obj
#  

## ----class_model_obj-----------------------------------------------------
#    class(ex_rtmodel)
#  

## ----str_model_obj-------------------------------------------------------
#    str(ex_rtmodel, max.level=1, give.attr=FALSE)
#  

## ----create_hmodel_obj---------------------------------------------------
#    ex_hedmodel <- hpiModel(hpi_df = ex_heddata,
#                            estimator = 'base',
#                            dep_var = 'price',
#                            ind_var = c('tot_sf', 'beds', 'baths'),
#                            log_dep = TRUE)[["model_obj"]]
#  

## ----class_hmodel_obj----------------------------------------------------
#    class(ex_hedmodel)
#  

## ----str_hmodel_obj------------------------------------------------------
#      str(ex_hedmodel, max.level=1, give.attr=FALSE)
#  

## ----create_hpiindex-----------------------------------------------------
#    ex_hpiindex <- modelToIndex(model_obj = ex_hpimodel)
#  

## ----class_hpiindex------------------------------------------------------
#    class(ex_hpiindex)
#  

## ----str_hpiindex--------------------------------------------------------
#    str(ex_hpiindex, max.level=1)
#  

## ----create_smoothindex--------------------------------------------------
#    ex_smoothindex <- smoothIndex(ex_hpiindex)
#  

## ----class_smoothindex---------------------------------------------------
#    class(ex_smoothindex)
#  

## ----str_smoothindex-----------------------------------------------------
#    str(ex_smoothindex)
#  

## ----smooth_inplace------------------------------------------------------
#    temp_index <- smoothIndex(ex_hpiindex, in_place = TRUE)
#  

## ----class_smooth_inplace------------------------------------------------
#    class(temp_index)
#  

## ----class_smooth_inplaces-----------------------------------------------
#      class(temp_index$smooth)
#  

## ----str_smooth_inplace--------------------------------------------------
#      str(temp_index)
#  

## ----create_plotindex----------------------------------------------------
#    ex_plotindex <- plot(ex_hpiindex)
#  

## ----class_plotindex-----------------------------------------------------
#    class(ex_plotindex)
#  

## ----create_hpi----------------------------------------------------------
#    ex_hpi <- rtIndex(trans_df = ex_rtdata,
#                      estimator = 'robust',
#                      log_dep = TRUE,
#                      trim_model = TRUE,
#                      smooth = TRUE)
#  

## ----class_hpi-----------------------------------------------------------
#    class(ex_hpi)
#  

## ----str_hpi-------------------------------------------------------------
#    str(ex_hpi, max.level=1)
#  

## ----create_indexvolatility----------------------------------------------
#    ex_indexvolatility <- calcVolatility(index = ex_hpiindex,
#                                         window = 5)
#  

## ----class_indexvolatility-----------------------------------------------
#    class(ex_indexvolatility)
#  

## ----str_indexvolatility-------------------------------------------------
#    str(ex_indexvolatility)
#  

## ----vol_inplace---------------------------------------------------------
#    temp_index <- calcVolatility(index = ex_hpiindex,
#                                 window = 3,
#                                 in_place = TRUE)
#  

## ----class_volinplace1---------------------------------------------------
#    class(temp_index)
#  

## ----class_volinplace2---------------------------------------------------
#    class(temp_index$volatility)
#  

## ----str_volinplace------------------------------------------------------
#    str(temp_index, max.level=1, give.attr=FALSE)
#  

## ----create_volplot------------------------------------------------------
#    ex_plotvolatility <- plot(ex_indexvolatility)
#  

## ----class_volplot-------------------------------------------------------
#    class(ex_plotvolatility)
#  

## ----create_hpiaccr------------------------------------------------------
#    ex_hpiaccuracy <- calcAccuracy(hpi_obj = ex_hpi,
#                                   test_type = 'rt',
#                                   test_method = 'insample')

## ----class_hpiaccr-------------------------------------------------------
#    class(ex_hpiaccuracy)
#  

## ----str_hpiaccr---------------------------------------------------------
#    str(ex_hpiaccuracy)
#  

## ----hpia_inplace--------------------------------------------------------
#    temp_hpi <- calcAccuracy(hpi_obj = ex_hpi,
#                             test_type = 'rt',
#                             test_method = 'insample',
#                             in_place = TRUE)

## ----class_hpia_inplace1-------------------------------------------------
#    class(temp_hpi)
#  

## ----class_hpia_inplace2-------------------------------------------------
#    class(temp_hpi$accuracy)
#  

## ----str_hpia_inplace----------------------------------------------------
#    str(temp_hpi, max.level=1, give.attr=FALSE)
#  

## ----create_plotaccr, fig.keep='none'------------------------------------
#    ex_plotaccuracy <- plot(ex_hpiaccuracy, return_plot = TRUE)
#  

## ----class_plotaccr------------------------------------------------------
#    class(ex_plotaccuracy)
#  

## ----create_serieshpi----------------------------------------------------
#  
#    ex_serieshpi <- createSeries(hpi_obj = ex_hpi,
#                                 train_period = 48,
#                                 max_period = 60)

## ----class_serieshpi-----------------------------------------------------
#    class(ex_serieshpi)
#  

## ----str_serieshpi-------------------------------------------------------
#    str(ex_serieshpi, max.level=1)
#  

## ----create_plotserieshpi------------------------------------------------
#    ex_plotseries <- plot(ex_serieshpi)
#  

## ----class_plotserieshpi-------------------------------------------------
#    class(ex_plotseries)
#  

## ----create_seriesrevision-----------------------------------------------
#    ex_seriesrevision <- calcRevision(series_obj = ex_serieshpi)
#  

## ----class_seriesrevision------------------------------------------------
#    class(ex_seriesrevision)
#  

## ----str_seriesrevision--------------------------------------------------
#    str(ex_seriesrevision)
#  

## ----srev_inplace--------------------------------------------------------
#    temp_series <- calcRevision(series_obj = ex_serieshpi,
#                                in_place = TRUE)
#  

## ----class_srev_inplace1-------------------------------------------------
#    class(temp_series)
#  

## ----class_srev_inplace2-------------------------------------------------
#    class(temp_series$revision)
#  

## ----str_srev_inplace----------------------------------------------------
#    str(temp_series, max.level=1)
#  

## ----create_plotrevision-------------------------------------------------
#    ex_plotrevision <- plot(ex_seriesrevision)
#  

## ----class_plotrevision--------------------------------------------------
#    class(ex_plotrevision)
#  

## ----create_seriesaccr---------------------------------------------------
#    ex_seriesaccuracy <- calcSeriesAccuracy(series_obj = ex_serieshpi,
#                                            test_method = 'insample',
#                                            test_type = 'rt')
#  

## ----class_seriesaccr----------------------------------------------------
#    class(ex_seriesaccuracy)
#  

## ----str_seriesaccr------------------------------------------------------
#    str(ex_seriesaccuracy)
#  

## ----create_sainplace----------------------------------------------------
#    temp_series <- calcSeriesAccuracy(series_obj = ex_serieshpi,
#                                      test_method = 'insample',
#                                      test_type = 'rt',
#                                      in_place=TRUE)
#  

## ----class_sainplace-----------------------------------------------------
#    class(temp_series)
#  

## ----class_sainplace2----------------------------------------------------
#    class(temp_series$accuracy)
#  

## ----str_sainplace-------------------------------------------------------
#    str(temp_series, max.level=1)
#  

## ----create_plotsaccuracy, fig.keep='none'-------------------------------
#    ex_plotaccuracy <- plot(ex_seriesaccuracy, return_plot = TRUE)
#  

## ----class_plotsaccuracy-------------------------------------------------
#    class(ex_plotaccuracy)
#  

