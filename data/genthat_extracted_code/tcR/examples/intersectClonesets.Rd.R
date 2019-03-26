library(tcR)


### Name: intersectClonesets
### Title: Intersection between sets of sequences or any elements.
### Aliases: intersectClonesets intersectCount intersectLogic
###   intersectIndices

### ** Examples

## Not run: 
##D data(twb)
##D # Equivalent to intersectClonesets(twb[[1]]$CDR3.nucleotide.sequence,
##D #                         twb[[2]]$CDR3.nucleotide.sequence)
##D # or intersectCount(twb[[1]]$CDR3.nucleotide.sequence,
##D #                    twb[[2]]$CDR3.nucleotide.sequence)
##D # First "n" stands for a "CDR3.nucleotide.sequence" column, "e" for exact match.
##D twb.12.n0e <- intersectClonesets(twb[[1]], twb[[2]], 'n0e')
##D stopifnot(twb.12.n0e == 46)
##D # First "a" stands for "CDR3.amino.acid.sequence" column.
##D # Second "v" means that intersect should also use the "V.gene" column.
##D intersectClonesets(twb[[1]], twb[[2]], 'ave')
##D # Works also on lists, performs all possible pairwise intersections.
##D intersectClonesets(twb, 'ave')
##D # Plot results.
##D vis.heatmap(intersectClonesets(twb, 'ave'), .title = 'twb - (ave)-intersection', .labs = '')
##D # Get elements which are in both twb[[1]] and twb[[2]].
##D # Elements are tuples of CDR3 nucleotide sequence and corresponding V-segment
##D imm.1.2 <- intersectLogic(twb[[1]], twb[[2]],
##D                            .col = c('CDR3.amino.acid.sequence', 'V.gene'))  
##D head(twb[[1]][imm.1.2, c('CDR3.amino.acid.sequence', 'V.gene')])
##D data(twb)
##D ov <- repOverlap(twb)
##D sb <- matrixSubgroups(ov, list(tw1 = c('Subj.A', 'Subj.B'), tw2 = c('Subj.C', 'Subj.D')));
##D vis.group.boxplot(sb)
## End(Not run)



