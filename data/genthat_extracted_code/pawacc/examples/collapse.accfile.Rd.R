library(pawacc)


### Name: collapse.accfile
### Title: Collapse raw accelerometer files into a summary dataset
### Aliases: collapse collapse.accfile
### Keywords: collapse Actigraph GT1M Actigraph GT3X

### ** Examples

## Not run: 
##D 
##D data(gt1m_sample)
##D 
##D collapse(gt1m_sample, palist = list(value = c(0, 100, 2000, 4000, 11000),
##D rescale.epoch = 60, labels = c("sedentary","light","moderate","vigorous","extreme_values"),
##D extreme = "last"), mwlist = list(value = 20,
##D nz = 0), collapse.by = "%Y-%m-%d", collapse.epoch = 60,
##D FUN.list = list(mean = function(x) round(mean(x, na.rm = TRUE),2)),
##D keep.extreme = FALSE, keep.error = FALSE)
##D $outcome
##D   collapse.by fileid outcome.mean sedentary  light moderate vigorous
##D 1  2011-12-08   test       117.63    293.75 243.75    29.75     4.00
##D 2  2011-12-09   test       157.83    349.75 143.25    33.50    24.50
##D 3  2011-12-10   test        79.75    468.25 177.25    24.25     6.25
##D 4  2011-12-11   test        57.96    355.50 126.00     8.50     3.25
##D 5  2011-12-12   test        70.05    455.50 157.25    19.50     6.00
##D 6  2011-12-13   test        72.99    475.50 181.50    15.25     8.00
##D 7  2011-12-14   test        79.94    476.25 210.50    20.25     8.50
##D 8  2011-12-15   test       232.50      0.00   0.50     0.00     0.00
##D 9  2011-12-16   test          NaN      0.00   0.00     0.00     0.00
##D   extreme_values non-wear
##D 1           0.00   388.75
##D 2           6.00   883.00
##D 3           0.50   763.50
##D 4           0.25   946.50
##D 5           0.00   801.75
##D 6           0.25   759.50
##D 7           1.50   723.00
##D 8           0.00  1439.50
##D 9           0.00   187.50
##D 
##D $call
##D collapse.accfile(object = gt1m_sample, palist = list(value = c(0, 
##D     100, 2000, 4000, 11000), rescale.epoch = 60, labels = c("sedentary", 
##D     "light", "moderate", "vigorous", "extreme_values"), extreme = "last"), 
##D     mwlist = list(value = 20, nz = 0), collapse.by = "##D 
##D     collapse.epoch = 60, FUN.list = list(mean = function(x) round(mean(x, 
##D         na.rm = TRUE), 2)), keep.extreme = FALSE, keep.error = FALSE)
##D 
##D attr(,"class")
##D [1] "accfile.collapse"
##D Warning message:
##D In collapse.accfile(gt1m_sample, palist = list(value = c(0, 100,  :
##D   NAs imputed where extreme counts found
## End(Not run)

## Not run: 
##D 
##D collapse(gt1m_sample, palist = list(value = c(0, 100, 2000, 4000, 11000),
##D rescale.epoch = 60, labels = c("sedentary","light","moderate","vigorous","extreme_values"),
##D extreme = "last"), mwlist = list(value = 20,
##D nz = 0), collapse.by = "%Y-%m-%d", collapse.epoch = 60,
##D FUN.list = list(mean = function(x) round(mean(x, na.rm = TRUE),2),
##D sd = function(x) round(sd(x, na.rm = TRUE),2),
##D "95th" = function(x) round(quantile(x, probs = .95, na.rm = TRUE),2)),
##D keep.extreme = TRUE, keep.error = FALSE)
##D $outcome
##D   collapse.by fileid outcome.mean outcome.sd outcome.95th sedentary  light
##D 1  2011-12-08   test       117.63     216.12       529.40    293.75 243.75
##D 2  2011-12-09   test       201.10     567.65      1085.60    349.75 143.25
##D 3  2011-12-10   test        81.97     221.33       465.50    468.25 177.25
##D 4  2011-12-11   test        59.80     172.08       320.35    355.50 126.00
##D 5  2011-12-12   test        70.05     188.49       401.00    455.50 157.25
##D 6  2011-12-13   test        74.08     207.55       386.85    475.50 181.50
##D 7  2011-12-14   test        87.42     275.27       415.30    476.25 210.50
##D 8  2011-12-15   test       232.50     222.74       374.25      0.00   0.50
##D 9  2011-12-16   test          NaN         NA           NA      0.00   0.00
##D   moderate vigorous extreme_values non-wear
##D 1    29.75     4.00           0.00   388.75
##D 2    33.50    24.50           6.00   883.00
##D 3    24.25     6.25           0.50   763.50
##D 4     8.50     3.25           0.25   946.50
##D 5    19.50     6.00           0.00   801.75
##D 6    15.25     8.00           0.25   759.50
##D 7    20.25     8.50           1.50   723.00
##D 8     0.00     0.00           0.00  1439.50
##D 9     0.00     0.00           0.00   187.50
##D 
##D $call
##D collapse.accfile(object = gt1m_sample, palist = list(value = c(0, 
##D     100, 2000, 4000, 11000), rescale.epoch = 60, labels = c("sedentary", 
##D     "light", "moderate", "vigorous", "extreme_values"), extreme = "last"), 
##D     mwlist = list(value = 20, nz = 0), collapse.by = "##D 
##D     collapse.epoch = 60, FUN.list = list(mean = function(x) round(mean(x, 
##D         na.rm = TRUE), 2), sd = function(x) round(sd(x, na.rm = TRUE), 
##D         2), `95th` = function(x) round(quantile(x, probs = 0.95, 
##D         na.rm = TRUE), 2)), keep.extreme = TRUE, keep.error = FALSE)
##D 
##D attr(,"class")
##D [1] "accfile.collapse"
## End(Not run)





