library(miceExt)


### Name: mice.factorize
### Title: Transform Imputations of Binarized Data Into Their Corresponding
###   Factors
### Aliases: mice.factorize

### ** Examples


## Not run: 
##D #------------------------------------------------------------------------------
##D # Example that illustrates the combined functionalities of mice.binarize(),
##D # mice.factorize() and mice.post.matching() on the data set 'boys_data', which
##D # contains the column blocks ('hgt','bmi') and ('hc','gen','phb') that have
##D # identical missing value patterns, and out of which the columns 'gen' and
##D # 'phb' are factors. We are going to impute both tuples blockwise, while
##D # binarizing the factor columns first. Note that we never need to specify any
##D # blocks or columns to binarize, as these are all determined automatically 
##D #------------------------------------------------------------------------------
##D 
##D # By default, mice.binarize() expands all factor columns that contain NAs,
##D # so the columns 'gen' and 'phb' are automatically binarized
##D boys_bin <- mice.binarize(boys_data)
##D 
##D # Run mice on binarized data, note that we need to use boys_bin$data to grab
##D # the actual binarized data and that we use the output predictor matrix
##D # boys_bin$pred_matrix which is recommended for obtaining better imputation
##D # models
##D mids_boys <- mice(boys_bin$data, predictorMatrix = boys_bin$pred_matrix)
##D 
##D # It is very likely that mice imputed multiple ones among one set of dummy
##D # variables, so we need to post-process. As recommended, we also use the output
##D # weights from mice.binarize(), which yield a more balanced weighting on the
##D # column tuple ('hc','gen','phb') within the matching. As in previous examples,
##D # both tuples are automatically discovered and imputed on
##D post_boys <- mice.post.matching(mids_boys, weights = boys_bin$weights)
##D 
##D # Now we can safely retransform to the original data, with non-binarized
##D # imputations
##D res_boys <- mice.factorize(post_boys$midsobj, boys_bin$par_list)
##D 
##D # Analyze the distribution of imputed variables, e.g. of the column 'gen',
##D # using the mice version of with()
##D with(res_boys, table(gen))
##D 
##D 
##D 
##D #------------------------------------------------------------------------------
##D # Similar example to the previous, that also works on 'boys_data' and
##D # illustrates some more advanced funtionalities of all three functions in miceExt: 
##D # This time we only want to post-process the column block ('gen','phb'), while
##D # weighting the first of these tuples twice as much as the second. Within the
##D # matching, we want to avoid matrix computations by using the euclidian distance
##D # to determine the donor pool, and we want to draw from three donors only.
##D #------------------------------------------------------------------------------
##D 
##D # Binarize first, we specify blocks in list format with a single block, so we 
##D # can omit an enclosing list. Similarly, we also specify weights in list format.
##D # Both blocks and weights will be expanded and can be accessed from the output
##D # to use them in mice.post.matching() later
##D boys_bin <- mice.binarize(boys_data, 
##D                          blocks = c("gen", "phb"), 
##D                          weights = c(2,1))
##D 
##D # Run mice on binarized data, again use the output predictor matrix from
##D # mice.binarize()
##D mids_boys <- mice(boys_bin$data, predictorMatrix = boys_bin$pred_matrix)
##D 
##D # Post-process the binarized columns. We use blocks and weights from the previous
##D # output, and set 'distmetric' and 'donors' as announced in the example
##D # description
##D post_boys <- mice.post.matching(mids_boys,
##D                                blocks = boys_bin$blocks,
##D                                weights = boys_bin$weights,
##D                                distmetric = "euclidian",
##D                                donors = 3L)
##D 
##D # Finally, we can retransform to the original format
##D res_boys <- mice.factorize(post_boys$midsobj, boys_bin$par_list)
## End(Not run)






