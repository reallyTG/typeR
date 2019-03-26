## ----read_so-------------------------------------------------------------
filename <- system.file("extdata", "pheno.SO.xml",  package="libsoc")
so <- libsoc::so_SO_read(filename)

## ----estimates-----------------------------------------------------------
param <- so$SOBlock[[1]]$Estimation$PopulationEstimates$MLE
param

## ----parameter_estimates-------------------------------------------------
so$all_population_estimates()

## ----parameter_types-----------------------------------------------------
cols <- colnames(param)
so$variability_type(cols)

## ----correlations--------------------------------------------------------
so$correlation_parameters(cols)

## ----random_variables----------------------------------------------------
so$random_variable_from_variability_parameter(cols)

## ----covariance_matrix---------------------------------------------------
so$SOBlock[[1]]$Estimation$PrecisionPopulationEstimates$MLE$CovarianceMatrix

## ----standard_error------------------------------------------------------
so$SOBlock[[1]]$Estimation$PrecisionPopulationEstimates$MLE$StandardError

## ----standard_error2-----------------------------------------------------
so$all_standard_errors()

## ----relative_standard_error---------------------------------------------
so$SOBlock[[1]]$Estimation$PrecisionPopulationEstimates$MLE$RelativeStandardError

## ----OFV-----------------------------------------------------------------
so$SOBlock[[1]]$Estimation$OFMeasures$Deviance

## ----predictions---------------------------------------------------------
pred <- so$SOBlock[[1]]$Estimation$Predictions
head(pred, 20)

## ----columnType----------------------------------------------------------
attributes(pred)$columnType

## ----id_column-----------------------------------------------------------
libsoc::id_column(pred)

## ----id_column_name------------------------------------------------------
libsoc::id_column_name(pred)

## ----idv_column----------------------------------------------------------
libsoc::idv_column(pred)

## ----idv_column_name-----------------------------------------------------
libsoc::idv_column_name(pred)

## ----residuals-----------------------------------------------------------
res <- so$SOBlock[[1]]$Estimation$Residuals$ResidualTable
head(res, 20)

## ----messages------------------------------------------------------------
messages <- so$SOBlock[[1]]$TaskInformation$Message
messages[[1]]$Name
messages[[1]]$Content
messages[[1]]$Severity
messages[[1]]$Toolname
messages[[13]]$Content

## ----iofv----------------------------------------------------------------
iofv <- so$SOBlock[[1]]$Estimation$OFMeasures$IndividualContribToLL
head(iofv)

