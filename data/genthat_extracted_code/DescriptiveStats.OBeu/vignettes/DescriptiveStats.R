## ----load, warning=FALSE, include=TRUE-----------------------------------
# load DescriptiveStats.OBeu
library(DescriptiveStats.OBeu)

## ---- echo=FALSE, include = TRUE-----------------------------------------
str(Wuppertal_df)

## ----analysis------------------------------------------------------------
wuppertalanalysis = ds.analysis(Wuppertal_df,outliers=FALSE, fr.select = "Produktbereich", tojson=TRUE) # json string format
jsonlite::prettify(wuppertalanalysis) # use prettify of jsonlite library to add indentation to the returned JSON string

## ----descriptive stats---------------------------------------------------
ds.statistics(Wuppertal_df) # list format

## ----descriptive stats to json-------------------------------------------
wuppertalstats = ds.statistics(Wuppertal_df, tojson = TRUE) # json  format
jsonlite::prettify(wuppertalstats) # use prettify of jsonlite library to add indentation to the returned JSON string

## ----hist----------------------------------------------------------------
ds.hist(Wuppertal_df$Amount, breaks= "Sturges") # list format

## ----hist json-----------------------------------------------------------
wuppertalhist = ds.hist(Wuppertal_df$Amount, breaks= "Sturges", tojson=TRUE) # json  format
jsonlite::prettify(wuppertalhist) # use prettify of jsonlite library to add indentation to the returned JSON string

## ----boxplot json--------------------------------------------------------
wuppertalbox = ds.boxplot(Wuppertal_df, width = 0.15 , outl = FALSE, tojson=TRUE) # json  format
jsonlite::prettify(wuppertalbox) # use prettify of jsonlite library to add indentation to the returned JSON string


## ----correlation json----------------------------------------------------
iriscorr = ds.correlation(iris, cor.method="pearson", tojson=TRUE) # json format
jsonlite::prettify(iriscorr) # use prettify of jsonlite library to add indentation to the returned JSON string


## ----frequency-----------------------------------------------------------
wuppertalfreq = ds.frequency(Wuppertal_df$Produktbereich, tojson = TRUE)
jsonlite::prettify(wuppertalfreq) # use prettify of jsonlite library to add indentation to the returned JSON string


## ----kurtosis------------------------------------------------------------
ds.kurtosis(Wuppertal_df$Amount, tojson=TRUE)

## ----skewness------------------------------------------------------------
ds.skewness(Wuppertal_df$Amount, tojson=TRUE)

