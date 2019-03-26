library(miceExt)


### Name: mice.binarize
### Title: Binarize Factor Columns in Data Frames
### Aliases: mice.binarize

### ** Examples



#------------------------------------------------------------------------------
# first set of examples illustrating basic functionality
#------------------------------------------------------------------------------

# binarize all factor columns in boys_data that contain NAs
boys_bin <- mice.binarize(boys_data)

# binarize only column 'gen' in boys_data
boys_bin <- mice.binarize(boys_data, cols = c("gen"))

# binarize all factor columns with the blocks ('hgt','bmi') and ('gen','phb')
# to impute on these (binarized) blocks later
boys_bin <- mice.binarize(boys_data, blocks = list(c("hgt","bmi"), c("gen", "phb")))

# read out binarized data
boys_bin$data



## Not run: 
##D #------------------------------------------------------------------------------
##D # Examples illustrating the combined usage of blocks and weights, relating to
##D # the examples in the input format section above. As before, we want to impute  
##D # on the column tuples ('hgt','bmi') and ('hc','gen','phb) from boys_data, while  
##D # assigning weights to the first block, in which 'hgt' gets a 1.5 times
##D # higher weight than 'bmi'. The second tuple is not weighted. 
##D #------------------------------------------------------------------------------
##D 
##D ## Now there are four options to specify the blocks and weights:
##D 
##D # First option: specify blocks and weights in list format
##D boys_bin <- mice.binarize(data = boys_data,
##D                                 blocks = list(c("hgt","bmi"), c("hc","gen","phb")),
##D                                 weights = list(c(3,2), NULL))
##D                               
##D # or equivalently, using colums indices:
##D boys_bin <- mice.binarize(data = boys_data,
##D                            blocks = list(c(2,4), c(5,6,7)),
##D                            weights = list(c(3,2), NULL))
##D                            
##D # Second option: specify blocks in list and weights in vector format
##D post_mammal <- mice.binarize(data = boys_data,
##D                                    blocks = c(0,1,0,1,2,2,2,0,0),
##D                                    weights = c(1,3,1,2,1,1,1,1,1))
##D 
##D # Third option: specify blocks in list format and weights in vector format
##D post_mammal <- mice.binarize(data = boys_data,
##D                                    blocks = list(c("hgt","bmi"), c("hc","gen", "phb")),
##D                                    weights = c(1,3,1,2,1,1,1,1,1))
##D 
##D # Fourth option: specify blocks in vector format and weights in list format.
##D # Note that the block number determines which tuple in the weights list it
##D # corresponds to, and within each tuple in the list the weight correspondence is
##D # determinded by left to right order of the data columns
##D post_mammal <- mice.binarize(data = boys_data,
##D                                    blocks = c(0,1,0,1,2,2,2,0,0),
##D                                    weights = list(c(3,2), NULL))
##D 
##D # check expanded blocks vector
##D boys_bin$blocks
##D 
##D # check expanded weights vector
##D boys_bin$weights
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





