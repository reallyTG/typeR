library(miceExt)


### Name: mice.post.matching
### Title: Post-processing of Imputed Data by Multivariate Predictive Mean
###   Matching
### Aliases: mice.post.matching

### ** Examples



## Not run: 
##D #------------------------------------------------------------------------------
##D # Example on modified 'mammalsleep' data set from mice, that has identical
##D # missing data patterns on the column tuples ('ps','sws') and ('mls','gt')
##D #------------------------------------------------------------------------------
##D 
##D # run mice on data set 'mammal_data' and obtain a mids object to post-process
##D mids_mammal <- mice(mammal_data)
##D 
##D 
##D # run function, as blocks have not been specified, it will automatically detect
##D # the column tuples with identical missing data patterns and then impute on
##D # these
##D post_mammal <- mice.post.matching(mids_mammal)
##D 
##D # read out which column tuples have been imputed on
##D post_mammal$blocks
##D 
##D # look into imputations within resulting mice::mids object
##D post_mammal$midsobj$imp
##D 
##D 
##D 
##D #------------------------------------------------------------------------------
##D # Example on original 'mammalsleep' data set from mice, in which we
##D # want to post-process the imputations in column 'sws' by only imputing values
##D # from rows whose value in 'pi' matches the value of 'pi' in the row we impute
##D # on.
##D #------------------------------------------------------------------------------
##D 
##D # run mice on data set 'mammal_data' and obtain a mids object to post-process
##D mids_mammal <- mice(mammalsleep)
##D 
##D 
##D # run function, specify 'sws' as the column to impute on, and specify 'pi' as
##D # the observed variable to consider in the matching
##D post_mammal <- mice.post.matching(mids_mammal, blocks = "sws", match_vars = "pi")
##D 
##D 
##D # look into imputations within resulting mice::mids object
##D post_mammal$midsobj$imp
##D 
##D 
##D 
##D #------------------------------------------------------------------------------
##D # Examples illustrating the combined usage of blocks and weights, relating to
##D # the examples in the input format section above. As before, we want to impute  
##D # on the column tuples ('ps','sws') and ('mls','gt') from mammal_data, while  
##D # this time assigning weights to the first block, in which 'ps' gets a 1.5 times
##D # higher weight than 'sws'. The second tuple is not weighted. 
##D #------------------------------------------------------------------------------
##D 
##D # run mice() first
##D mids_mammal <- mice(mammal_data)
##D 
##D ## Now there are five options to specify the blocks and weights:
##D 
##D # First option: specify blocks and weights in list format
##D post_mammal <- mice.post.matching(obj = mids_mammal,
##D                                  blocks = list(c("sws","ps"), c("mls","gt")),
##D                                  weights = list(c(3,2), NULL))
##D 
##D # or equivalently, using colums indices:                                  
##D post_mammal <- mice.post.matching(obj = mids_mammal,
##D                                  blocks = list(c(4,5), c(7,8)),
##D                                  weights = list(c(3,2), NULL))
##D 
##D # Second option: specify blocks and weights in vector format
##D post_mammal <- mice.post.matching(obj = mids_mammal,
##D                                  blocks = c(0,0,0,1,1,0,2,2,0,0,0),
##D                                  weights = c(1,1,1,3,2,1,1,1,1,1,1))
##D 
##D # Third option: specify blocks in list format and weights in vector format
##D post_mammal <- mice.post.matching(obj = mids_mammal,
##D                                  blocks = list(c("sws","ps"), c("mls","gt")),
##D                                  weights = c(1,1,1,3,2,1,1,1,1,1,1))
##D 
##D # Fourth option: specify blocks in vector format and weights in list format.
##D # Note that the block number determines which tuple in the weights list it
##D # corresponds to, and within each tuple in the list the weight correspondence is
##D # determinded by left to right order of the data columns
##D post_mammal <- mice.post.matching(obj = mids_mammal,
##D                                  blocks = c(0,0,0,1,1,0,2,2,0,0,0),
##D                                  weights = list(c(3,2), NULL))
##D 
##D # Fifth option: only specify weights in vector format. If the user knows
##D # beforehand that at least the column tuple he wants to impute and use weights
##D # on have the same missing value patterns, he can assign weights to these using
##D # the vector format, while letting mice.post.matching() find all other blocks
##D # with identical missing value patterns - possibly even more than just
##D # ('ps','sws') and ('mls','gt')
##D post_mammal <- mice.post.matching(obj = mids_mammal,
##D                                  weights = c(1,1,1,3,2,1,1,1,1,1,1))
##D 
##D 
##D 
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





