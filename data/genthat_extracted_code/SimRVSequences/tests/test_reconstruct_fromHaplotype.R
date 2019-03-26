library(testthat)
context("reconstruct_fromHaplotype")

data(EXmuts)

#Chromosome info we will need
#store the mutation data for chromosome 1
C1mut = EXmuts[which(EXmuts$chrom == 1), ]

#reformat so that mutations occur at consecutive positions
#this helps with testing.
C1mut$position = seq(1:nrow(C1mut))

#this will be the reduced chromosome map for chr 1
C1map = data.frame(chrom = 1,
                   start_pos = min(C1mut$position),
                   end_pos = max(C1mut$position))

test_that("reconstruct_fromHaplotype returns an identical sequence when no crossovers occur", {

  #initialize event_loc to an empty list, which is what we
  #observe when no crossovers are simulated
  event_loc = c()

  #create inherited haplotype matrix,
  #this will contain 1 row amd one column
  #the only entry will be the haplotype to inherit
  inherit_hap = matrix(sample(1:2, size = 1),
                       nrow = 1)

  #matrix with 1 stored for every mutation from paternal haplotype
  #and 2 for every mutation from maternal haplotype
  parent_hap = as.data.frame(matrix(c(rep(1, nrow(C1mut)), rep(2, nrow(C1mut))),
                                    nrow = 2, byrow = TRUE))


  #reconstruct the offspring sequence given the locations of crossovers
  #and the participating haplotype sequences.
  inherited_genomic_seq <- reconstruct_fromHaplotype(parental_genotypes = parent_hap,
                                                     CSNV_map = C1mut,
                                                     inherited_haplotype = inherit_hap,
                                                     chiasmata_locations = event_loc,
                                                     REDchrom_map = C1map)
  #since no crossovers occur every position should be equal
  #to the value stored in inherit_hap
  expect_true(all(inherited_genomic_seq == inherit_hap))
})

test_that("reconstruct_fromHaplotype returns the correct swaps and can handle superfluous swaps, i.e. multiple swaps between successive markers", {

  ## RUN THIS TEST LAST
  ## We alter C1mut to create a known issue that the previous
  ## tests are not meant to check for

  #Creating a large gap between the first 5 marker positions and the rest
  #so that it is likely that we will have successive chiasmatia with
  #no marker data inbetween
  C1mut$position[15:nrow(C1mut)] = C1mut$position[15:nrow(C1mut)] + 100

  #this will be the reduced chromosome map for chr 1
  C1map = data.frame(chrom = 1,
                     start_pos = min(C1mut$position),
                     end_pos = max(C1mut$position))

  #matrix with 1 stored for every mutation from paternal haplotype
  #and 2 for every mutation from maternal haplotype
  parent_hap = as.data.frame(matrix(c(rep(1, nrow(C1mut)), rep(2, nrow(C1mut))),
                                    nrow = 2, byrow = TRUE))

  #sample crossover locations over the area of interest in this chromosome
  event_loc = sort(runif(sample(1:6, size = 1), min(C1mut$position), max(C1mut$position)))


  #sample gametes for each crossover.
  #Note that some crossover events will be trivial if this gamete did
  #not pariticipate in the crossover.
  inherit_hap = matrix(sample(1:2,
                              size = (length(event_loc) + 1),
                              replace = TRUE),
                       nrow = 1)

  #store the assumed postions of the future chiasmata
  rl = rle(as.numeric(inherit_hap))$lengths

  cross_loc <- event_loc[cumsum(rl[-length(rl)])]

  inherited_genomic_seq <- reconstruct_fromHaplotype(parental_genotypes = parent_hap,
                                                     CSNV_map = C1mut,
                                                     inherited_haplotype = inherit_hap,
                                                     chiasmata_locations = event_loc,
                                                     REDchrom_map = C1map)


  # inherit_hap
  # event_loc
  # rl
  # cross_loc
  # rle(as.numeric(inherit_hap))$values
  # rle(as.numeric(inherited_genomic_seq))$values

  posDF = data.frame(pos  = c(C1mut$position, cross_loc),
                     type = c(rep("mut", length(C1mut$position)),
                              rep("swap", length(cross_loc))))
  posDF$mutbin = NA

  #labels mutations based on which segment they fall in
  posDF$mutbin[posDF$type=="mut"] = as.numeric(cut(C1mut$position,
      breaks = c(as.numeric(C1map$start_pos), cross_loc, as.numeric(C1map$end_pos)),
      include.lowest = TRUE, dig.lab = 6, labels = seq(1:length(rle(as.numeric(inherit_hap))$values))))

  #relabel: odd bins are the first value in inherited hap, even are the other
  posDF$mutbin[posDF$type=="mut"] = ifelse(is_odd(posDF$mutbin[posDF$type=="mut"]),
                                           rle(as.numeric(inherit_hap))$values[1],
                                           rle(as.numeric(inherit_hap))$values[2])
  posDF = posDF[order(posDF$pos), ]

  expect_equal(as.numeric(inherited_genomic_seq), posDF$mutbin[!is.na(posDF$mutbin)])

})
