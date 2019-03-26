library(GDINA)


### Name: att.structure
### Title: Generate hierarchical attribute structures
### Aliases: att.structure

### ** Examples

## Not run: 
##D #################
##D #
##D # Leighton et al. (2004, p.210)
##D #
##D ##################
##D # linear structure A1->A2->A3->A4->A5->A6
##D K <- 6
##D linear=list(c(1,2),c(2,3),c(3,4),c(4,5),c(5,6))
##D att.structure(linear,K)
##D 
##D # convergent structure A1->A2->A3->A5->A6;A1->A2->A4->A5->A6
##D K <- 6
##D converg <- list(c(1,2),c(2,3),c(2,4),
##D                c(3,4,5), #this is how to show that either A3 or A4 is a prerequisite to A5
##D                c(5,6))
##D att.structure(converg,K)
##D 
##D # convergent structure [the difference between this one and the previous one is that
##D #                       A3 and A4 are both needed in order to master A5]
##D K <- 6
##D converg2 <- list(c(1,2),c(2,3),c(2,4),
##D                c(3,5), #this is how to specify that both A3 and A4 are needed for A5
##D                c(4,5), #this is how to specify that both A3 and A4 are needed for A5
##D                c(5,6))
##D att.structure(converg2,K)
##D 
##D # divergent structure A1->A2->A3;A1->A4->A5;A1->A4->A6
##D diverg <- list(c(1,2),
##D                c(2,3),
##D                c(1,4),
##D                c(4,5),
##D                c(4,6))
##D att.structure(diverg,K)
##D 
##D # unstructured A1->A2;A1->A3;A1->A4;A1->A5;A1->A6
##D unstru <- list(c(1,2),c(1,3),c(1,4),c(1,5),c(1,6))
##D att.structure(unstru,K)
##D 
##D ## See Example 4 and 5 in GDINA function
## End(Not run)



