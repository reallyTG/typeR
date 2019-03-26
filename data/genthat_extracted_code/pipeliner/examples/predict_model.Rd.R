library(pipeliner)


### Name: predict_model
### Title: Generate machine learning model prediction
### Aliases: predict_model

### ** Examples

## Not run: 
##D data <- head(faithful)
##D m <- estimate_model(function(df) {
##D   lm(eruptions ~ 1 + waiting, df)
##D })
##D 
##D predict_model(m(data))(data, "pred_eruptions")
##D #   eruptions waiting pred_eruptions
##D # 1     3.600      79       3.803874
##D # 2     1.800      54       2.114934
##D # 3     3.333      74       3.466086
##D # 4     2.283      62       2.655395
##D # 5     4.533      85       4.209219
##D # 6     2.883      55       2.182492
## End(Not run)



