## ---- eval = FALSE-------------------------------------------------------
#  library(santaR)
#  
#  # Load example data
#  tmp_data  <- acuteInflammation$data
#  tmp_meta  <- acuteInflammation$meta
#  
#  # Analyse data, with confidence bands and p-value
#  res_acuteInf_df5 <- santaR_auto_fit(inputData=tmp_data, ind=tmp_meta$ind, time=tmp_meta$time, group=tmp_meta$group, df=5, ncores=4, CBand=TRUE, pval.dist=TRUE)
#  # Input data generated: 0.13 secs
#  # Spline fitted:        1.05 secs
#  # ConfBands done:      18.98 secs
#  # p-val dist done:     35.43 secs
#  # total time:          55.59 secs
#  
#  length(res_acuteInf_df5)
#  # [1] 22
#  names(res_acuteInf_df5)
#  #  [1] "var_1"  "var_2"  "var_3"  "var_4"  "var_5"  "var_6"  "var_7"  "var_8"  "var_9"  "var_10" "var_11" "var_12" "var_13" "var_14" "var_15" "var_16" "var_17" "var_18"
#  # [19] "var_19" "var_20" "var_21" "var_22"

## ---- eval = FALSE-------------------------------------------------------
#  # Generate a summary
#  #   without a defined 'targetFolder', no csv or plots can be saved
#  pval_acuteInf_df5 <- santaR_auto_summary(SANTAObjList=res_acuteInf_df5, targetFolder=NA)
#  # p-value dist found
#  # Benjamini-Hochberg corrected p-value
#  
#  names(pval_acuteInf_df5)
#  # [1] "pval.all"     "pval.summary"
#  
#  pval_acuteInf_df5$pval.summary

## ---- results = "asis", echo = FALSE-------------------------------------
pval.summary            <- data.frame(matrix(c('dist', 'dist_BH', 17, 16, 8, 0, 0, 0), ncol=4))
colnames(pval.summary)  <- c('Test', 'Inf 0.05', 'Inf 0.01', 'Inf 0.001')
pander::pandoc.table(pval.summary)

## ---- eval = FALSE-------------------------------------------------------
#  pval_acuteInf_df5$pval.all

## ---- results = "asis", echo = FALSE-------------------------------------
pval.all <- data.frame(matrix(c(0.009990010, 0.007992008, 0.006993007, 0.209790210, 0.005994006, 0.008991009, 0.013986014, 0.009990010, 0.038961039, 0.034965035, 0.013986014, 0.214785215, 0.066933067, 0.154845155, 0.008991009, 0.015984016, 0.019980020, 0.029970030, 0.053946054, 0.023976024, 0.022977023, 0.007992008, 0.01829662, 0.01569580, 0.01436896, 0.23611241, 0.01302000, 0.01700412, 0.02334465, 0.01829662, 0.05282484, 0.04824640, 0.02334465, 0.24130467, 0.08413827, 0.17858350, 0.01700412, 0.02581244, 0.03066597, 0.04246854, 0.06973190, 0.03543451, 0.03424914, 0.01569580, 0.005433704, 0.004053809, 0.003390296, 0.185689133, 0.002748896, 0.004735847, 0.008347097, 0.005433704, 0.028625807, 0.025242819, 0.008347097, 0.190448652, 0.053042348, 0.133748457, 0.004735847, 0.009860016, 0.012967910, 0.021068901, 0.041574088, 0.016160798, 0.015355810, 0.004053809, -0.2429725352, 0.0006572238, -0.1309866546, -0.3878298395, -0.5634863016, -0.4766589789, -0.5628753031, -0.4678733066, -0.3890447845, -0.0501685235, 0.0568042664, 0.1530029385, -0.4077714803, -0.0650366487, 0.1268468873,  0.5054671665, 0.2797620452,  0.4027539783, 0.5014823976, 0.3899306066, 0.1458163093, -0.2074773622, 0.02747253, 0.02747253, 0.02747253, 0.21478521, 0.02747253, 0.02747253, 0.03076923, 0.02747253, 0.05042017, 0.04807692, 0.03076923, 0.21478521, 0.07750145, 0.17032967, 0.02747253, 0.03196803, 0.03663004, 0.04395604, 0.06593407, 0.03767661, 0.03767661, 0.02747253), ncol=5))
colnames(pval.all) <- c("dist", "dist_upper", "dist_lower", "curveCorr", "dist_BH")
rownames(pval.all) <- c("var_1", "var_2", "var_3", "var_4", "var_5", "var_6", "var_7", "var_8", "var_9", "var_10", "var_11", "var_12", "var_13", "var_14", "var_15", "var_16", "var_17", "var_18", "var_19", "var_20", "var_21", "var_22")
pander::pandoc.table(pval.all)

## ---- eval = FALSE-------------------------------------------------------
#  # Rename the results
#  inSp        <- res_acuteInf_df5
#  # Save to disk
#  outputPath  <- file.path('path_to_my_output_folder', 'acuteInf_results.rdata')
#  save(inSp, file=outputPath, compress=TRUE)

