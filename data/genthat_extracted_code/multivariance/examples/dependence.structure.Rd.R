library(multivariance)


### Name: dependence.structure
### Title: determines the dependence structure
### Aliases: dependence.structure

### ** Examples

## No test: 
  # structures for the datasets included in the package
  dependence.structure(dep_struct_several_26_100)
  dependence.structure(dep_struct_star_9_100)
  dependence.structure(dep_struct_iterated_13_100)
  dependence.structure(dep_struct_ring_15_100)

  # basic examples:

  dependence.structure(coins(100)) # 3-dependent
  dependence.structure(coins(100),vec = c(1,1,2))
  # 3-dependent rv of which the first two rv are used together as one rv, thus 2-dependence.

  dependence.structure(cbind(coins(200),coins(200,k=5)),verbose = TRUE)
  #1,2,3 are 3-dependent, 4,..,9 are 6-dependent

  # similar to the the previous example, but
  # the pair 1,2 is treated as one sample,
  # anagously the pair 3,4. In the resulting structure one does not
  # see anymore that the dependence of 1,2,3,4 with the rest is due
  # to 4.
  dependence.structure(cbind(coins(200),coins(200,k=5)),
                             vec = c(1,2,1,2,3,4,5,6,7),verbose = TRUE)


### Advanced:

# How to check the empirical power of the detection algorithm?
# Use a dataset for which the structure is detected, e.g. dep_struct_several_26_100.
# run:
dependence.structure(dep_struct_several_26_100,
                     detection.aim = list(c(ncol(dep_struct_several_26_100))))
# The output provides the first detection aim. Now we run the same line with the added
# detection aim
dependence.structure(dep_struct_several_26_100,detection.aim = list(c(3,1, 1, 1, 2, 2, 2, 3, 4,
  5, 6, 7, 8, 8, 8, 9, 9, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 1, 2, 8, 9),
  c(ncol(dep_struct_several_26_100))))
# and get the next detection aim ... thus we finally obtain all detection aims.
# now we can run the code with new sample data ....
N = 100
dependence.structure(cbind(coins(N,2),tetrahedron(N),coins(N,4),tetrahedron(N),
                           tetrahedron(N),coins(N,3),coins(N,3),rnorm(N)),
                     detection.aim = list(c(3,1, 1, 1, 2, 2, 2, 3, 4, 5, 6, 7, 8, 8, 8,
  9, 9, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 1, 2, 8, 9),
  c(4,1, 1, 1, 2, 2, 2, 3, 4, 5, 6, 7, 8, 8, 8, 9, 9, 9, 10, 10, 10, 10, 11, 11, 11,
    11, 12, 1, 2, 8, 9, 10, 11),
  c(5, 1, 1, 1, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 8, 1,
    2, 4, 5, 6, 7, 3),
  c(5, 1, 1, 1, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 8, 1,
    2, 4, 5, 6, 7, 3)))$detected
# ... and one could start to store the results and compute the rate of successes.

# ... or one could try to check how many samples are necessary for the detection:
re = numeric(100)
for (i in 2:100) {
  re[i] =
    dependence.structure(dep_struct_several_26_100[1:i,],verbose = FALSE,
                         detection.aim = list(c(3,1, 1, 1, 2, 2, 2, 3, 4, 5, 6, 7, 8,
      8, 8, 9, 9, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 1, 2, 8, 9),
      c(4,1, 1, 1, 2, 2, 2, 3, 4, 5, 6, 7, 8, 8, 8, 9, 9, 9, 10, 10, 10, 10, 11, 11,
        11, 11, 12, 1, 2, 8, 9, 10, 11),
      c(5, 1, 1, 1, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7,
        8, 1, 2, 4, 5, 6, 7, 3),
      c(5, 1, 1, 1, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7,
        8, 1, 2, 4, 5, 6, 7, 3)))$detected
  print(paste("First", i,"samples. Detected?", re[i]==1))
}
cat(paste("Given the 1 to k'th row the structure is not detected for k =",which(re == FALSE),"\n"))
## End(No test)



